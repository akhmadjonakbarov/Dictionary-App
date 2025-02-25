List<String> entriesTag = [
  'Personal 📝',
  'Married 💍',
  'Feeling Sad 😔',
  'Happy 😊',
  'Content 😀',
  'Tired 😩',
  'Working 💼',
  'Friends 👯‍♂️',
  'Work 💼',
  'Travel 🌍',
  'Hobby 🎨',
  'Health 💪',
  'Study 📚',
  'Project 🚀',
  'Family 👪',
  'Insiration ✨'
];

// Create a map of country codes to languages
final Map<String, String> countryLanguageMap = {
  'AD': 'Catalan',
  'AE': 'Arabic',
  'AF': 'Dari',
  'AG': 'English',
  'AI': 'English',
  'AL': 'Albanian',
  'AM': 'Armenian',
  'AO': 'Portuguese',
  'AQ': 'N/A',
  'AR': 'Spanish',
  'AS': 'Samoan',
  'AT': 'German',
  'AU': 'English',
  'AW': 'Dutch',
  'AX': 'Swedish',
  'AZ': 'Azerbaijani',
  'BA': 'Bosnian',
  'BB': 'English',
  'BD': 'Bengali',
  'BE': 'Dutch',
  'BF': 'French',
  'BG': 'Bulgarian',
  'BH': 'Arabic',
  'BI': 'Kirundi',
  'BJ': 'French',
  'BL': 'French',
  'BM': 'English',
  'BN': 'Malay',
  'BO': 'Spanish',
  'BQ': 'Dutch',
  'BR': 'Portuguese',
  'BS': 'English',
  'BT': 'Dzongkha',
  'BV': 'N/A',
  'BW': 'English',
  'BY': 'Belarusian',
  'BZ': 'English',
  'CA': 'English',
  'CC': 'English',
  'CD': 'French',
  'CF': 'French',
  'CG': 'French',
  'CH': 'German',
  'CI': 'French',
  'CK': 'English',
  'CL': 'Spanish',
  'CM': 'French',
  'CN': 'Chinese',
  'CO': 'Spanish',
  'CR': 'Spanish',
  'CU': 'Spanish',
  'CV': 'Portuguese',
  'CW': 'Dutch',
  'CX': 'English',
  'CY': 'Greek',
  'CZ': 'Czech',
  'DE': 'German',
  'DJ': 'French',
  'DK': 'Danish',
  'DM': 'English',
  'DO': 'Spanish',
  'DZ': 'Arabic',
  'EC': 'Spanish',
  'EE': 'Estonian',
  'EG': 'Arabic',
  'EH': 'Arabic',
  'ER': 'Tigrinya',
  'ESP': 'Spanish',
  'ET': 'Amharic',
  'FI': 'Finnish',
  'FJ': 'English',
  'FK': 'English',
  'FM': 'English',
  'FO': 'Faroese',
  'FR': 'French',
  'GA': 'French',
  'GB': 'English',
  'GB-SCT': 'Scottish Gaelic',
  'GB-WLS': 'Welsh',
  'GB-ENG': 'English',
  'GB-NIR': 'English',
  'GD': 'English',
  'GE': 'Georgian',
  'GF': 'French',
  'GG': 'English',
  'GH': 'English',
  'GI': 'English',
  'GL': 'Greenlandic',
  'GM': 'English',
  'GN': 'French',
  'GP': 'French',
  'GQ': 'Spanish',
  'GR': 'Greek',
  'GS': 'English',
  'GT': 'Spanish',
  'GU': 'English',
  'GW': 'Portuguese',
  'GY': 'English',
  'HK': 'Chinese',
  'HM': 'English',
  'HN': 'Spanish',
  'HR': 'Croatian',
  'HT': 'Haitian Creole',
  'HU': 'Hungarian',
  'ID': 'Indonesian',
  'IE': 'English',
  'IL': 'Hebrew',
  'IM': 'English',
  'IN': 'Hindi',
  'IO': 'English',
  'IQ': 'Arabic',
  'IR': 'Persian',
  'IS': 'Icelandic',
  'IT': 'Italian',
  'JE': 'English',
  'JM': 'English',
  'JO': 'Arabic',
  'JP': 'Japanese',
  'KE': 'English',
  'KG': 'Kyrgyz',
  'KH': 'Khmer',
  'KI': 'English',
  'KM': 'Comorian',
  'KN': 'English',
  'KP': 'Korean',
  'KR': 'Korean',
  'KW': 'Arabic',
  'KY': 'English',
  'KZ': 'Kazakh',
  'LA': 'Lao',
  'LB': 'Arabic',
  'LC': 'English',
  'LI': 'German',
  'LK': 'Sinhala',
  'LR': 'English',
  'LS': 'Sesotho',
  'LTU': 'Lithuanian',
  'LU': 'Luxembourgish',
  'LV': 'Latvian',
  'LY': 'Arabic',
  'MA': 'Arabic',
  'MC': 'French',
  'MD': 'Romanian',
  'ME': 'Montenegrin',
  'MF': 'French',
  'MG': 'Malagasy',
  'MH': 'English',
  'MK': 'Macedonian',
  'ML': 'French',
  'MM': 'Burmese',
  'MN': 'Mongolian',
  'MO': 'Chinese',
  'MP': 'English',
  'MQ': 'French',
  'MR': 'Arabic',
  'MS': 'English',
  'MT': 'Maltese',
  'MU': 'English',
  'MV': 'Dhivehi',
  'MW': 'English',
  'MX': 'Spanish',
  'MY': 'Malay',
  'MZ': 'Portuguese',
  'NA': 'English',
  'NC': 'French',
  'NE': 'French',
  'NF': 'English',
  'NG': 'English',
  'NI': 'Spanish',
  'NL': 'Dutch',
  'NO': 'Norwegian',
  'NP': 'Nepali',
  'NR': 'Nauruan',
  'NU': 'English',
  'NZ': 'English',
  'OM': 'Arabic',
  'PA': 'Spanish',
  'PE': 'Spanish',
  'PF': 'French',
  'PG': 'English',
  'PH': 'Filipino',
  'PK': 'Urdu',
  'PL': 'Polish',
  'PM': 'French',
  'PN': 'English',
  'PR': 'Spanish',
  'PS': 'Arabic',
  'PT': 'Portuguese',
  'PW': 'English',
  'PY': 'Spanish',
  'QA': 'Arabic',
  'RE': 'French',
  'RO': 'Romanian',
  'RS': 'Serbian',
  'RU': 'Russian',
  'RW': 'Kinyarwanda',
  'SA': 'Arabic',
  'SB': 'English',
  'SC': 'English',
  'SD': 'Arabic',
  'SE': 'Swedish',
  'SG': 'English',
  'SH': 'English',
  'SI': 'Slovene',
  'SJ': 'Norwegian',
  'SK': 'Slovak',
  'SL': 'English',
  'SM': 'Italian',
  'SN': 'French',
  'SO': 'Somali',
  'SR': 'Dutch',
  'SS': 'English',
  'ST': 'Portuguese',
  'SV': 'Spanish',
  'SX': 'Dutch',
  'SY': 'Arabic',
  'SZ': 'Swazi',
  'TC': 'English',
  'TD': 'French',
  'TF': 'French',
  'TG': 'French',
  'TH': 'Thai',
  'TJ': 'Tajik',
  'TK': 'English',
  'TL': 'Portuguese',
  'TM': 'Turkmen',
  'TN': 'Arabic',
  'TO': 'Tongan',
  'TR': 'Turkish',
  'TT': 'English',
  'TV': 'English',
  'TW': 'Chinese',
  'TZ': 'Swahili',
  'UA': 'Ukrainian',
  'UG': 'English',
  'UM': 'English',
  'US': 'English',
  'UY': 'Spanish',
  'UZ': 'Uzbek',
  'VA': 'Italian',
  'VC': 'English',
  'VE': 'Spanish',
  'VG': 'English',
  'VI': 'English',
  'VN': 'Vietnamese',
  'VU': 'Bislama',
  'WF': 'French',
  'WS': 'Samoan',
  'XK': 'Albanian',
  'YE': 'Arabic',
  'YT': 'French',
  'ZA': 'Afrikaans',
  'ZM': 'English',
  'ZW': 'English',
};
