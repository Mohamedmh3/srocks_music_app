extension AssetsPath on String {
  String get imageAssetPath => 'assets/images/$this';

  String get iconAssetPath => 'assets/icons/$this';
}
