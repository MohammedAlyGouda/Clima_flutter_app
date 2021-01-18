import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'faa7ab00e0b6a272b83dacce4d569158';
const openWeatherMapURL = 'https://samples.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityname) async {
    NetwarkHelper netwarkHelper = NetwarkHelper(
        '$openWeatherMapURL?q=$cityname&appid=$apiKey');

    var weatherdata = await netwarkHelper.getData();
    return weatherdata;
  }


  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetwarkHelper netwarkHelper = NetwarkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longtude}&appid=$apiKey');

    var weatherdata = await netwarkHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
