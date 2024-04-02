import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:gap/gap.dart";

import "../../../../core/global/Helpers/extensions.dart";
import "../../../../core/global/SharedWidgets/custom_app_bar_widget.dart";
import "../../../../core/global/app_sizes.dart";
import "../../../../core/global/themes/AppColors/app_colors_dark.dart";

class EdafetZekrPage extends StatefulWidget {
  const EdafetZekrPage({super.key});

  @override
  State<EdafetZekrPage> createState() => _EdafetZekrPageState();
}

class _EdafetZekrPageState extends State<EdafetZekrPage> {
  final FocusNode firstNode = FocusNode();
  final FocusNode secondNode = FocusNode();
  late TextEditingController _textEditingController;
  int counter = 0;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  late GlobalKey formKey;
  @override
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(
        hasLeading: true,
        title: "اضافة تسبيحة",
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
                height: context.mediaQuery.height * .8,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 20,
                  right: 11,
                  left: 11,
                  bottom: 30,
                ),
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 30),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      AppSizes.appCircularBorder,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: TextField(
                        controller: _textEditingController,

                        autofocus: true,

                        focusNode: firstNode,
                        textInputAction: TextInputAction.next,
                        enabled: true,
                        cursorColor: AppColorsDark.buttonColor, //! TODO:
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(secondNode);
                        },
                        onSubmitted: (String value) {
                          FocusScope.of(context).requestFocus(secondNode);
                        },
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "عنوان تسبيحه",
                          counterStyle: TextStyle(),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: AppColorsDark.buttonColor,
                          ),
                          label: Text(
                            'عنوان التسبيحه',
                          ),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none,
                            color: AppColorsDark.buttonColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                AppSizes.appCircularBorder,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: TextField(
                        // second one
                        style: Theme.of(context).textTheme.headlineLarge,
                        cursorColor: AppColorsDark.buttonColor,
                        cursorHeight: 15,
                        cursorErrorColor: Colors.red,

                        textAlign: TextAlign.center,
                        focusNode: secondNode,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,

                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          iconColor: AppColorsDark.buttonColor,
                          hintText: "$counter",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: AppColorsDark.buttonColor,
                          ),
                          label: const Text(
                            'مرات التكرار ',
                          ),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                counter -= 1;
                              });
                            },
                            color: AppColorsDark.buttonColor,
                            icon: const Icon(
                              Icons.add,
                              color: AppColorsDark.buttonColor,
                            ),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                counter += 1;
                              });
                            },
                            color: AppColorsDark.buttonColor,
                            icon: const Icon(
                              Icons.add,
                              color: AppColorsDark.buttonColor,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                AppSizes.appCircularBorder,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
