/// ******************************************************************************
///
///  WHOLE APP STRINGS
///
///*******************************************************************************/
const String appName = "dome";

/// ******************************************************************************
///
///  APP ROUTES NAMES
///
///*******************************************************************************/
const String defaultRoute = "/";
const String homeRoute = "/home";
const String ROUTE_AUTHENTICATION = "/authentication";
const String devicesRoute = "/devices";

/********************************************************************************
   * 
   *  OPEN WEATHER MAP API
   * 
   ********************************************************************************/
const String OPEN_WEATHER_MAP_API_URL =
    "https://api.openweathermap.org/data/2.5";
const String OPEN_WEATHER_MAP_API_KEY = "0ced542e5846a9338f818e1185f6f48d";

/*********************************************************************************
  *
  *    STRINGS METHODS
  *
  ******************************************************************************** */

/// Transforms the String [input] into a Title Case form.
///
String toTitleCase(String input) {
  String output = input.trim().toLowerCase();
  StringBuffer buffer = StringBuffer();
  var tokens = output.split(' ');

  for (var token in tokens) {
    token = token.substring(0, 1) + token.substring(1);
    buffer.write(token + ' ');
  }

  return buffer.toString();
}
