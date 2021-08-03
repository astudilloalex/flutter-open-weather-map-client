/// Contain the api authority is the main domain.
const String apiAuthority = 'api.openweathermap.org';

/// This is an internal parameter used in api url to obtain the current climate.
const String apiCurrentWeatherPath = '/weather';

/// This is an internal parameter used in api url to get the 5 day weather data.
const String apiFiveDayForecastPath = '/forecast';

/// Contain the unencoded path, after main domain.
const String apiUnencodedPath = '/data/2.5';

/// Map with all countries in English use ISO 3166-1 key to get country name.
const Map<String, String> countries = {
  'AF': 'Afghanistan',
  'AX': 'Åland Islands',
  'AL': 'Albania',
  'DZ': 'Algeria',
  'AS': 'American Samoa',
  'AD': 'Andorra',
  'AO': 'Angola',
  'AI': 'Anguilla',
  'AQ': 'Antarctica',
  'AG': 'Antigua and Barbuda',
  'AR': 'Argentina',
  'AM': 'Armenia',
  'AW': 'Aruba',
  'AU': 'Australia',
  'AT': 'Austria',
  'AZ': 'Azerbaijan',
  'BS': 'Bahamas',
  'BH': 'Bahrain',
  'BD': 'Bangladesh',
  'BB': 'Barbados',
  'BY': 'Belarus',
  'BE': 'Belgium',
  'BZ': 'Belize',
  'BJ': 'Benin',
  'BM': 'Bermuda',
  'BT': 'Bhutan',
  'BO': 'Bolivia',
  'BQ': 'Bonaire, Sint Eustatius and Saba',
  'BA': 'Bosnia and Herzegovina',
  'BW': 'Botswana',
  'BV': 'Bouvet Island',
  'BR': 'Brazil',
  'IO': 'British Indian Ocean Territory',
  'VG': 'British Virgin Islands',
  'BN': 'Brunei Darussalam',
  'BG': 'Bulgaria',
  'BF': 'Burkina Faso',
  'BI': 'Burundi',
  'CV': 'Cabo Verde',
  'KH': 'Cambodia',
  'CM': 'Cameroon',
  'CA': 'Canada',
  'KY': 'Cayman Islands',
  'CF': 'Central African Republic',
  'TD': 'Chad',
  'CL': 'Chile',
  'CN': 'China',
  'CX': 'Christmas Island',
  'CC': 'Cocos (Keeling) Islands',
  'CO': 'Colombia',
  'KM': 'Comoros',
  'CG': 'Congo',
  'CD': 'Congo Democratic Republic',
  'CK': 'Cook Islands',
  'CR': 'Costa Rica',
  'HR': 'Croatia',
  'CU': 'Cuba',
  'CW': 'Curaçao',
  'CY': 'Cyprus',
  'CZ': 'Czechia',
  'DK': 'Denmark',
  'DJ': 'Djibouti',
  'DM': 'Dominica',
  'DO': 'Dominican Republic',
  'EC': 'Ecuador',
  'EG': 'Egypt',
  'SV': 'El Salvador',
  'GQ': 'Equatorial Guinea',
  'ER': 'Eritrea',
  'EE': 'Estonia',
  'SZ': 'Eswatini',
  'ET': 'Ethiopia',
  'FK': 'Falkland Islands',
  'FO': 'Faroe Islands',
  'FJ': 'Fiji',
  'FI': 'Finland',
  'FR': 'France',
  'GF': 'French Guiana',
  'PF': 'French Polynesia',
  'TF': 'French Southern Territories',
  'GA': 'Gabon',
  'GM': 'Gambia',
  'GE': 'Georgia',
  'DE': 'Germany',
  'GH': 'Ghana',
  'GI': 'Gibraltar',
  'GR': 'Greece',
  'GL': 'Greenland',
  'GD': 'Grenada',
  'GP': 'Guadeloupe',
  'GU': 'Guam',
  'GT': 'Guatemala',
  'GG': 'Guernsey',
  'GN': 'Guinea',
  'GW': 'Guinea-Bissau',
  'GY': 'Guyana',
  'HT': 'Haiti',
  'HM': 'Heard Island and McDonald Islands',
  'HN': 'Honduras',
  'HK': 'Hong Kong',
  'HU': 'Hungary',
  'IS': 'Iceland',
  'IN': 'India',
  'ID': 'Indonesia',
  'IR': 'Iran',
  'IQ': 'Iraq',
  'IE': 'Ireland',
  'IM': 'Isle of Man',
  'IL': 'Israel',
  'IT': 'Italy',
  'CI': 'Ivory Coast',
  'JM': 'Jamaica',
  'JP': 'Japan',
  'JE': 'Jersey',
  'JO': 'Jordan',
  'KZ': 'Kazakhstan',
  'KE': 'Kenya',
  'KI': 'Kiribati',
  'KW': 'Kuwait',
  'KG': 'Kyrgyzstan',
  'LA': 'Laos',
  'LV': 'Latvia',
  'LB': 'Lebanon',
  'LS': 'Lesotho',
  'LR': 'Liberia',
  'LY': 'Libya',
  'LI': 'Liechtenstein',
  'LT': 'Lithuania',
  'LU': 'Luxembourg',
  'MO': 'Macao',
  'MG': 'Madagascar',
  'MW': 'Malawi',
  'MY': 'Malaysia',
  'MV': 'Maldives',
  'ML': 'Mali',
  'MT': 'Malta',
  'MH': 'Marshall Islands',
  'MQ': 'Martinique',
  'MR': 'Mauritania',
  'MU': 'Mauritius',
  'YT': 'Mayotte',
  'MX': 'Mexico',
  'FM': 'Micronesia',
  'MD': 'Moldova',
  'MC': 'Monaco',
  'MN': 'Mongolia',
  'ME': 'Montenegro',
  'MS': 'Montserrat',
  'MA': 'Morocco',
  'MZ': 'Mozambique',
  'MM': 'Myanmar',
  'NA': 'Namibia',
  'NR': 'Nauru',
  'NP': 'Nepal',
  'NL': 'Netherlands',
  'NC': 'New Caledonia',
  'NZ': 'New Zealand',
  'NI': 'Nicaragua',
  'NE': 'Niger',
  'NG': 'Nigeria',
  'NU': 'Niue',
  'NF': 'Norfolk Island',
  'KP': 'North Korea',
  'Mk': 'North Macedonia',
  'MP': 'Northern Mariana Islands',
  'NO': 'Norway',
  'OM': 'Oman',
  'PK': 'Pakistan',
  'PW': 'Palau',
  'PA': 'Panama',
  'PG': 'Papua New Guinea',
  'PY': 'Paraguay',
  'PE': 'Peru',
  'PH': 'Philippines',
  'PN': 'Pitcairn',
  'PL': 'Poland',
  'PT': 'Portugal',
  'PR': 'Puerto Rico',
  'QA': 'Qatar',
  'RE': 'Réunion',
  'RO': 'Romania',
  'RU': 'Russia',
  'RW': 'Rwanda',
  'BL': 'Saint Barthélemy',
  'SH': 'Saint Helena, Ascension and Tristan da Cunha',
  'KN': 'Saint Kitts and Nevis',
  'LC': 'Saint Lucia',
  'MF': 'Saint Martin',
  'PM': 'Saint Pierre and Miquelon',
  'VC': 'Saint Vincent and the Grenadines',
  'WS': 'Samoa',
  'SM': 'San Marino',
  'ST': 'Sao Tome and Principe',
  'SA': 'Saudi Arabia',
  'SN': 'Senegal',
  'RS': 'Serbia',
  'SC': 'Seychelles',
  'SL': 'Sierra Leone',
  'SG': 'Singapore',
  'SX': 'Sint Maarten',
  'SK': 'Slovakia',
  'SI': 'Slovenia',
  'SB': 'Solomon Islands',
  'SO': 'Somalia',
  'ZA': 'South Africa',
  'GS': 'South Georgia and the South Sandwich Islands',
  'KR': 'South Korea',
  'SS': 'South Sudan',
  'ES': 'Spain',
  'LK': 'Sri Lanka',
  'PS': 'State of Palestine',
  'SD': 'Sudan',
  'SR': 'Suriname',
  'SJ': 'Svalbard and Jan Mayen',
  'SE': 'Sweden',
  'CH': 'Switzerland',
  'SY': 'Syrian Arab Republic',
  'TW': 'Taiwan',
  'TJ': 'Tajikistan',
  'TZ': 'Tanzania',
  'TH': 'Thailand',
  'TL': 'Timor-Leste',
  'TG': 'Togo',
  'TK': 'Tokelau',
  'TO': 'Tonga',
  'TT': 'Trinidad and Tobago',
  'TN': 'Tunisia',
  'TR': 'Turkey',
  'TM': 'Turkmenistan',
  'TC': 'Turks and Caicos Islands',
  'TV': 'Tuvalu',
  'UG': 'Uganda',
  'UA': 'Ukraine',
  'AE': 'United Arab Emirates',
  'GB': 'United Kingdom of Great Britain and Northern Ireland',
  'US': 'United States of America',
  'UM': 'United States Minor Outlying Islands',
  'VI': 'United States Virgin Islands',
  'UY': 'Uruguay',
  'UZ': 'Uzbekistan',
  'VU': 'Vanuatu',
  'VA': 'Vatican City',
  'VE': 'Venezuela',
  'VN': 'Viet Nam',
  'WF': 'Wallis and Futuna',
  'EH': 'Western Sahara',
  'YE': 'Yemen',
  'ZM': 'Zambia',
  'ZW': 'Zimbabwe',
};

/// All languages available in Open Weather Map API.
enum Language {
  afrikaans,
  albanian,
  arabic,
  azerbaijani,
  bulgarian,
  catalan,
  czech,
  danish,
  german,
  greek,
  english,
  basque,
  persian,
  finnish,
  french,
  galician,
  hebrew,
  hindi,
  croatian,
  hungarian,
  indonesian,
  italian,
  japanese,
  korean,
  latvian,
  lithuanian,
  macedonian,
  norwegian,
  dutch,
  polish,
  portuguese,
  portugueseBrasil,
  romanian,
  russian,
  swedish,
  slovak,
  slovenian,
  spanish,
  serbian,
  thai,
  turkish,
  ukrainian,
  vietnamese,
  chineseSimplified,
  chineseTraditional,
  zulu,
}

/// Defines a string with available language.
///
/// Use the [language] parameter available in the [Language] enumerator.
/// Return the language code used in Open Weather Map API.
String languageCode(Language language) {
  switch (language) {
    case Language.afrikaans:
      return 'af';
    case Language.albanian:
      return 'al';
    case Language.arabic:
      return 'ar';
    case Language.azerbaijani:
      return 'az';
    case Language.bulgarian:
      return 'bg';
    case Language.catalan:
      return 'ca';
    case Language.czech:
      return 'cz';
    case Language.danish:
      return 'da';
    case Language.german:
      return 'de';
    case Language.greek:
      return 'el';
    case Language.english:
      return 'en';
    case Language.basque:
      return 'eu';
    case Language.persian:
      return 'fa';
    case Language.finnish:
      return 'fi';
    case Language.french:
      return 'fr';
    case Language.galician:
      return 'gl';
    case Language.hebrew:
      return 'he';
    case Language.hindi:
      return 'hi';
    case Language.croatian:
      return 'hr';
    case Language.hungarian:
      return 'hu';
    case Language.indonesian:
      return 'id';
    case Language.italian:
      return 'it';
    case Language.japanese:
      return 'ja';
    case Language.korean:
      return 'kr';
    case Language.latvian:
      return 'la';
    case Language.lithuanian:
      return 'lt';
    case Language.macedonian:
      return 'mk';
    case Language.norwegian:
      return 'no';
    case Language.dutch:
      return 'nl';
    case Language.polish:
      return 'pl';
    case Language.portuguese:
      return 'pt';
    case Language.portugueseBrasil:
      return 'pt_br';
    case Language.romanian:
      return 'ro';
    case Language.russian:
      return 'ru';
    case Language.swedish:
      return 'sv';
    case Language.slovak:
      return 'sk';
    case Language.slovenian:
      return 'sl';
    case Language.spanish:
      return 'es';
    case Language.serbian:
      return 'sr';
    case Language.thai:
      return 'th';
    case Language.turkish:
      return 'tr';
    case Language.ukrainian:
      return 'uk';
    case Language.vietnamese:
      return 'vi';
    case Language.chineseSimplified:
      return 'zh_cn';
    case Language.chineseTraditional:
      return 'zh_tw';
    case Language.zulu:
      return 'zu';
  }
}
