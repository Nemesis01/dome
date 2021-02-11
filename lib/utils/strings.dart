class AppStrings {
  /// ******************************************************************************
  ///
  ///  WHOLE APP STRINGS
  ///
  ///*******************************************************************************/
  static const String APP_NAME = "dorémi";

  /// ******************************************************************************
  ///
  ///  APP ROUTES NAMES
  ///
  ///*******************************************************************************/
  static const String ROUTE_DEFAULT = "/";
  static const String ROUTE_HOME = "/home";
  static const String ROUTE_AUTHENTICATION = "/authentication";
  static const String ROUTE_DEVICES = "/devices";

  /********************************************************************************
   * 
   *  OPEN WEATHER MAP API
   * 
   ********************************************************************************/
  static const String OPEN_WEATHER_MAP_API_URL =
      "https://api.openweathermap.org/data/2.5";
  static const String OPEN_WEATHER_MAP_API_KEY =
      "0ced542e5846a9338f818e1185f6f48d";

  /*********************************************************************************
  *
  *   STATIC STRINGS METHODS
  *
  ******************************************************************************** */

  /// Transforms the String [input] into a Title Case form.
  ///
  static String toTitleCase(String input) {
    String output = input.trim().toLowerCase();
    StringBuffer buffer = StringBuffer();
    var tokens = output.split(' ');

    for (var token in tokens) {
      token = token.substring(0, 1) + token.substring(1);
      buffer.write(token + ' ');
    }

    return buffer.toString();
  }
}
