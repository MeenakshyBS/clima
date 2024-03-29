import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = 'a4107d9170a209c9eff7440065a92758';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    String url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    String url = '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var weatherData = await networkHelper.getData();
    return weatherData;
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
