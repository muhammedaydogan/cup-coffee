import '../../../core/constants/app/app_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../_product/constants/image_path_constants.dart';
import '../viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewModel viewModel = SplashViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImagePaths.instance.splashJpg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily:
                              ApplicationConstants.fontFamilyComicSansMS,
                          fontSize: 40.0,
                        ),
                        children: [
                          const TextSpan(
                            text: "Cup ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "Coffee",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
