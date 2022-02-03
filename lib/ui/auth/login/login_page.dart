import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/app_exceptions.dart';
import 'package:wnees_demo/ui/auth/auth_store/auth_store.dart';
import 'package:wnees_demo/values/colors.dart' as colors;
import 'package:wnees_demo/values/image_constants.dart';
import 'package:wnees_demo/values/omi_extensions.dart';
import 'package:wnees_demo/values/string_constants.dart';
import 'package:wnees_demo/values/styles.dart';
import 'package:wnees_demo/widgets/app_utils.dart';
import 'package:wnees_demo/widgets/loading.dart';
import 'package:wnees_demo/widgets/text_form_filed.dart';
import 'package:wnees_demo/widgets/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late List<ReactionDisposer> _disposers;
  ValueNotifier showLoading = ValueNotifier<bool>(false);

  late GlobalKey<FormState> _formKey;
  late TextEditingController _mobileController;

  bool get isCurrent => !ModalRoute.of(context)!.isCurrent;

  // final authStore = AuthStore();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _mobileController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    addDisposer();
    super.didChangeDependencies();
  }

  addDisposer() {
    print("Add reaction");
    _disposers = [
      reaction((_) => authStore.loginResponse, (SingleResponse? response) {
        showLoading.value = false;
        print("ONResponse Login: called ");
        if (response?.code == "1") {
          showMessage(response?.message,
              type: MessageType.INFO, context: context);
          navigator.pushNamed(RoutesName.otpVerification);
        }
      }),
      reaction((_) => authStore.errorMessage, (String? errorMessage) {
        showLoading.value = false;
        if (isCurrent) return;
        print("OnError Callled");
        if (errorMessage != null) {
          showMessage(errorMessage.toString(),
              type: MessageType.INFO, context: context);
        }
      }),
      // error reaction
      reaction((_) => authStore.unauthorisedException,
          (UnauthorisedException? unauthorisedException) {
        showLoading.value = false;
        if (isCurrent) return;
        showMessage(unauthorisedException.toString(), context: context);
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.primaryColor,
      child: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: showLoading,
          builder: (context, value, child) => Loading(
            status: showLoading.value,
            child: Material(
              color: colors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, top: 15, right: 30),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: StringConstants.skip.text
                          .textStyle(textRegular16)
                          .underline
                          .make(),
                    ),
                  ),
                  Hero(
                    tag: "Wnees",
                    child: SizedBox(
                        height: height(context) * 0.10,
                        width: width(context) * 0.38,
                        child:
                            Image(image: AssetImage(ImageConstants.wnees_img))),
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
                            BoxShadow(color: colors.whiteColor, blurRadius: 5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            45.heightBox,
                            StringConstants.lets_find_together.text
                                .textStyle(textRegularBlack(context, .040))
                                .make(),
                            10.heightBox,
                            StringConstants.login_desc.text
                                .textStyle(textRegularSecondary(context, .020))
                                .align(TextAlign.center)
                                .make(),
                            30.heightBox,

                            //CountryCode and MobileNumber
                            Form(
                              key: _formKey,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: colors.colorTextFieldBg),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 8.0),
                                        color: colors.secondaryTextColor,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: AppTextField(
                                        enableInteractiveSelection: false,
                                        enabled: false,
                                        contentPadding: const EdgeInsets.only(
                                            left: 10.0,
                                            bottom: 18.0,
                                            top: 18.0,
                                            right: -10),
                                        suffixIcon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: colors.blackColor,
                                        ),
                                        filled: false,
                                        hint: "+966",
                                        keyboardType: TextInputType.number,
                                        keyboardAction: TextInputAction.done,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 7,
                                      child: AppTextField(
                                        controller: _mobileController,
                                        contentPadding: const EdgeInsets.only(
                                            left: 5.0,
                                            bottom: 18.0,
                                            top: 18.0,
                                            right: 15),
                                        filled: false,
                                        hint: "Enter Mobile number",
                                        label: "Enter Mobile number",
                                        maxLength: 10,
                                        keyboardType: TextInputType.number,
                                        keyboardAction: TextInputAction.done,
                                        validators: mobileValidator,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            30.heightBox,

                            InkWell(
                              onTap: () {
                                print("Tapped ");
                                if (_formKey.currentState!.validate()) {
                                  showLoading.value = true;
                                  authStore.login("+966",
                                      _mobileController.text.toString());
                                }
                                // navigator.pushNamed(RoutesName.otpVerification);
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: colors.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_sharp,
                                  color: colors.whiteColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    removeDisposer();
    super.dispose();
  }

  removeDisposer() {
    _disposers.forEach((element) {
      element.reaction.dispose();
    });
  }
}
