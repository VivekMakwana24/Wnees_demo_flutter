import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/omi_extensions.dart';
import 'package:wnees_demo/values/string_constants.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/app_utils.dart';
import 'package:wnees_demo/widgets/loading.dart';
import 'package:wnees_demo/widgets/text_form_filed.dart';

import 'otp_verification_bloc.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late OtpVerificationBloc _otpVerificationBloc;

  @override
  void initState() {
    _otpVerificationBloc = OtpVerificationBloc(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _otpVerificationBloc.dispose();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.primaryColor,
      child: SafeArea(
        child: StreamBuilder<bool>(
            stream: _otpVerificationBloc.showLoading,
            builder: (context, snapshot) {
              return Loading(
                status: snapshot.data!,
                child: Material(
                  color: colors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 10, top: 15, right: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              navigator.pop();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: colors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: "Wnees",
                        child: SizedBox(
                            height: height(context) * 0.10,
                            width: width(context) * 0.38,
                            child: Image(
                                image: AssetImage(ImageConstants.wnees_img))),
                      ),
                      15.heightBox,
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: colors.whiteColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                    color: colors.whiteColor, blurRadius: 5)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                45.heightBox,
                                StringConstants.otp_verification.text
                                    .textStyle(textRegularBlack(context, .040))
                                    .make(),
                                10.heightBox,
                                StringConstants.otp_verification_desc.text
                                    .textStyle(
                                        textRegularSecondary(context, .020))
                                    .align(TextAlign.center)
                                    .make(),

                                40.heightBox,

                                //OTP
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: colors.colorTextFieldBg),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: StreamBuilder<Object>(
                                            stream: _otpVerificationBloc.otp,
                                            builder: (context, snapshot) {
                                              return AppTextField(
                                                textStyle: const TextStyle(
                                                    letterSpacing: 68),
                                                maxLength: 4,
                                                filled: false,
                                                hint: "⬤⬤⬤⬤",
                                                onChanged: _otpVerificationBloc
                                                    .changeOTP,
                                                label: "",
                                                error: snapshot.error.toString(),
                                                obscureText: true,
                                                keyboardType:
                                                    TextInputType.number,
                                                keyboardAction:
                                                    TextInputAction.done,
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),

                                30.heightBox,

                                StreamBuilder<String>(
                                    stream: _otpVerificationBloc.verifyOtp,
                                    builder: (context, snapshot) {
                                      return StreamBuilder<String>(
                                          stream: _otpVerificationBloc.otp,
                                          builder: (context, otpValid) {
                                            int otpLength =
                                                (otpValid.data ?? "").length;
                                            return InkWell(
                                              onTap: () {
                                                if (!otpValid.hasData) {
                                                  showMessage(
                                                      "Please enter OTP",
                                                      context: context,
                                                      type: MessageType.ERROR);
                                                } else if (otpLength < 4) {
                                                  showMessage(
                                                      "Please enter valid OTP",
                                                      context: context,
                                                      type: MessageType.ERROR);
                                                } else {
                                                  _otpVerificationBloc
                                                      .verifyOtpApiCall();
                                                }
                                                /*navigator.pushNamedAndRemoveUntil(
                                                RoutesName.home);*/
                                              },
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: colors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Icon(
                                                  Icons.arrow_forward_sharp,
                                                  color: colors.whiteColor,
                                                ),
                                              ),
                                            );
                                          });
                                    })
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
