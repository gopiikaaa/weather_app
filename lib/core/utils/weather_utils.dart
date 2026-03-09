class WeatherUtils {

  static String getWeatherCondition(int code) {

    if (code == 0) {
      return "☀ Clear Sky";
    }

    if (code == 1 || code == 2) {
      return "⛅ Partly Cloudy";
    }

    if (code == 3) {
      return "☁ Overcast";
    }

    if (code == 45 || code == 48) {
      return "🌫 Fog";
    }

    if (code >= 51 && code <= 67) {
      return "🌧 Rain";
    }

    if (code >= 71 && code <= 77) {
      return "❄ Snow";
    }

    if (code >= 80 && code <= 82) {
      return "🌧 Rain Showers";
    }

    if (code >= 95) {
      return "⛈ Thunderstorm";
    }

    return "Unknown Weather";
  }

}