import '../../../core/extension/string_extension.dart';

class ImagePaths {
  static ImagePaths? _instance;
  static ImagePaths get instance {
    return _instance ??= ImagePaths._init();
  }

  ImagePaths._init();

  // url
  final splashUrl =
      "https://s3-alpha-sig.figma.com/img/6326/cdbe/51fa83b59b8bcae529138eeee53773d3?Expires=1675641600&Signature=F1mxzrGdDLuk~KQ5If89lCAKrztFo7o2ZE1tUh1Zxn1SbS21AVc9ZlLLeiDgJTH~o002UKUmPFg0Va3Q2qWHJmqNtIBHy9FNl~c6UqMYcjccnrXbMPAnD83LCPeGNjHgLw9kptGzk3wtFhIVE5L7-~OZPNIPyJYE~xlFV3FoLwhcfuQmJpOcoqIG3FQIWK2iANVNyrMPOdwBf7RepXUejxfO-pJkjvUu0-13wbXK3d6fXtb5HL6l7IYWGMgwPqyUi-NTq6u1Q68fBHfKYa7-7AEWeWWl88UMMZ2Nl389bouhx1miT84K-jlyO16PQk0BoeetdCox6CdJQwhCrhdnoA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final coffeeUrl =
      "https://s3-alpha-sig.figma.com/img/b6bd/d67b/7d739f3467ae46aa569e12223df838a1?Expires=1676246400&Signature=Pdl3KrW7i8jgNqT3w7ODLlAPS2jmy7fvjGujFbOtXLv-Pq21Erv1ZKibw~3ZzF5rbTfn0g47xyKRkEiYzoNEO70l-zVvS6jRbAKNhz~~28Ttp2jpkNT4K0~AQq68dPeS7q-SoGc4NgaxXRgI5HGSN1fWKyTw3wuhwJ7qGgTWJcRX7PqVsWV9nSQ6fAFtRUzckVC~woem1pEN0epzyURZL7rNN5cArwmiUBY7XlGlT6cL1jc66STGZAjW4wAoGtvV3e4UmIcAmkk9ZG6HpARTJwGwvlhOhe950Pcj~vJwnjcIBDGH8j0Ri6dX-nk68BKt7MXTKuu-idOF8BPLaGV-gw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final shopUrl =
      "https://s3-alpha-sig.figma.com/img/c46a/fea0/addd50c26eb105bf4d403eef63486ff1?Expires=1676246400&Signature=J76Y6pgPQAFGE3snmG3Xe4UOO1UmPhNNX5IoyPUhLjQpZ79OVmTNxeFercTj2LbtCGMunT7BR9rl-QbzIaU0dxJahjdyd55zM4bqCalcTD6SPOQqOh1nDb9nWGZMimmmX1OO1D7UU9xIeQ76DOhzZBYAEnRYV6ZN13HchN8nnpP~PIit8gOoo1uybaOOjA3OocwK6WXJ4FaOjxQl4Yj69QEuGMB1WnvfCFrNlWjJpm7jDjbn-nsOKCwfqp6AAdR2lnFWKoJc5WXR7-ipuEG8vaGbsNrHAW1EmBNFkp61FSaIAa~KvRRM9MIkGD6zLIFIOPamP4-lsdKoNfMLQwqjew__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  // asset
  final splashJpg = "splash".toJPG;
  final avatarJpg = "avatar".toJPG;
}
