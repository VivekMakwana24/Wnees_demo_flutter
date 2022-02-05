import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/model/sub_category_response.dart';
import 'package:wnees_demo/ui/dashboard/services/services_bloc.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/omi_extensions.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/button_widget.dart';

class EntertainerServicePage extends StatefulWidget {
  const EntertainerServicePage({Key? key}) : super(key: key);

  @override
  _EntertainerServicePageState createState() => _EntertainerServicePageState();
}

class _EntertainerServicePageState extends State<EntertainerServicePage> {
  List<Color> _color = [
    Colors.white54,
    Colors.white54,
    Colors.white54,
    Colors.white54,
    Colors.white54,
    Colors.white54,
  ];

  late Tag _selectedSampleData;

  late ServicesBloc _servicesBloc;

  @override
  void initState() {
    _servicesBloc = ServicesBloc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SubCategoryResponse? sampleData =
        ModalRoute.of(context)!.settings.arguments as SubCategoryResponse?;

    return Scaffold(
      backgroundColor: colors.whiteColor,
      body: Column(
        children: [
          buildServiceAppBar(sampleData, context),

          //EntertainerList
          Expanded(
            child: StreamBuilder<ServicesResponse?>(
                stream: _servicesBloc.serviceResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Entertainer>? entertainerList;
                    if (snapshot.data!.entertainer != null) {
                      entertainerList = snapshot.data!.entertainer!;
                    }
                    return AnimationLimiter(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: entertainerList?.length ?? 0,
                          itemBuilder: (context, index) {
                            final sampleData = entertainerList![index];
                            return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: entertainerList.length,
                                child: ScaleAnimation(
                                    scale: 0.8,
                                    child:
                                        _entertainerItem(context, sampleData)));
                          }),
                    );
                  } else {
                    return const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: colors.accentColor,
                        ));
                  }
                  /*  if (snapshot.connectionState ==
                             ConnectionState.done) {
                           List<Entertainer> entertainerList;
                           if (snapshot.data.entertainer != null) {
                             entertainerList = snapshot.data.entertainer;
                           }
                           return AnimationLimiter(
                             child: ListView.builder(
                                 physics: const BouncingScrollPhysics(
                                     parent: AlwaysScrollableScrollPhysics()),
                                 itemCount: entertainerList.length,
                                 itemBuilder: (context, index) {
                                   final sampleData = entertainerList[index];
                                   return AnimationConfiguration.staggeredGrid(
                                       position: index,
                                       columnCount: entertainerList.length,
                                       child: ScaleAnimation(
                                           scale: 0.8,
                                           child: _entertainerItem(
                                               context, sampleData)));
                                 }),
                           );
                         }
                         if (snapshot.connectionState ==
                             ConnectionState.waiting) {
                           return CircularProgressIndicator();
                         }
*/
                  /*if (snapshot.connectionState ==
                                 ConnectionState.none ||
                             snapshot.connectionState ==
                                 ConnectionState.active) {
                           return "No data found".text.make();
                         }*/
                }),
          )
        ],
      ),
    );
  }

  Widget buildServiceAppBar(
      SubCategoryResponse? sampleData, BuildContext context) {
    return Stack(
      children: [
        FadeInImage.memoryNetwork(
          width: double.infinity,
          height: height(context) * 0.20,
          image: sampleData!.image.toString(),
          placeholder: kTransparentImage,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            width: double.infinity,
            height: height(context) * 0.20,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.gradient),
                colorFilter: ColorFilter.mode(
                    Colors.black87.withOpacity(0.5), BlendMode.darken),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 10,
            top: 5,
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.black54,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded),
                color: const Color(0xffffffff),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: colors.whiteColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter,
                      color: colors.whiteColor,
                    ))
              ],
              title: Text(
                sampleData.name!,
                style:
                    textRegularBlack(context, 0.021, color: colors.whiteColor),
              ),
            )),
        10.heightBox,
        Positioned(
          left: 20,
          right: 0,
          top: 90,
          child: StreamBuilder<ServicesResponse?>(
              stream: _servicesBloc.serviceResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Tag>? tagList = snapshot.data!.tag;
                  debugPrint("LENGTH = ${tagList!.length}");
                  return SizedBox(
                    height: 45,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: tagList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Tag sampleData = tagList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (_selectedSampleData != null) {
                                    _selectedSampleData.isSelected = false;
                                    // _color[index] = Colors.white54;
                                  }
                                  tagList[index].isSelected =
                                      !tagList[index].isSelected!;

                                  _selectedSampleData = tagList[index];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: tagList[index].isSelected == true
                                        ? colors.primaryColor
                                        : Colors.white54),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: sampleData.name!.text
                                        .textStyle(
                                            tagList[index].isSelected == true
                                                ? textBoldBlack(context, 0.018)
                                                : textMediumBlack(context))
                                        .color(tagList[index].isSelected == true
                                            ? colors.whiteColor
                                            : colors.whiteColor)
                                        .make()
                                        .px16()),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return Container();
                }
              }),
        )
      ],
    );
  }

  Widget _entertainerItem(BuildContext context, Entertainer sampleData) {
    bool isDayVisible = (sampleData.perDayPrice! > 0) ? true : false;
    bool isHourVisible = (sampleData.perHourPrice! > 0) ? true : false;

    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 20, left: 16, right: 16),
      child: InkWell(
        onTap: () {
          navigator.pushNamed(RoutesName.entertainerProfile,
              arguments: sampleData);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Image
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height(context) * 0.17,
                  width: width(context) * 0.33,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.memoryNetwork(
                      image: sampleData.profileImage!,
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                15.widthBox,

                //Name and Fav
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 9,
                            child: sampleData.fullName!.text
                                .maxLines(2)
                                .textStyle(textBoldBlack(context, 0.024))
                                .make(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image(
                              image: AssetImage(ImageConstants.ic_unfavourite),
                              height: 20,
                              width: 20,
                            ),
                          )
                        ],
                      ),
                      5.heightBox,

                      //Ratings
                      Row(
                        children: [
                          SmoothStarRating(
                              allowHalfRating: false,
                              onRated: (v) {},
                              starCount: 5,
                              rating: 4,
                              size: 20.0,
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star,
                              color: Colors.green,
                              borderColor: Colors.green,
                              spacing: 0.0),
                          5.widthBox,
                          "0.0 | 0".text.color(colors.secondaryTextColor).make()
                        ],
                      ),
                      10.heightBox,

                      SizedBox(
                          height: 25,
                          width: 70,
                          child: AppButton(
                            "asdasd",
                            () {},
                            padding: 3,
                            radius: 5,
                          )),

                      10.heightBox,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible:
                                (sampleData.perDayPrice! > 0) ? true : false,
                            child: Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: colors.editTextBg),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "SAR ${sampleData.perDayPrice}",
                                        style: textBold14,
                                        children: [
                                          TextSpan(
                                            text: " / Day",
                                            style: textLight12(context),
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          15.widthBox,
                          Visibility(
                            visible:  (sampleData.perHourPrice! > 0) ? true : false,
                            child: Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: colors.editTextBg),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "SAR ${sampleData.perHourPrice}",
                                        style: textBold14,
                                        children: [
                                          TextSpan(
                                            text: " / Hour",
                                            style: textLight12(context),
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            //Ratings
          ],
        ),
      ),
    );
  }
}
