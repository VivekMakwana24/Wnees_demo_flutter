import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/omi_extensions.dart';
import 'package:wnees_demo/values/styles.dart';

class EntertainerProfile extends StatefulWidget {
  const EntertainerProfile({Key? key}) : super(key: key);

  @override
  _EntertainerProfileState createState() => _EntertainerProfileState();
}

class _EntertainerProfileState extends State<EntertainerProfile> {
  @override
  Widget build(BuildContext context) {
    Entertainer? entertainer = ModalRoute.of(context)!.settings.arguments as Entertainer?;
    return Scaffold(
      backgroundColor: colors.accentColor,
      body: Column(
        children: [buildServiceAppBar(entertainer, context)],
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
      ],
    );
  }
}
