import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/core/db/app_db.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/model/main_category_response.dart';
import 'package:wnees_demo/ui/common/drawer.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/loading.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = HomeBloc(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _homeBloc.dispose();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.whiteColor,
      drawer: buildDrawer(context),
      body: SafeArea(
        child: StreamBuilder<bool>(
            stream: _homeBloc.showLoading,
            builder: (context, snapshot) {
              return Loading(
                status: snapshot.data ?? false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Header
                      _headerIcons(context),
                      15.heightBox,
                      //Name and City
                      _nameAndCity(context),

                      10.heightBox,

                      StreamBuilder<List<MainCategoryResponse>?>(
                          stream: _homeBloc.mainCategoryResponse,
                          builder: (context, snapshot) {
                            List<MainCategoryResponse> mainCategoryList =
                                snapshot.data ?? [];

                            return Expanded(
                              child: AnimationLimiter(
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(
                                        parent: ClampingScrollPhysics()),
                                    itemCount: mainCategoryList.length,
                                    itemBuilder: (context, index) {
                                      MainCategoryResponse sampleData =
                                          mainCategoryList[index];
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                              position: index,
                                              duration:
                                                  const Duration(seconds: 1),
                                              columnCount:
                                                  mainCategoryList.length,
                                              child: SlideAnimation(
                                                child: _categoryItemWidget(
                                                    context, sampleData),
                                              ));
                                    }),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _headerIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Image(
              image: AssetImage(ImageConstants.drawer),
              height: 30,
              width: 30,
            )),
        Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 5, top: 2, bottom: 2),
              child: InkWell(
                  onTap: () {},
                  child: Image(
                    image: AssetImage(ImageConstants.notification),
                    height: 22,
                    width: 22,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
              child: InkWell(
                  onTap: () {},
                  child: Image(
                    image: AssetImage(ImageConstants.mail),
                    height: 25,
                    width: 25,
                  )),
            ),
          ],
        )
      ],
    );
  }

  Widget _nameAndCity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: "Hello, ",
              style: textMediumSecondary(context, number: 0.026),
              children: [
                TextSpan(
                  text: appDB.user.fullName ?? "",
                  style: textBoldBlack(context, 0.026),
                )
              ]),
        ),
        RichText(
          text: TextSpan(
              text: appDB.user.cityName,
              style: textMediumSecondary(context),
              children: [
                WidgetSpan(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 3),
                  child: Image(
                    image: AssetImage(ImageConstants.arrow_down),
                    height: 13,
                    width: 13,
                  ),
                ))
              ]),
        ),
      ],
    );
  }

  Widget _categoryItemWidget(
      BuildContext context, MainCategoryResponse sampleData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        5.heightBox,
        GestureDetector(
          onTap: () {
            navigator.pushNamed(RoutesName.category, arguments: sampleData);
          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(sampleData.image ?? ""),
                    colorFilter: const ColorFilter.mode(
                        Colors.black12, BlendMode.colorDodge),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstants.gradient),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(9),
                )),
              ),
              Positioned(
                  bottom: 10,
                  left: 20,
                  child: sampleData.name!.text
                      .textStyle(textSemiBoldBlack(context, 0.026))
                      .color(colors.whiteColor)
                      .make())
            ],
          ),
        ),
        5.heightBox
      ],
    );
  }
}
