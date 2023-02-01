import 'package:cup_coffee/core/extension/context_extension.dart';
import 'package:cup_coffee/core/init/lang/locale_keys.g.dart';
import 'package:cup_coffee/view/_product/constants/image_path_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();

  EdgeInsets margin(BuildContext context) => EdgeInsets.only(
        left: context.veryLowValue,
        right: context.veryLowValue,
        top: context.veryLowValue,
        bottom: context.veryLowValue,
      );

  double aspectRatio = 3 / 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Center(
                          child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 40.0,
                              ),
                              children: [
                                TextSpan(
                                  text: "${LocaleKeys.homePage_titleP1.tr()} ",
                                  style: context.textTheme.titleLarge,
                                ),
                                TextSpan(
                                  text: "${LocaleKeys.homePage_titleP2.tr()} ",
                                  style: context.textTheme.titleLarge?.copyWith(
                                      color: context.appTheme.primaryColor),
                                ),
                                TextSpan(
                                  text: "${LocaleKeys.homePage_titleP3.tr()} ",
                                  style: context.textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: CircleAvatar(
                          minRadius: 35.0,
                          backgroundImage: AssetImage(
                            ImagePaths.instance.avatarJpg,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CupertinoSearchTextField(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 25),
                    placeholder: LocaleKeys.homePage_searchbar.tr(),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.homePage_popularCoffee.tr(),
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 25 : 0,
                            right: index == 1 ? 25 : 0),
                        child: InkWell(
                          onTap: () {
                            print(index);
                          },
                          child: AspectRatio(
                            aspectRatio: 97 / 100,
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          context.mediumRadius),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.asset(
                                            ImagePaths.instance.splashJpg,
                                            fit: BoxFit.fill),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  size: 18,
                                                  CupertinoIcons.time,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "10 min delivery",
                                                  style: context
                                                      .textTheme.bodyMedium
                                                      ?.copyWith(
                                                          color: Colors.white),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 15),
                                      Text("Cappucino",
                                          style: context.textTheme.titleSmall),
                                      Flexible(flex: 1, child: Container()),
                                      Text("₹ 550",
                                          style: context.textTheme.titleSmall),
                                      const SizedBox(width: 15),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 15),
                                      const Icon(
                                        size: 18,
                                        CupertinoIcons.location_solid,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "Coffee Cafe",
                                        style: context.textTheme.bodyMedium,
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.homePage_nearestShops.tr(),
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          // Image.asset(
                          // ImagePaths.instance.splashJpg,
                          // fit: BoxFit.contain,
                          // ),
                          Text("List item $index")
                        ]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
