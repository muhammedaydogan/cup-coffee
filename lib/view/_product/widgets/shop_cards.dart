import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../constants/image_path_constants.dart';

class ShopCards extends StatefulWidget {
  const ShopCards({super.key});

  @override
  State<ShopCards> createState() => _ShopCardsState();
}

class _ShopCardsState extends State<ShopCards> {
  Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _buildPopularCoffeeTitle(context),
          _buildPopularShopCards(),
        ],
      ),
    );
  }

  Padding _buildPopularCoffeeTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          LocaleKeys.homePage_popularCoffee.tr(),
          style: context.textTheme.titleSmall,
        ),
      ),
    );
  }

  Expanded _buildPopularShopCards() {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 12.5 : 0, right: index == 1 ? 12.5 : 0),
            child: InkWell(
              onTap: () {
                logger.d(index);
              },
              child: SizedBox(
                width: context.width * 3 / 5,
                child: Column(
                  children: [
                    Expanded(
                      flex: 16,
                      child: _buildCard(context),
                    ),
                    Container(
                      child: _buildFirstLine(context),
                    ),
                    // const SizedBox(height: 5),
                    Container(
                      child: _buildSecondLine(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row _buildSecondLine(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Icon(
          size: 15,
          CupertinoIcons.star_fill,
          color: Colors.yellow[600],
        ),
        Text(
          "${5.0} - ${105} ratings",
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Card _buildCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          context.highRadius,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            ImagePaths.instance.shopUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: context.highRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: context.lowValue,
                    right: context.lowValue,
                    bottom: context.lowValue,
                    top: context.lowValue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 8),
                      Icon(
                        size: 15,
                        CupertinoIcons.time,
                        color: context.colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "1,5 km",
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.end,
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildFirstLine(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        Text(
          "Ashley Coffee",
          style: context.textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
