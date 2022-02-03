import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/core/db/app_db.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/string_constants.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/button_widget.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    elevation: 8.0,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                35.heightBox,
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        navigator.pop();
                      },
                      child: Image(
                        image: AssetImage(ImageConstants.cross),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),

                10.heightBox,

                //IMAGE
                Container(
                  height: 92,
                  width: 92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      image: DecorationImage(
                          image: NetworkImage(appDB.user.profileImage!),
                          fit: BoxFit.cover)),
                ),
                10.heightBox,

                appDB.user.fullName!.text
                    .textStyle(textBoldBlack(context, 0.035))
                    .make(),
              ],
            ),
          ),

          //Divider
          Divider(
            thickness: 0.4,
            color: Colors.grey.shade300,
          ),

          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              //Home
              createDrawerBodyItem(context,
                  icon: ImageConstants.nav_home,
                  text: StringConstants.home,
                  onTap: () {}),

              //MyBooking
              createDrawerBodyItem(context,
                  icon: ImageConstants.nav_booking,
                  text: StringConstants.my_booking,
                  onTap: () {}),

              //fav ent
              createDrawerBodyItem(context,
                  icon: ImageConstants.nav_fav,
                  text: StringConstants.favorite,
                  onTap: () {}),

              //chat
              createDrawerBodyItem(context,
                  icon: ImageConstants.nav_chat,
                  text: StringConstants.chat,
                  onTap: () {}),

              //nav_saved_address
              createDrawerBodyItem(context,
                  icon: ImageConstants.nav_saved_address,
                  text: StringConstants.saved_address,
                  onTap: () {}),

              //nav_payment
              createDrawerBodyItem(context,
                  icon: ImageConstants.nav_payment,
                  text: StringConstants.payment_method,
                  onTap: () {}),

              //nav_settings
              createDrawerBodyItem(context,
                  icon: ImageConstants.nav_settings,
                  text: StringConstants.settings,
                  onTap: () {}),

              35.heightBox,

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: AppButton(
                  "Logout",
                  () {
                    print('Tapped Logout');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget createDrawerBodyItem(BuildContext context,
    {String? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
    title: Row(
      children: <Widget>[
        Image(
          image: AssetImage(icon!),
          height: 20,
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: text!.text
              .textStyle(textMediumBlack(context, number: 0.020))
              .make(),
        )
      ],
    ),
    onTap: onTap,
  );
}
