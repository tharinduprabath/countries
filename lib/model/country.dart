class Country{
  final String name;
  final List topLevelDomain;
  final String alpha2Code;
  final String alpha3Code;
  final List callingCodes;
  final String capital;
  final List altSpellings;
  final String region;
  final String subregion;
  final int population;
  final List latlng;
  final String demonym;
  final double area;
  final double gini;
  final List timezones;
  final List borders;
  final String nativeName;
  final String numericCode;
  final List currencies;
  final List languages;
  final Map<String, dynamic> translations;
  final String relevance;

  Country.fromJsonMap(Map map)
      : name = map['name'],
        topLevelDomain = map['topLevelDomain'],
        alpha2Code = map['alpha2Code'],
        alpha3Code = map['alpha3Code'],
        callingCodes = map['callingCodes'],
        capital = map['capital'],
        altSpellings = map['altSpellings'],
        region = map['region'],
        subregion = map['subregion'],
        population = map['population'],
        latlng = map['latlng'],
        demonym = map['demonym'],
        area = map['area'],
        gini = map['gini'],
        timezones = map['timezones'],
        borders = map['borders'],
        nativeName = map['nativeName'],
        numericCode = map['numericCode'],
        currencies = map['currencies'],
        languages = map['languages'],
        translations = map['translations'],
        relevance = map['relevance'];



}