/// ******************************************************************************
///
///  WHOLE APP STRINGS
///
///*******************************************************************************/
const String appName = "dome";

/// ******************************************************************************
///
///  APP MENU TITLES
///
///*******************************************************************************/
const String titleOverview = "Overview";
const String titleDevices = "devices";
const String titleLights = "lights";
const String titleTemperature = "temperature";
const String titleRooms = "rooms";
const String titleCameras = "cameras";
const String titleDoors = "doors";
const String titleSecurity = "security";
const String titleSettings = "settings";

/// ******************************************************************************
///
/// SCREEN TITLES
///
/// ******************************************************************************
const String loginScreenTitle = "login";
const String registerScreenTitle = "register";
const String overviewTitleScreen = "overview";
const String homeTitleScreen = "home";
const String loginTitleScreen = "login";
const String registerTitleScreen = "register";
const String settingsTitleScreen = "settings";
const String lightsTitleScreen = "lights";
const String devicesTitleScreen = "devices";
const String addTitleScreen = "add";
const String doorsTitleScreen = "doors";

/********************************************************************************
   * 
   *  OPEN WEATHER MAP API
   * 
   ******************************************************************************/
const String OPEN_WEATHER_MAP_API_URL =
    "https://api.openweathermap.org/data/2.5";
const String OPEN_WEATHER_MAP_API_KEY = "0ced542e5846a9338f818e1185f6f48d";

/*********************************************************************************
  *
  *    STRINGS METHODS
  *
  ******************************************************************************** */

/// Transforms the String [input] into a Title Case format.
///
String toTitleCase(String input) {
  String output = input.trim().toLowerCase();
  String result = "";
  var tokens = output.split(' ');

  for (var token in tokens) {
    token = token.substring(0, 1).toUpperCase() + token.substring(1);
    result += '$token ';
    //buffer.write(token + ' ');
  }

  return result;
}
