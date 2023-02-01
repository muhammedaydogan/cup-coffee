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

  // asset
  final splashJpg = "splash".toJPG;
  final avatarJpg = "avatar".toJPG;
}
