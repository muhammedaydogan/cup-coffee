import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../constants/image_path_constants.dart';

class CoffeeCards extends StatefulWidget {
  CoffeeCards({super.key, required this.onTapLike, required this.isLiked});

  final void Function()? onTapLike;
  bool isLiked;

  @override
  State<CoffeeCards> createState() => _CoffeeCardsState();
}

class _CoffeeCardsState extends State<CoffeeCards> {
  Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _buildPopularCoffeeTitle(context),
          _buildPopularCoffeeCards(),
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

  Expanded _buildPopularCoffeeCards() {
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
          size: 18,
          CupertinoIcons.location_solid,
          color: context.colorScheme.brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        Text(
          "Bunny Cafe",
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
            ImagePaths.instance.coffeeUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            width: 36,
            height: 36,
            top: 12,
            right: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              child: InkWell(
                onTap: widget.onTapLike,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: const Icon(color: Colors.white, CupertinoIcons.heart),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: context.normalValue,
                  right: context.normalValue,
                  bottom: context.normalValue,
                  top: context.normalValue,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      size: 15,
                      CupertinoIcons.time,
                      color: context.colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "10 min delivery",
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                    const Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: SizedBox(height: 1)),
                    Icon(
                      size: 15,
                      CupertinoIcons.star_fill,
                      color: Colors.yellow[600],
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "5.0",
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
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
          "Cappucino",
          style: context.textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
        Flexible(flex: 1, child: Container()),
        Text(
          "₹ 550",
          style: context.textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
