class ImageAssets {
  static const String _basePath = 'assets/';
  static const String _navPath = 'assets/bottombar/';
  static const String _profilePath = 'assets/profile/';

  static const Map<String, String> icons = {
    'activity': '${_basePath}activity.png',
    'calories': '${_basePath}calories.png',
    'feet': '${_basePath}feet.png',
    'heart': '${_basePath}heart.png',
    'sleep': '${_basePath}sleep.png',
    'water': '${_basePath}water.png',
    'sport': '${_basePath}sport.png',
    'goal': '${_basePath}goal.png',
    'user': '${_basePath}user.png',
    'info': '${_basePath}info.png',
    'efficency': '${_basePath}sleep_efficieny.png',
    'quality': '${_basePath}sleep_quality.png',
    'nodata': '${_basePath}nodata.png',
    'nav': '${_basePath}back_nav.png',
    'drawer': '${_basePath}drawer.png',
  };

  static const Map<String, String> navicon = {
    'navhome': '${_navPath}navhome.png',
    'navsleep': '${_navPath}navsleep.png',
    'navactivity': '${_navPath}activity.png',
    'navprofile': '${_navPath}profile.png',
  };
  static const Map<String, String> profile = {
    'find': '${_profilePath}find.png',
    'battery': '${_profilePath}battery.png',
    'faq': '${_profilePath}faq.png',
    'firmware': '${_profilePath}firmware.png',
    'health': '${_profilePath}health.png',
    'protection': '${_profilePath}protection.png',
    'setting': '${_profilePath}setting.png',
    'theme': '${_profilePath}theme.png',
    'unit': '${_profilePath}unit.png',
    'day': '${_profilePath}day.png',
    'night': '${_profilePath}night.png',
  };
}
