import 'package:cup_coffee/view/_product/widgets/shop_cards.dart';

import '../../_product/widgets/coffee_cards.dart';
import 'package:logger/logger.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../_product/constants/image_path_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();
  Logger logger = Logger();

  EdgeInsets margin(BuildContext context) => EdgeInsets.only(
        left: context.veryLowValue,
        right: context.veryLowValue,
        top: context.veryLowValue,
        bottom: context.veryLowValue,
      );

  bool sth = false;

  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (sth == false) {
      sth = true;
      viewModel.getCoffees();
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                _buildAppBar(context),
                const SizedBox(height: 15),
                _buildSearchTextField(),
                const SizedBox(height: 25),
                CoffeeCards(
                    onTapLike: viewModel.onTapLikeCoffee, isLiked: false),
                const SizedBox(height: 20),
                const ShopCards(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      //color of the BottomAppBar
      color: context.colorScheme.brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              //update the bottom app bar view each time an item is clicked
              onPressed: () {
                updateTabSelection(0, "Home");
              },
              iconSize: 27.0,
              icon: Icon(
                CupertinoIcons.home,
                //darken the icon if it is selected or else give it a different color
                color: selectedIndex == 0
                    ? context.colorScheme.primary
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(1, "Outgoing");
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.shopping_basket,
                color: selectedIndex == 1
                    ? context.colorScheme.primary
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(2, "Outgoing");
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.location_pin,
                color: selectedIndex == 2
                    ? context.colorScheme.primary
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(3, "Incoming");
              },
              iconSize: 27.0,
              icon: Icon(
                CupertinoIcons.heart,
                color: selectedIndex == 3
                    ? context.colorScheme.primary
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(4, "Settings");
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.account_box,
                color: selectedIndex == 4
                    ? context.colorScheme.primary
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CupertinoSearchTextField(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 25),
        placeholder: LocaleKeys.homePage_searchbar.tr(),
      ),
    );
  }

  Padding _buildAppBar(BuildContext context) {
    return Padding(
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
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: context.colorScheme.primary),
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
    );
  }
}
