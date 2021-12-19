// TODO: Assimilate smaller weather repos into WeatherStateRepository

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// Weather data repository
/// Holds state for current conditions, daily and hourly forecast,
/// astrological data, and weather alerts
@immutable
class WeatherStateRepository extends Entity<WeatherStateRepository> {
  // fields for current conditions
  final String cityName;
  final DateTime lastUpdated;
  final int lastUpdatedEpoch;
  final double tempC;
  final double tempF;
  final double tempK;
  final double feelsLikeC;
  final double feelsLikeF;
  final double feelsLikeK;
  final String conditionString;
  final String conditionIconUrl;
  final int conditionCode;
  final double humidity;
  final double uv;
  final double windSpeedMph;
  final double windSpeedKph;
  final double windSpeedKnots;
  final double windSpeedMps;
  final int windDirectionDegrees;
  final String windDirectionString;
  final double airPressureMbar;
  final double airPressureInch;
  final double airPressureKpa;
  final double airQualityCo;
  final double airQualityNo2;
  final double airQualityO3;
  final double airQualitySo2;
  final double airQualityPm25;
  final double airQualityPm10;
  final double airQualityUsEpaIndex;
  final double airQualityGbDefraIndex;

  // fields for hourly forecast
  final int hourNow;
  final int nowPlusThreeHours;
  final int nowPlusSixHours;
  final int nowPlusNineHours;
  final int nowPlusTwelveHours;
  final int nowPlusFifteenHours;
  final int nowPlusEighteenHours;
  final List<double> hourlyTempC;
  final List<double> hourlyTempF;
  final List<double> hourlyTempK;
  final List<String> hourlyConditionIconUrl;
  final List<double> hourlyChanceOfRain;
  final List<double> hourlyWindSpeedKph;
  final List<double> hourlyWindSpeedMph;
  final List<double> hourlyWindSpeedMps;
  final List<double> hourlyWindSpeedKnots;
  final List<String> hourlyWindDegreeString;
  final List<int> hourlyWindDegree;

  // fields for daily forecast
  final List<DateTime> dailyDates;
  final List<double> dailyHighsC;
  final List<double> dailyHighsF;
  final List<double> dailyHighsK;
  final List<double> dailyLowsC;
  final List<double> dailyLowsF;
  final List<double> dailyLowsK;
  final List<double> dailyHumidity;
  final List<double> dailyChanceOfRain;
  final List<bool> dailyWillItRain;
  final List<String> dailyConditionStrings;
  final List<String> dailyConditionIconUrls;
  final List<int> dailyConditionCodes;
  final List<double> dailyUV;

  // fields for astrological data
  final String moonPhase;
  final String sunrise;
  final String sunset;

  // fields for weather alerts
  final List<WeatherAlert> weatherAlerts;

  WeatherStateRepository({
    @required this.cityName,
    @required this.weatherAlerts,
    @required this.lastUpdated,
    @required this.lastUpdatedEpoch,
    @required this.tempC,
    @required this.tempF,
    @required this.tempK,
    @required this.feelsLikeC,
    @required this.feelsLikeF,
    @required this.feelsLikeK,
    @required this.conditionString,
    @required this.conditionIconUrl,
    @required this.conditionCode,
    @required this.humidity,
    @required this.uv,
    @required this.windSpeedMph,
    @required this.windSpeedKph,
    @required this.windSpeedKnots,
    @required this.windSpeedMps,
    @required this.windDirectionDegrees,
    @required this.windDirectionString,
    @required this.airPressureMbar,
    @required this.airPressureInch,
    @required this.airPressureKpa,
    @required this.airQualityCo,
    @required this.airQualityNo2,
    @required this.airQualityO3,
    @required this.airQualitySo2,
    @required this.airQualityPm25,
    @required this.airQualityPm10,
    @required this.airQualityUsEpaIndex,
    @required this.airQualityGbDefraIndex,
    @required this.hourNow,
    @required this.nowPlusThreeHours,
    @required this.nowPlusSixHours,
    @required this.nowPlusNineHours,
    @required this.nowPlusTwelveHours,
    @required this.nowPlusFifteenHours,
    @required this.nowPlusEighteenHours,
    @required this.hourlyTempC,
    @required this.hourlyTempF,
    @required this.hourlyTempK,
    @required this.hourlyConditionIconUrl,
    @required this.hourlyChanceOfRain,
    @required this.hourlyWindSpeedKph,
    @required this.hourlyWindSpeedMph,
    @required this.hourlyWindSpeedMps,
    @required this.hourlyWindSpeedKnots,
    @required this.hourlyWindDegreeString,
    @required this.hourlyWindDegree,
    @required this.dailyDates,
    @required this.dailyHighsC,
    @required this.dailyHighsF,
    @required this.dailyHighsK,
    @required this.dailyLowsC,
    @required this.dailyLowsF,
    @required this.dailyLowsK,
    @required this.dailyHumidity,
    @required this.dailyChanceOfRain,
    @required this.dailyWillItRain,
    @required this.dailyConditionStrings,
    @required this.dailyConditionIconUrls,
    @required this.dailyConditionCodes,
    @required this.dailyUV,
    @required this.moonPhase,
    @required this.sunrise,
    @required this.sunset,
  });

  @override
  factory WeatherStateRepository.createEmpty() => WeatherStateRepository(
        cityName: 'Error',
        lastUpdated: DateTime.now(),
        lastUpdatedEpoch: DateTime.now().millisecondsSinceEpoch,
        tempC: 0,
        tempF: 0,
        tempK: 0,
        feelsLikeC: 0,
        feelsLikeF: 0,
        feelsLikeK: 0,
        conditionString: '',
        conditionIconUrl: '',
        conditionCode: 0,
        humidity: 0,
        uv: 0,
        windSpeedMph: 0,
        windSpeedKph: 0,
        windSpeedKnots: 0,
        windSpeedMps: 0,
        windDirectionDegrees: 0,
        windDirectionString: '',
        airPressureMbar: 0,
        airPressureInch: 0,
        airPressureKpa: 0,
        airQualityCo: 0,
        airQualityNo2: 0,
        airQualityO3: 0,
        airQualitySo2: 0,
        airQualityPm25: 0,
        airQualityPm10: 0,
        airQualityUsEpaIndex: 0,
        airQualityGbDefraIndex: 0,
        weatherAlerts: [],
        hourNow: 0,
        nowPlusThreeHours: 0,
        nowPlusSixHours: 0,
        nowPlusNineHours: 0,
        nowPlusTwelveHours: 0,
        nowPlusFifteenHours: 0,
        nowPlusEighteenHours: 0,
        hourlyTempC: [],
        hourlyTempF: [],
        hourlyTempK: [],
        hourlyConditionIconUrl: [],
        hourlyChanceOfRain: [],
        hourlyWindSpeedKph: [],
        hourlyWindSpeedMph: [],
        hourlyWindSpeedMps: [],
        hourlyWindSpeedKnots: [],
        hourlyWindDegreeString: [],
        hourlyWindDegree: [],
        dailyDates: [],
        dailyHighsC: [],
        dailyHighsF: [],
        dailyHighsK: [],
        dailyLowsC: [],
        dailyLowsF: [],
        dailyLowsK: [],
        dailyHumidity: [],
        dailyChanceOfRain: [],
        dailyWillItRain: [],
        dailyConditionStrings: [],
        dailyConditionIconUrls: [],
        dailyConditionCodes: [],
        dailyUV: [],
        moonPhase: '',
        sunrise: '',
        sunset: '',
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherStateRepository &&
          other.cityName == cityName &&
          other.lastUpdated == lastUpdated &&
          other.lastUpdatedEpoch == lastUpdatedEpoch &&
          other.tempC == tempC &&
          other.tempF == tempF &&
          other.tempK == tempK &&
          other.feelsLikeC == feelsLikeC &&
          other.feelsLikeF == feelsLikeF &&
          other.feelsLikeK == feelsLikeK &&
          other.conditionString == conditionString &&
          other.conditionIconUrl == conditionIconUrl &&
          other.conditionCode == conditionCode &&
          other.humidity == humidity &&
          other.uv == uv &&
          other.windSpeedKph == windSpeedKph &&
          other.windSpeedMph == windSpeedMph &&
          other.windSpeedMps == windSpeedMps &&
          other.windSpeedKnots == windSpeedKnots &&
          other.windDirectionDegrees == windDirectionDegrees &&
          other.windDirectionString == windDirectionString &&
          other.airPressureInch == airPressureInch &&
          other.airPressureKpa == airPressureKpa &&
          other.airPressureMbar == airPressureMbar &&
          other.airQualityCo == airQualityCo &&
          other.airQualityNo2 == airQualityNo2 &&
          other.airQualityO3 == airQualityO3 &&
          other.airQualitySo2 == airQualitySo2 &&
          other.airQualityPm25 == airQualityPm25 &&
          other.airQualityPm10 == airQualityPm10 &&
          other.airQualityUsEpaIndex == airQualityUsEpaIndex &&
          other.airQualityGbDefraIndex == airQualityGbDefraIndex &&
          other.weatherAlerts == weatherAlerts &&
          other.hourNow == hourNow &&
          other.nowPlusThreeHours == nowPlusThreeHours &&
          other.nowPlusSixHours == nowPlusSixHours &&
          other.nowPlusNineHours == nowPlusNineHours &&
          other.nowPlusTwelveHours == nowPlusTwelveHours &&
          other.nowPlusFifteenHours == nowPlusFifteenHours &&
          other.nowPlusEighteenHours == nowPlusEighteenHours &&
          other.hourlyTempC == hourlyTempC &&
          other.hourlyTempF == hourlyTempF &&
          other.hourlyTempK == hourlyTempK &&
          other.hourlyConditionIconUrl == hourlyConditionIconUrl &&
          other.hourlyChanceOfRain == hourlyChanceOfRain &&
          other.hourlyWindDegree == hourlyWindDegree &&
          other.hourlyWindSpeedKph == hourlyWindSpeedKph &&
          other.hourlyWindSpeedMph == hourlyWindSpeedMph &&
          other.hourlyWindSpeedMps == hourlyWindSpeedMps &&
          other.hourlyWindSpeedKnots == hourlyWindSpeedKnots &&
          other.hourlyWindDegreeString == hourlyWindDegreeString &&
          other.dailyDates == dailyDates &&
          other.dailyHighsC == dailyHighsC &&
          other.dailyHighsF == dailyHighsF &&
          other.dailyHighsK == dailyHighsK &&
          other.dailyLowsC == dailyLowsC &&
          other.dailyLowsF == dailyLowsF &&
          other.dailyLowsK == dailyLowsK &&
          other.dailyHumidity == dailyHumidity &&
          other.dailyChanceOfRain == dailyChanceOfRain &&
          other.dailyWillItRain == dailyWillItRain &&
          other.dailyConditionStrings == dailyConditionStrings &&
          other.dailyConditionCodes == dailyConditionCodes &&
          other.dailyConditionIconUrls == dailyConditionIconUrls &&
          other.dailyUV == dailyUV &&
          other.moonPhase == moonPhase &&
          other.sunrise == sunrise &&
          other.sunset == sunset;

  @override
  int get hashCode =>
      cityName.hashCode ^
      lastUpdated.hashCode ^
      lastUpdatedEpoch.hashCode ^
      tempC.hashCode ^
      tempF.hashCode ^
      tempK.hashCode ^
      feelsLikeC.hashCode ^
      feelsLikeF.hashCode ^
      feelsLikeK.hashCode ^
      conditionString.hashCode ^
      conditionIconUrl.hashCode ^
      conditionCode.hashCode ^
      humidity.hashCode ^
      uv.hashCode ^
      windSpeedKph.hashCode ^
      windSpeedMph.hashCode ^
      windSpeedMps.hashCode ^
      windSpeedKnots.hashCode ^
      windDirectionDegrees.hashCode ^
      windDirectionString.hashCode ^
      airPressureInch.hashCode ^
      airPressureMbar.hashCode ^
      airPressureKpa.hashCode ^
      airQualityCo.hashCode ^
      airQualityNo2.hashCode ^
      airQualityO3.hashCode ^
      airQualitySo2.hashCode ^
      airQualityPm25.hashCode ^
      airQualityPm10.hashCode ^
      airQualityUsEpaIndex.hashCode ^
      airQualityGbDefraIndex.hashCode ^
      weatherAlerts.hashCode ^
      hourNow.hashCode ^
      nowPlusThreeHours.hashCode ^
      nowPlusSixHours.hashCode ^
      nowPlusNineHours.hashCode ^
      nowPlusTwelveHours.hashCode ^
      nowPlusFifteenHours.hashCode ^
      nowPlusEighteenHours.hashCode ^
      hourlyTempC.hashCode ^
      hourlyTempF.hashCode ^
      hourlyTempK.hashCode ^
      hourlyConditionIconUrl.hashCode ^
      hourlyChanceOfRain.hashCode ^
      hourlyWindDegree.hashCode ^
      hourlyWindSpeedKph.hashCode ^
      hourlyWindSpeedMph.hashCode ^
      hourlyWindSpeedMps.hashCode ^
      hourlyWindSpeedKnots.hashCode ^
      hourlyWindDegreeString.hashCode ^
      dailyDates.hashCode ^
      dailyHighsC.hashCode ^
      dailyHighsF.hashCode ^
      dailyHighsK.hashCode ^
      dailyLowsC.hashCode ^
      dailyLowsF.hashCode ^
      dailyLowsK.hashCode ^
      dailyHumidity.hashCode ^
      dailyChanceOfRain.hashCode ^
      dailyWillItRain.hashCode ^
      dailyConditionStrings.hashCode ^
      dailyConditionStrings.hashCode ^
      dailyConditionStrings.hashCode ^
      dailyUV.hashCode ^
      moonPhase.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode;

  @override
  WeatherStateRepository copyWith({
    String cityName,
    DateTime lastUpdated,
    int lastUpdatedEpoch,
    double tempC,
    double tempF,
    double tempK,
    double feelsLikeC,
    double feelsLikeF,
    double feelsLikeK,
    String conditionString,
    String conditionIconUrl,
    int conditionCode,
    double humidity,
    double uv,
    double windSpeedMph,
    double windSpeedKph,
    double windSpeedKnots,
    double windSpeedMps,
    int windDirectionDegrees,
    String windDirectionString,
    double airPressureMbar,
    double airPressureInch,
    double airPressureKpa,
    double airQualityCo,
    double airQualityNo2,
    double airQualityO3,
    double airQualitySo2,
    double airQualityPm25,
    double airQualityPm10,
    double airQualityUsEpaIndex,
    double airQualityGbDefraIndex,
    List<WeatherAlert> weatherAlerts,
    int hourNow,
    int nowPlusThreeHours,
    int nowPlusSixHours,
    int nowPlusNineHours,
    int nowPlusTwelveHours,
    int nowPlusFifteenHours,
    int nowPlusEighteenHours,
    List<double> hourlyTempC,
    List<double> hourlyTempF,
    List<double> hourlyTempK,
    List<String> hourlyConditionIconUrl,
    List<double> hourlyChanceOfRain,
    List<double> hourlyWindSpeedKph,
    List<double> hourlyWindSpeedMph,
    List<double> hourlyWindSpeedMps,
    List<double> hourlyWindSpeedKnots,
    List<String> hourlyWindDegreeString,
    List<int> hourlyWindDegree,
    List<DateTime> dailyDates,
    List<double> dailyHighsC,
    List<double> dailyHighsF,
    List<double> dailyHighsK,
    List<double> dailyLowsC,
    List<double> dailyLowsF,
    List<double> dailyLowsK,
    List<double> dailyHumidity,
    List<double> dailyChanceOfRain,
    List<bool> dailyWillItRain,
    List<String> dailyConditionStrings,
    List<String> dailyConditionIconUrl,
    List<int> dailyConditionCode,
    List<double> dailyUv,
    String moonPhase,
    String sunrise,
    String sunset,
  }) =>
      WeatherStateRepository(
        cityName: cityName ?? this.cityName,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
        tempC: tempC ?? this.tempC,
        tempF: tempF ?? this.tempF,
        tempK: tempK ?? this.tempK,
        feelsLikeC: feelsLikeC ?? this.feelsLikeC,
        feelsLikeF: feelsLikeF ?? this.feelsLikeF,
        feelsLikeK: feelsLikeK ?? this.feelsLikeK,
        conditionString: conditionString ?? this.conditionString,
        conditionIconUrl: conditionIconUrl ?? this.conditionIconUrl,
        conditionCode: conditionCode ?? this.conditionCode,
        humidity: humidity ?? this.humidity,
        uv: uv ?? this.uv,
        windSpeedMph: windSpeedMph ?? this.windSpeedMph,
        windSpeedKph: windSpeedKph ?? this.windSpeedKph,
        windSpeedKnots: windSpeedKnots ?? this.windSpeedKnots,
        windSpeedMps: windSpeedMps ?? this.windSpeedMps,
        windDirectionDegrees: windDirectionDegrees ?? this.windDirectionDegrees,
        windDirectionString: windDirectionString ?? this.windDirectionString,
        airPressureMbar: airPressureMbar ?? this.airPressureMbar,
        airPressureInch: airPressureInch ?? this.airPressureInch,
        airPressureKpa: airPressureKpa ?? this.airPressureKpa,
        airQualityCo: airQualityCo ?? this.airQualityCo,
        airQualityNo2: airQualityNo2 ?? this.airQualityNo2,
        airQualityO3: airQualityO3 ?? this.airQualityO3,
        airQualitySo2: airQualitySo2 ?? this.airQualitySo2,
        airQualityPm25: airQualityPm25 ?? this.airQualityPm25,
        airQualityPm10: airQualityPm10 ?? this.airQualityPm10,
        airQualityUsEpaIndex: airQualityUsEpaIndex ?? this.airQualityUsEpaIndex,
        airQualityGbDefraIndex:
            airQualityGbDefraIndex ?? this.airQualityGbDefraIndex,
        weatherAlerts: weatherAlerts ?? this.weatherAlerts,
        hourNow: hourNow ?? this.hourNow,
        nowPlusThreeHours: nowPlusThreeHours ?? this.nowPlusThreeHours,
        nowPlusSixHours: nowPlusSixHours ?? this.nowPlusSixHours,
        nowPlusNineHours: nowPlusNineHours ?? this.nowPlusNineHours,
        nowPlusTwelveHours: nowPlusTwelveHours ?? this.nowPlusTwelveHours,
        nowPlusFifteenHours: nowPlusFifteenHours ?? this.nowPlusFifteenHours,
        nowPlusEighteenHours: nowPlusEighteenHours ?? this.nowPlusEighteenHours,
        hourlyTempC: hourlyTempC ?? this.hourlyTempC,
        hourlyTempF: hourlyTempF ?? this.hourlyTempF,
        hourlyTempK: hourlyTempK ?? this.hourlyTempK,
        hourlyConditionIconUrl:
            hourlyConditionIconUrl ?? this.hourlyConditionIconUrl,
        hourlyChanceOfRain: hourlyChanceOfRain ?? this.hourlyChanceOfRain,
        hourlyWindSpeedKph: hourlyWindSpeedKph ?? this.hourlyWindSpeedKph,
        hourlyWindSpeedMph: hourlyWindSpeedMph ?? this.hourlyWindSpeedMph,
        hourlyWindSpeedMps: hourlyWindSpeedMps ?? this.hourlyWindSpeedMps,
        hourlyWindSpeedKnots: hourlyWindSpeedKnots ?? this.hourlyWindSpeedKnots,
        hourlyWindDegreeString:
            hourlyWindDegreeString ?? this.hourlyWindDegreeString,
        hourlyWindDegree: hourlyWindDegree ?? this.hourlyWindDegree,
        dailyDates: dailyDates ?? this.dailyDates,
        dailyHighsC: dailyHighsC ?? this.dailyHighsC,
        dailyHighsF: dailyHighsF ?? this.dailyHighsF,
        dailyHighsK: dailyHighsK ?? this.dailyHighsK,
        dailyLowsC: dailyLowsC ?? this.dailyLowsC,
        dailyLowsF: dailyLowsF ?? this.dailyLowsF,
        dailyLowsK: dailyLowsK ?? this.dailyLowsK,
        dailyHumidity: dailyHumidity ?? this.dailyHumidity,
        dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
        dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
        dailyConditionStrings:
            dailyConditionStrings ?? this.dailyConditionStrings,
        dailyConditionIconUrls:
            dailyConditionIconUrl ?? this.dailyConditionIconUrls,
        dailyConditionCodes: dailyConditionCode ?? this.dailyConditionCodes,
        dailyUV: dailyUv ?? this.dailyUV,
        moonPhase: moonPhase ?? this.moonPhase,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  @override
  Map<String, dynamic> toJson() => {
        'cityName': cityName ?? null,
        'lastUpdated': lastUpdated ?? null,
        'lastUpdatedEpoch': lastUpdatedEpoch ?? null,
        'tempC': tempC ?? null,
        'tempF': tempF ?? null,
        'tempK': tempK ?? null,
        'feelsLikeC': feelsLikeC ?? null,
        'feelsLikeF': feelsLikeF ?? null,
        'feelsLikeK': feelsLikeK ?? null,
        'conditionString': conditionString ?? null,
        'conditionIconUrl': conditionIconUrl ?? null,
        'conditionCode': conditionCode ?? null,
        'humidity': humidity ?? null,
        'uv': uv ?? null,
        'windSpeedMph': windSpeedMph ?? null,
        'windSpeedKph': windSpeedKph ?? null,
        'windSpeedKnots': windSpeedKnots ?? null,
        'windSpeedMps': windSpeedMps ?? null,
        'windDirectionDegrees': windDirectionDegrees ?? null,
        'windDirectionString': windDirectionString ?? null,
        'airPressureMbar': airPressureMbar ?? null,
        'airPressureInch': airPressureInch ?? null,
        'airPressureKpa': airPressureKpa ?? null,
        'airQualityCo': airQualityCo ?? null,
        'airQualityNo2': airQualityNo2 ?? null,
        'airQualityO3': airQualityO3 ?? null,
        'airQualitySo2': airQualitySo2 ?? null,
        'airQualityPm25': airQualityPm25 ?? null,
        'airQualityPm10': airQualityPm10 ?? null,
        'airQualityUsEpaIndex': airQualityUsEpaIndex ?? null,
        'airQualityGbDefraIndex': airQualityGbDefraIndex ?? null,
        'weatherAlerts': weatherAlerts ?? null,
        'hourNow': hourNow ?? null,
        'nowPlusThreeHours': nowPlusThreeHours ?? null,
        'nowPlusSixHours': nowPlusSixHours ?? null,
        'nowPlusNineHours': nowPlusNineHours ?? null,
        'nowPlusTwelveHours': nowPlusTwelveHours ?? null,
        'nowPlusFifteenHours': nowPlusFifteenHours ?? null,
        'nowPlusEighteenHours': nowPlusEighteenHours ?? null,
        'hourlyTempC': hourlyTempC ?? null,
        'hourlyTempF': hourlyTempF ?? null,
        'hourlyTempK': hourlyTempK ?? null,
        'hourlyConditionIconUrl': hourlyConditionIconUrl ?? null,
        'hourlyChanceOfRain': hourlyChanceOfRain ?? null,
        'hourlyWindSpeedKph': hourlyWindSpeedKph ?? null,
        'hourlyWindSpeedMph': hourlyWindSpeedMph ?? null,
        'hourlyWindSpeedMps': hourlyWindSpeedMps ?? null,
        'hourlyWindSpeedKnots': hourlyWindSpeedKnots ?? null,
        'hourlyWindDegreeString': hourlyWindDegreeString ?? null,
        'hourlyWindDegree': hourlyWindDegree ?? null,
        'dailyDates': dailyDates ?? null,
        'dailyHighsC': dailyHighsC ?? null,
        'dailyHighsF': dailyHighsF ?? null,
        'dailyHighsK': dailyHighsK ?? null,
        'dailyLowsC': dailyLowsC ?? null,
        'dailyLowsF': dailyLowsF ?? null,
        'dailyLowsK': dailyLowsK ?? null,
        'dailyHumidity': dailyHumidity ?? null,
        'dailyChanceOfRain': dailyChanceOfRain ?? null,
        'dailyWillItRain': dailyWillItRain ?? null,
        'dailyConditionStrings': dailyConditionStrings ?? null,
        'dailyConditionIconUrls': dailyConditionIconUrls ?? null,
        'dailyConditionCodes': dailyConditionCodes ?? null,
        'dailyUv': dailyUV ?? null,
        'moonPhase': moonPhase ?? null,
        'sunrise': sunrise ?? null,
        'sunset': sunset ?? null,
      };

  @override
  WeatherStateRepository.fromJson(json)
      : cityName = json['cityName'] ?? '',
        lastUpdated =
            Entity.parseJsonDate(json['lastUpdated']) ?? DateTime.now(),
        lastUpdatedEpoch = Entity.parseJsonInt(json['lastUpdatedEpoch']) ?? 0,
        tempC = Entity.parseJsonDouble(json['tempC']) ?? 0,
        tempF = Entity.parseJsonDouble(json['tempF']) ?? 0,
        tempK = Entity.parseJsonDouble(json['tempK']) ?? 0,
        feelsLikeC = Entity.parseJsonDouble(json['feelsLikeC']) ?? 0,
        feelsLikeF = Entity.parseJsonDouble(json['feelsLikeF']) ?? 0,
        feelsLikeK = Entity.parseJsonDouble(json['feelsLikeK']) ?? 0,
        conditionString = json['conditionString'] ?? '',
        conditionIconUrl = json['conditionIconUrl'] ?? '',
        conditionCode = Entity.parseJsonInt(json['conditionCode']) ?? 0,
        humidity = Entity.parseJsonDouble(json['humidity']) ?? 0,
        uv = Entity.parseJsonDouble(json['uv']) ?? 0,
        windSpeedMph = Entity.parseJsonDouble(json['windSpeedMph']) ?? 0,
        windSpeedKph = Entity.parseJsonDouble(json['windSpeedKph']) ?? 0,
        windSpeedKnots = Entity.parseJsonDouble(json['windSpeedKnots']) ?? 0,
        windSpeedMps = Entity.parseJsonDouble(json['windSpeedMps']) ?? 0,
        windDirectionDegrees =
            Entity.parseJsonInt(json['windDirectionDegrees']) ?? 0,
        windDirectionString = json['windDirectionString'] ?? '',
        airPressureMbar = Entity.parseJsonDouble(json['airPressureMbar']) ?? 0,
        airPressureInch = Entity.parseJsonDouble(json['airPressureInch']) ?? 0,
        airPressureKpa = Entity.parseJsonDouble(json['airPressureKpa']) ?? 0,
        airQualityCo = Entity.parseJsonDouble(json['airQualityCo']) ?? 0,
        airQualityNo2 = Entity.parseJsonDouble(json['airQualityNo2']) ?? 0,
        airQualityO3 = Entity.parseJsonDouble(json['airQualityO3']) ?? 0,
        airQualitySo2 = Entity.parseJsonDouble(json['airQualitySo2']) ?? 0,
        airQualityPm25 = Entity.parseJsonDouble(json['airQualityPm25']) ?? 0,
        airQualityPm10 = Entity.parseJsonDouble(json['airQualityPm10']) ?? 0,
        airQualityUsEpaIndex =
            Entity.parseJsonDouble(json['airQualityUsEpaIndex']) ?? 0,
        airQualityGbDefraIndex =
            Entity.parseJsonDouble(json['airQualityGbDefraIndex']) ?? 0,
        weatherAlerts = json['weatherAlerts'] ?? [],
        hourNow = Entity.parseJsonInt(json['hourNow']) ?? 0,
        nowPlusThreeHours = Entity.parseJsonInt(json['nowPlusThreeHours']) ?? 0,
        nowPlusSixHours = Entity.parseJsonInt(json['nowPlusSixHours']) ?? 0,
        nowPlusNineHours = Entity.parseJsonInt(json['nowPlusNineHours']) ?? 0,
        nowPlusTwelveHours =
            Entity.parseJsonInt(json['nowPlusTwelveHours']) ?? 0,
        nowPlusFifteenHours =
            Entity.parseJsonInt(json['nowPlusFifteenHours']) ?? 0,
        nowPlusEighteenHours =
            Entity.parseJsonInt(json['nowPlusEighteenHours']) ?? 0,
        hourlyTempC = List<double>.from(json['hourlyTempC']) ?? 0,
        hourlyTempF = List<double>.from(json['hourlyTempF']) ?? 0,
        hourlyTempK = List<double>.from(json['hourlyTempK']) ?? 0,
        hourlyConditionIconUrl =
            List<String>.from(json['hourlyConditionIconUrl']) ?? '',
        hourlyChanceOfRain = List<double>.from(json['hourlyChanceOfRain']) ?? 0,
        hourlyWindSpeedKph = List<double>.from(json['hourlyWindSpeedKph']) ?? 0,
        hourlyWindSpeedMph = List<double>.from(json['hourlyWindSpeedMph']) ?? 0,
        hourlyWindSpeedMps = List<double>.from(json['hourlyWindSpeedMps']) ?? 0,
        hourlyWindSpeedKnots =
            List<double>.from(json['hourlyWindSpeedKnots']) ?? 0,
        hourlyWindDegreeString =
            List<String>.from(json['hourlyWindDegreeString']) ?? '',
        hourlyWindDegree = List<int>.from(json['hourlyWindDegree']) ?? 0,
        dailyDates = List<DateTime>.from(json['dailyDates']) ?? [],
        dailyHighsC = List<double>.from(json['dailyHighsC']) ?? [],
        dailyHighsF = List<double>.from(json['dailyHighsF']) ?? [],
        dailyHighsK = List<double>.from(json['dailyHighsK']) ?? [],
        dailyLowsC = List<double>.from(json['dailyLowsC']) ?? [],
        dailyLowsF = List<double>.from(json['dailyLowsF']) ?? [],
        dailyLowsK = List<double>.from(json['dailyLowsK']) ?? [],
        dailyHumidity = List<double>.from(json['dailyHumidity']) ?? [],
        dailyChanceOfRain = List<double>.from(json['dailyChanceOfRain']) ?? [],
        dailyWillItRain = List<bool>.from(json['dailyWillItRain']) ?? [],
        dailyConditionStrings =
            List<String>.from(json['dailyConditionStrings']) ?? [],
        dailyConditionIconUrls =
            List<String>.from(json['dailyConditionIconUrls']) ?? [],
        dailyConditionCodes = List<int>.from(json['dailyConditionCodes']) ?? [],
        dailyUV = List<double>.from(json['dailyUv']) ?? [],
        moonPhase = json['moonPhase'] ?? '',
        sunrise = json['sunrise'] ?? '',
        sunset = json['sunset'] ?? '';

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      cityName != null &&
      lastUpdated != null &&
      lastUpdatedEpoch != null &&
      tempC != null &&
      tempF != null &&
      tempK != null &&
      feelsLikeC != null &&
      feelsLikeF != null &&
      feelsLikeK != null &&
      conditionString != null &&
      conditionIconUrl != null &&
      conditionCode != null &&
      humidity != null &&
      uv != null &&
      windSpeedMph != null &&
      windSpeedKph != null &&
      windSpeedKnots != null &&
      windSpeedMps != null &&
      windDirectionDegrees != null &&
      windDirectionString != null &&
      airPressureMbar != null &&
      airPressureInch != null &&
      airPressureKpa != null &&
      airQualityCo != null &&
      airQualityNo2 != null &&
      airQualityO3 != null &&
      airQualitySo2 != null &&
      airQualityPm25 != null &&
      airQualityPm10 != null &&
      airQualityUsEpaIndex != null &&
      airQualityGbDefraIndex != null &&
      weatherAlerts != null &&
      hourNow != null &&
      nowPlusThreeHours != null &&
      nowPlusSixHours != null &&
      nowPlusNineHours != null &&
      nowPlusTwelveHours != null &&
      nowPlusFifteenHours != null &&
      nowPlusEighteenHours != null &&
      hourlyTempC != null &&
      hourlyTempF != null &&
      hourlyTempK != null &&
      hourlyConditionIconUrl != null &&
      hourlyChanceOfRain != null &&
      hourlyWindDegree != null &&
      hourlyWindSpeedKph != null &&
      hourlyWindSpeedMph != null &&
      hourlyWindSpeedMps != null &&
      hourlyWindSpeedKnots != null &&
      hourlyWindDegreeString != null &&
      dailyHighsC != null &&
      dailyHighsF != null &&
      dailyHighsK != null &&
      dailyLowsC != null &&
      dailyLowsF != null &&
      dailyLowsK != null &&
      dailyHumidity != null &&
      dailyChanceOfRain != null &&
      dailyWillItRain != null &&
      dailyConditionStrings != null &&
      dailyConditionIconUrls != null &&
      dailyConditionCodes != null &&
      dailyUV != null &&
      moonPhase != null &&
      sunrise != null &&
      sunset != null;
}
