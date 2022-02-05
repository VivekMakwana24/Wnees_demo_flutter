import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/omi_extensions.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/button_widget.dart';

class EntertainerProfile extends StatefulWidget {
  const EntertainerProfile({Key? key}) : super(key: key);

  @override
  _EntertainerProfileState createState() => _EntertainerProfileState();
}

class _EntertainerProfileState extends State<EntertainerProfile> {
  @override
  Widget build(BuildContext context) {
    Entertainer? entertainer =
        ModalRoute.of(context)!.settings.arguments as Entertainer?;
    return Scaffold(
      backgroundColor: colors.whiteColor,
      body: Column(
        children: [
          buildServiceAppBar(entertainer, context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView(children: [
                //Card 1
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colors.editTextBg,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //PROFILE DETAILS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //region Entertainer PROFILE
                            SizedBox(
                              height: height(context) * 0.15,
                              width: width(context) * 0.30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: FadeInImage.memoryNetwork(
                                  image: entertainer!.profileImage ?? "",
                                  placeholder: kTransparentImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //endregion Profile

                            10.widthBox,

                            //region ProfileDetails
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                entertainer.fullName!.text
                                    .maxLines(2)
                                    .textStyle(textBoldBlack(context, 0.024))
                                    .make(),
                                5.heightBox,
                                Row(
                                  children: [
                                    SmoothStarRating(
                                        allowHalfRating: false,
                                        onRated: (v) {},
                                        starCount: 5,
                                        rating: double.parse(
                                            entertainer.avgRating!),
                                        size: 20.0,
                                        isReadOnly: true,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star,
                                        color: Colors.grey,
                                        borderColor: Colors.grey,
                                        spacing: 0.0),
                                    5.widthBox,
                                    "${entertainer.avgRating} | ${entertainer.totalRating}"
                                        .text
                                        .color(colors.secondaryTextColor)
                                        .make()
                                  ],
                                ),
                                5.heightBox,
                                SizedBox(
                                    height: 30,
                                    width: 70,
                                    child: AppButton(
                                      "${entertainer.entertainmentType}",
                                      () {},
                                      padding: 3,
                                      radius: 5,
                                    )),
                              ],
                            )
                            //endregion ProfileDetails
                          ],
                        ),
                        10.heightBox,

                        //PRICING
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible:
                                  (entertainer.perDayPrice! > 0) ? true : false,
                              child: Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colors.whiteColor),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: RichText(
                                        text: TextSpan(
                                            text:
                                                "SAR ${entertainer.perDayPrice}",
                                            style: textBold14,
                                            children: [
                                              TextSpan(
                                                text: " / Day",
                                                style: textLight12(context),
                                              )
                                            ]),
                                      ),
                                    )),
                              ),
                            ),
                            15.widthBox,
                            Visibility(
                              visible: (entertainer.perHourPrice! > 0)
                                  ? true
                                  : false,
                              child: Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colors.whiteColor),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: RichText(
                                        text: TextSpan(
                                            text:
                                                "SAR ${entertainer.perHourPrice}",
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
                              ),
                            )
                          ],
                        ),

                        20.heightBox,

                        //BIO
                        "TEST TEST TEST TESTTESTTEST"
                            .text
                            .textStyle(textLight12(context))
                            .color(colors.secondaryTextColor)
                            .make()
                      ],
                    ),
                  ),
                ),

                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageConstants.ic_rect_green,
                      height: 15,
                      width: 15,
                    ),
                    10.widthBox,
                    "Talents".text.textStyle(textMedium2(context,number: 0.020)).make()
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget buildServiceAppBar(Entertainer? entertainer, BuildContext context) {
    return Stack(
      children: [
        FadeInImage.memoryNetwork(
          width: double.infinity,
          height: height(context) * 0.20,
          image: entertainer!.profileImage.toString(),
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
                    colors.accentColor.withOpacity(0.7), BlendMode.darken),
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
                      Icons.share,
                      color: colors.whiteColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: colors.whiteColor,
                    ))
              ],
            )),
        10.heightBox,
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ))
      ],
    );
  }
}
