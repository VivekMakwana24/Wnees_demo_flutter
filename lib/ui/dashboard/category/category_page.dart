import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/model/main_category_response.dart';
import 'package:wnees_demo/model/sub_category_response.dart';
import 'package:wnees_demo/ui/dashboard/category/category_bloc.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/app_bar.dart';
import 'package:wnees_demo/widgets/common_circular_progress_indicator.dart';
import 'package:wnees_demo/widgets/text_form_filed.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late CategoryBloc _categoryBloc;

  @override
  void initState() {
    _categoryBloc = CategoryBloc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MainCategoryResponse? sampleData =
        ModalRoute.of(context)!.settings.arguments as MainCategoryResponse?;
    return Scaffold(
      backgroundColor: colors.whiteColor,
      appBar: buildAppBar(sampleData!.name, context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.heightBox,
            AppTextField(
              hint: "Musician",
              filled: true,
              onChanged: (value) {
                _categoryBloc.getSubCategoryList(searchText: value);
              },
              contentPadding: const EdgeInsets.only(
                  left: 15.0, bottom: 10.0, top: 10.0, right: 15),
              prefixIcon: const Icon(
                Icons.search,
                color: colors.blackColor,
              ),
              label: 'Musician',
            ),
            15.heightBox,
            StreamBuilder<bool>(
                stream: _categoryBloc.showLoading,
                builder: (context, snapShotLoading) {
                  var isLoading = false;
                  if (snapShotLoading.data != null) {
                    isLoading = snapShotLoading.data!;
                    print("isLoading $isLoading");
                  }

                  return StreamBuilder<List<SubCategoryResponse>?>(
                      stream: _categoryBloc.subCategoryResponse,
                      builder: (context, snapshot) {
                        List<SubCategoryResponse>? subCategoryList =
                            snapshot.data ?? [];

                        return isLoading? CommonCircularProgressIndicator()
                            : Expanded(
                                child: AnimationLimiter(
                                child: StaggeredGridView.countBuilder(
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 12,
                                    itemCount: subCategoryList.length,
                                    itemBuilder: (context, index) {
                                      final categoryData =
                                          subCategoryList[index];
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                              position: index,
                                              columnCount:
                                                  subCategoryList.length,
                                              child: ScaleAnimation(
                                                  scale: 0.8,
                                                  child: _categoryItem(
                                                      context, categoryData)));
                                    },
                                    staggeredTileBuilder: (index) {
                                      return StaggeredTile.count(
                                          1, index.isEven ? 1.2 : 1.4);
                                    }),
                              ));
                      });
                })
          ],
        ),
      ),
    );
  }

  Widget _categoryItem(BuildContext context, SubCategoryResponse categoryData) {
    return GestureDetector(
      onTap: () {
        navigator.pushNamed(RoutesName.service, arguments: categoryData);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: categoryData.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage(ImageConstants.gradient),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
          Positioned(
              left: 10,
              bottom: 10,
              child: categoryData.name!.text
                  .textStyle(textSemiBoldBlack(context, 0.023))
                  .color(colors.whiteColor)
                  .make())
        ],
      ),
    );
  }
}
