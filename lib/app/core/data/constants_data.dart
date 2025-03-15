import 'dart:math';

import '../../shared/models/word.dart';

final List<String> levels = [
  'beginner',
  'intermediate',
  'advanced',
];

// Create a map of country codes to languages
final Map<String, String> countryLanguageMap = {
  'AD': 'Catalan',
  'AE': 'Arabic',
  'AF': 'Dari',
  'AL': 'Albanian',
  'AM': 'Armenian',
  'AO': 'Portuguese',
  'AR': 'Spanish',
  'AS': 'Samoan',
  'AT': 'German',
  'AW': 'Dutch',
  'AX': 'Swedish',
  'AZ': 'Azerbaijani',
  'BA': 'Bosnian',
  'BD': 'Bengali',
  'BE': 'Dutch',
  'BG': 'Bulgarian',
  'BI': 'Kirundi',
  'BN': 'Malay',
  'BO': 'Spanish',
  'BQ': 'Dutch',
  'BR': 'Portuguese',
  'BT': 'Dzongkha',
  'BY': 'Belarusian',
  'CH': 'German',
  'CL': 'Spanish',
  'CN': 'Chinese',
  'CO': 'Spanish',
  'CR': 'Spanish',
  'CU': 'Spanish',
  'CV': 'Portuguese',
  'CW': 'Dutch',
  'CY': 'Greek',
  'CZ': 'Czech',
  'DE': 'German',
  'DK': 'Danish',
  'DO': 'Spanish',
  'EC': 'Spanish',
  'EE': 'Estonian',
  'ER': 'Tigrinya',
  'ESP': 'Spanish',
  'ET': 'Amharic',
  'FI': 'Finnish',
  'FO': 'Faroese',
  'FR': 'French',
  'GB-SCT': 'Scottish Gaelic',
  'GB-WLS': 'Welsh',
  'GE': 'Georgian',
  'GL': 'Greenlandic',
  'GQ': 'Spanish',
  'GR': 'Greek',
  'GT': 'Spanish',
  'GW': 'Portuguese',
  'HK': 'Chinese',
  'HN': 'Spanish',
  'HR': 'Croatian',
  'HT': 'Haitian Creole',
  'HU': 'Hungarian',
  'ID': 'Indonesian',
  'IL': 'Hebrew',
  'IN': 'Hindi',
  'IR': 'Persian',
  'IS': 'Icelandic',
  'IT': 'Italian',
  'JP': 'Japanese',
  'KG': 'Kyrgyz',
  'KH': 'Khmer',
  'KM': 'Comorian',
  'KP': 'Korean',
  'KR': 'Korean',
  'KZ': 'Kazakh',
  'LA': 'Lao',
  'LI': 'German',
  'LK': 'Sinhala',
  'LS': 'Sesotho',
  'LTU': 'Lithuanian',
  'LU': 'Luxembourgish',
  'LV': 'Latvian',
  'MD': 'Romanian',
  'ME': 'Montenegrin',
  'MF': 'French',
  'MG': 'Malagasy',
  'MK': 'Macedonian',
  'ML': 'French',
  'MM': 'Burmese',
  'MN': 'Mongolian',
  'MO': 'Chinese',
  'MQ': 'French',
  'MT': 'Maltese',
  'MV': 'Dhivehi',
  'MX': 'Spanish',
  'MY': 'Malay',
  'MZ': 'Portuguese',
  'NI': 'Spanish',
  'NL': 'Dutch',
  'NO': 'Norwegian',
  'NP': 'Nepali',
  'NR': 'Nauruan',
  'PA': 'Spanish',
  'PE': 'Spanish',
  'PF': 'French',
  'PH': 'Filipino',
  'PK': 'Urdu',
  'PL': 'Polish',
  'PM': 'French',
  'PR': 'Spanish',
  'PT': 'Portuguese',
  'PY': 'Spanish',
  'RE': 'French',
  'RO': 'Romanian',
  'RS': 'Serbian',
  'RU': 'Russian',
  'RW': 'Kinyarwanda',
  'SE': 'Swedish',
  'SI': 'Slovene',
  'SJ': 'Norwegian',
  'SK': 'Slovak',
  'SM': 'Italian',
  'SN': 'French',
  'SO': 'Somali',
  'SR': 'Dutch',
  'ST': 'Portuguese',
  'SV': 'Spanish',
  'SX': 'Dutch',
  'SZ': 'Swazi',
  'TD': 'French',
  'TF': 'French',
  'TG': 'French',
  'TH': 'Thai',
  'TJ': 'Tajik',
  'TL': 'Portuguese',
  'TM': 'Turkmen',
  'TO': 'Tongan',
  'TR': 'Turkish',
  'TW': 'Chinese',
  'TZ': 'Swahili',
  'UA': 'Ukrainian',
  'US': 'English',
  'UZ': 'Uzbek',
  'VA': 'Italian',
  'VE': 'Spanish',
  'VN': 'Vietnamese',
  'VU': 'Bislama',
  'WF': 'French',
  'WS': 'Samoan',
  'XK': 'Albanian',
  'YT': 'French',
  'ZA': 'Afrikaans',
};

List grammarRules = [
  {
    "name": "Noun",
    "desc": [
      "A word that represents a person, place, thing, or idea.",
      "Examples: dog, city, happiness, John.",
      "Can be singular (e.g., 'cat') or plural (e.g., 'cats').",
      "Can be proper (e.g., 'London') or common (e.g., 'city').",
      "Collective Nouns: Refer to groups (e.g., 'team', 'family').",
      "Abstract Nouns: Represent ideas or concepts (e.g., 'freedom', 'love').",
      "Countable Nouns: Can be counted (e.g., 'apple', 'book').",
      "Uncountable Nouns: Cannot be counted (e.g., 'water', 'information')."
    ]
  },
  {
    "name": "Verb",
    "desc": [
      "A word that describes an action, state, or occurrence.",
      "Present Simple: Actions that happen regularly (e.g., 'I eat breakfast every day.').",
      "Past Simple: Actions that finished in the past (e.g., 'I ate breakfast yesterday.').",
      "Future Simple: Actions that will happen in the future (e.g., 'I will eat breakfast tomorrow.').",
      "Present Continuous: Actions happening now (e.g., 'I am eating breakfast.').",
      "Past Continuous: Actions happening in the past over a period of time (e.g., 'I was eating breakfast when you called.').",
      "Present Perfect: Actions that happened at an unspecified time before now (e.g., 'I have eaten breakfast.').",
      "Past Perfect: Actions completed before another action in the past (e.g., 'I had eaten breakfast before I left.').",
      "Future Continuous: Actions that will be happening at a specific time in the future (e.g., 'I will be eating breakfast at 8 AM tomorrow.').",
      "Modal Verbs: Express necessity, possibility, or ability (e.g., 'can', 'must', 'should')."
    ]
  },
  {
    "name": "Adjective",
    "desc": [
      "A word that describes or modifies a noun or pronoun.",
      "Degrees of Comparison:",
      "  - Positive: 'This is a big house.'",
      "  - Comparative: 'This house is bigger than that one.'",
      "  - Superlative: 'This is the biggest house in the neighborhood.'",
      "Order of Adjectives: opinion, size, age, shape, color, origin, material, purpose.",
      "Predicate Adjectives: Follow linking verbs (e.g., 'The sky is blue.').",
      "Compound Adjectives: Hyphenated words (e.g., 'well-known', 'high-quality')."
    ]
  },
  {
    "name": "Adverb",
    "desc": [
      "A word that modifies a verb, adjective, or another adverb.",
      "Types of Adverbs:",
      "  - Manner: 'She sings beautifully.'",
      "  - Time: 'I will call you later.'",
      "  - Place: 'He looked everywhere.'",
      "  - Frequency: 'I always brush my teeth.'",
      "  - Degree: 'She is very talented.'",
      "Position: Before the main verb, after 'to be,' or at the beginning/end of a sentence.",
      "Adverbs of Certainty: 'definitely', 'probably', 'certainly'.",
      "Adverbs of Comment: 'fortunately', 'unfortunately', 'interestingly'."
    ]
  },
  {
    "name": "Preposition",
    "desc": [
      "A word that shows the relationship between a noun/pronoun and another word.",
      "Common Prepositions:",
      "  - Time: 'at 5 PM', 'on Monday', 'in 2023'.",
      "  - Place: 'on the table', 'in the room', 'at the park'.",
      "  - Direction: 'to the store', 'from the office', 'into the car'.",
      "  - Purpose: 'for you', 'with love', 'about the project'.",
      "Prepositional Phrases: 'She sat on the chair.'",
      "Compound Prepositions: 'according to', 'in front of', 'because of'.",
      "Prepositions with Verbs: 'depend on', 'believe in', 'listen to'."
    ]
  },
  {
    "name": "Conjunction",
    "desc": [
      "A word that connects words, phrases, or clauses.",
      "Types of Conjunctions:",
      "  - Coordinating: 'and', 'but', 'or' (e.g., 'I wanted to go, but it was raining.').",
      "  - Subordinating: 'because', 'although', 'if' (e.g., 'I stayed home because it was raining.').",
      "  - Correlative: 'either...or', 'neither...nor', 'both...and' (e.g., 'Either you come with me, or I go alone.').",
      "Conjunctive Adverbs: 'however', 'therefore', 'moreover' (e.g., 'I was tired; however, I stayed awake.')."
    ]
  },
  {
    "name": "Pronoun",
    "desc": [
      "A word that replaces a noun to avoid repetition.",
      "Types of Pronouns:",
      "  - Personal: 'I', 'you', 'he', 'she', 'it', 'we', 'they'.",
      "  - Possessive: 'mine', 'yours', 'his', 'hers', 'ours', 'theirs'.",
      "  - Reflexive: 'myself', 'yourself', 'himself', 'herself', 'itself', 'ourselves', 'themselves'.",
      "  - Demonstrative: 'this', 'that', 'these', 'those'.",
      "  - Relative: 'who', 'whom', 'whose', 'which', 'that'.",
      "  - Interrogative: 'who', 'whom', 'whose', 'which', 'what'.",
      "  - Indefinite: 'someone', 'anyone', 'everything', 'nothing'."
    ]
  },
  {
    "name": "Interjection",
    "desc": [
      "A word or phrase that expresses strong emotion or reaction.",
      "Examples:",
      "  - Joy: 'Wow! That’s amazing!'",
      "  - Surprise: 'Oh! I didn’t see you there.'",
      "  - Pain: 'Ouch! That hurt.'",
      "  - Greeting: 'Hi! How are you?'",
      "  - Approval: 'Bravo! Well done.'",
      "  - Disapproval: 'Ugh! I hate this.'",
      "Punctuation: Often followed by an exclamation mark (!) or a comma (,).",
      "Interjections in Sentences: 'Oh no, I forgot my keys!'"
    ]
  },
  {
    "name": "Article",
    "desc": [
      "A word that defines a noun as specific or unspecific.",
      "Types of Articles:",
      "  - Definite: 'the' (e.g., 'I saw the dog.').",
      "  - Indefinite: 'a' (before consonant sounds), 'an' (before vowel sounds) (e.g., 'I saw a cat.' / 'I ate an apple.').",
      "Zero Article: No article is used with plural or uncountable nouns when referring to general ideas (e.g., 'Cats are cute.' / 'Love is beautiful.')."
    ]
  },
  {
    "name": "Tenses",
    "desc": [
      "Verb forms that indicate the time of an action or state.",
      "Present Simple: 'I eat breakfast every day.'",
      "Past Simple: 'I ate breakfast yesterday.'",
      "Future Simple: 'I will eat breakfast tomorrow.'",
      "Present Continuous: 'I am eating breakfast.'",
      "Past Continuous: 'I was eating breakfast when you called.'",
      "Present Perfect: 'I have eaten breakfast.'",
      "Past Perfect: 'I had eaten breakfast before I left.'",
      "Future Continuous: 'I will be eating breakfast at 8 AM tomorrow.'",
      "Present Perfect Continuous: 'I have been eating breakfast for 10 minutes.'",
      "Past Perfect Continuous: 'I had been eating breakfast when you arrived.'",
      "Future Perfect: 'I will have eaten breakfast by 9 AM.'"
    ]
  }
];

List<Word> words = [
  Word(
      key: 'дом',
      value: 'house',
      category: 'beginner',
      image:
          'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg'),
  Word(
      key: 'стол',
      value: 'table',
      category: 'beginner',
      image:
          'https://www.office-furniture-direct.co.uk/Cache/Images/OMPT1280RECBE-FRONT-45-2-1500x1500.jpg'),
  Word(
      key: 'стул',
      value: 'chair',
      category: 'beginner',
      image:
          'https://www.foundations.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/f/o/foundations-little-scholars-kids-school-chairs-12-in-seat-height_main_1.jpg'),
  Word(
      key: 'книга',
      value: 'book',
      category: 'beginner',
      image:
          'https://static01.nyt.com/images/2024/06/30/books/books-flat-slide-21TH/books-flat-slide-21TH-articleLarge.png'),
  Word(
      key: 'ручка',
      value: 'pen',
      category: 'beginner',
      image:
          'https://images-cdn.ubuy.co.in/66a4889eed726d36cd238c99-amazon-basics-fountain-pen-with-two.jpg'),
  Word(
      key: 'вода',
      value: 'water',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_EoWll5jq4zIcwRK5e-NgqGiOI6t1llOt7w&s'),
  Word(
      key: 'хлеб',
      value: 'bread',
      category: 'beginner',
      image:
          'https://www.melskitchencafe.com/wp-content/uploads/french-bread2.jpg'),
  Word(
      key: 'молоко',
      value: 'milk',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKRc1vsNojeMRzLpjSF-_g3ihYlGBwVgpNqw&s'),
  Word(
      key: 'яблоко',
      value: 'apple',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROMyyQhwF-a9xiJg1xM54SvyvzqFC08waMaA&s'),
  Word(
      key: 'мама',
      value: 'mom',
      category: 'beginner',
      image:
          'https://thumbs.dreamstime.com/b/working-mom-vector-illustration-65638113.jpg'),
  Word(
      key: 'папа',
      value: 'dad',
      category: 'beginner',
      image:
          'https://thumbs.dreamstime.com/b/happy-cute-kid-boy-hugging-dad-love-164772554.jpg'),
  Word(
      key: 'брат',
      value: 'brother',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBsAm9rjZEzscCe67LKvnWWqdEkXHnE6Jv4w&s'),
  Word(
      key: 'сестра',
      value: 'sister',
      category: 'beginner',
      image:
          'https://thumbs.dreamstime.com/b/cute-little-baby-girl-hug-big-sister-sibling-227545703.jpg'),
  Word(
      key: 'друг',
      value: 'friend',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3ZAxjoV5lMwXt3wjkw2LeebDZDf6hzkkjxg&s'),
  Word(
      key: 'школа',
      value: 'school',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO8N5CmiY_qUV7sxsgQqAOJVwl6orG8-bLmw&s'),
  Word(
      key: 'учитель',
      value: 'teacher',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpw3g0n46sjePRBgjL4ewmsFZOZ9RZPL95qQ&s'),
  Word(
      key: 'ученик',
      value: 'student',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdF93my5cnG_tbvUlY7iXuoHv-p6fbJEL6JA&s'),
  Word(
      key: 'город',
      value: 'city',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR13yeF2JgXOFr433EylkdtuK6Gh3ZBZHkNGQ&s'),
  Word(
      key: 'страна',
      value: 'country',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7Hoz2EV6tvYlmfNnmmVLXDtE8qYhFcCkSCA&s'),
  Word(
      key: 'работа',
      value: 'work',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi9YiFPX3i99WKTgPXJrbCyo48jiepqA7FMA&s'),
  Word(
      key: 'день',
      value: 'day',
      category: 'beginner',
      image:
          'https://www.shutterstock.com/image-photo/day-night-time-change-concept-600nw-2326233419.jpg'),
  Word(
      key: 'ночь',
      value: 'night',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRshTJzgY5WjHVJte66iQ5_Oh49Rh38FfxdQQ&s'),
  Word(
      key: 'утро',
      value: 'morning',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSas8VfqrgMh-voZF2VCYGxJNmjmBg9PfikFQ&s'),
  Word(
      key: 'вечер',
      value: 'evening',
      category: 'beginner',
      image: 'https://torange.biz/photo/36/HD/evening-sky-beautiful-36499.jpg'),
  Word(
      key: 'время',
      value: 'time',
      category: 'beginner',
      image: 'https://cdn.mos.cms.futurecdn.net/9meMCxtJU3NWkh5YcPs7qG.jpg'),
  Word(
      key: 'год',
      value: 'year',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjF117E5vsADdgOB4gC3QUfu-5dhYncqaPUA&s'),
  Word(
      key: 'месяц',
      value: 'month',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREl2biUEYT_eb0tGQ-Yc7WVFuoqQ8so30lxw&s'),
  Word(
      key: 'неделя',
      value: 'week',
      category: 'beginner',
      image:
          'https://i.guim.co.uk/img/media/14cfce1b503c318f56ac82627c25e123519c9ea0/0_78_4201_2521/master/4201.jpg?width=1200&quality=85&auto=format&fit=max&s=4e48b4b3348af65bd89f8741fb4e101c'),
  Word(
      key: 'сегодня',
      value: 'today',
      category: 'beginner',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZlzkoXqzj-DqpqHZnNvSCeVneFFT9dQnN3A&s'),
  Word(
      key: 'завтра',
      value: 'tomorrow',
      category: 'beginner',
      image:
          'https://media.istockphoto.com/id/521978413/photo/tomorrow-now-yesterday.jpg?s=612x612&w=0&k=20&c=y1OnRtn6gij5GnpsDiOPNKZQ4DeyC3vv7quZJ1s93is='),

// Intermediate Level
  Word(
      key: 'понимать',
      value: 'to understand',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAopj_QQFpkk1UtCYyuBdDjY8GsDxvpe582w&s'),
  Word(
      key: 'говорить',
      value: 'to speak',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzfiuSFmlFjvMNu3FC8iftKQ6XxO4ax51JaQ&s'),
  Word(
      key: 'слушать',
      value: 'to listen',
      category: 'intermediate',
      image:
          'https://static.wixstatic.com/media/bce610_2f210200995d4cd5828a0843710b37ce~mv2.jpg/v1/fill/w_568,h_380,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/bce610_2f210200995d4cd5828a0843710b37ce~mv2.jpg'),
  Word(
      key: 'читать',
      value: 'to read',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS6HzB0ts5LvmnyeqdFFr6dqIRdfK98sMFRQ&s'),
  Word(
      key: 'писать',
      value: 'to write',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFpZPt24rLNz7-pctdjJ9uA-OE7gfmfaGu6w&s'),
  Word(
      key: 'думать',
      value: 'to think',
      category: 'intermediate',
      image:
          'https://gohighbrow.com/wp-content/uploads/2019/03/Learning-how-to-think-clearly_portfolio.png'),
  Word(
      key: 'любить',
      value: 'to love',
      category: 'intermediate',
      image: 'https://cdn.tinybuddha.com/wp-content/uploads/2014/08/Love.jpg'),
  Word(
      key: 'ненавидеть',
      value: 'to hate',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSno2IAQCSxYm7Y0rzDoAJdlXixu4uIwjD8VQ&s'),
  Word(
      key: 'идти',
      value: 'to go',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAqlO2L8u41t4a35-uwlLUsGYex0bBD7bnQw&s'),
  Word(
      key: 'приходить',
      value: 'to come',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_qOjV8d6sS5Jl2WeKFHVKRW_BIITq4txLqw&s'),
  Word(
      key: 'есть',
      value: 'to eat',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ218r7rLkyVI7aBQLp5So1u_w0NqiP7gfY8g&s'),
  Word(
      key: 'пить',
      value: 'to drink',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtgQMpT6zAYl8erEcYRZG-If0-QZXqGISzoQ&s'),
  Word(
      key: 'спать',
      value: 'to sleep',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFYvfbpIBIRnCInKx2R6oTeuTg3bFnq6brLw&s'),
  Word(
      key: 'работать',
      value: 'to work',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUpAAp0LLFXT2cl2cIMQ5qZxjVAlzId7cczA&s'),
  Word(
      key: 'учить',
      value: 'to learn',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTezKIultr4GJNVbYa7jvMaz-ZTAaFipAfXWg&s'),
  Word(
      key: 'знать',
      value: 'to know',
      category: 'intermediate',
      image:
          'https://www.signupgenius.com/cms/socialMediaImages/getting-to-know-you-questions-facebook-1200x630.png'),
  Word(
      key: 'видеть',
      value: 'to see',
      category: 'intermediate',
      image:
          'https://d3mvlb3hz2g78.cloudfront.net/wp-content/uploads/2011/07/thumb_720_450_little-girl-looking-magnifying-glass_shutterstock_64244332.jpg'),
  Word(
      key: 'слышать',
      value: 'to hear',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjKT2Z3DnAZRonUeISM9ATMcVm0wZlHoVPJw&s'),
  Word(
      key: 'чувствовать',
      value: 'to feel',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTxLiQqPr3-lpGteNVSY0aeBeXpt5m7N75IA&s'),
  Word(
      key: 'помогать',
      value: 'to help',
      category: 'intermediate',
      image:
          'https://cdn.themix.org.uk/uploads/2020/04/Helping-Community-Article.jpg'),
  Word(
      key: 'играть',
      value: 'to play',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRHg1j28o670MrDncCtN1x1XjHi18JW-OxCQ&s'),
  Word(
      key: 'бежать',
      value: 'to run',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRkByVwgHjlJHwnYWwTQKjOfR8Y7ZDOD6qQA&s'),
  Word(
      key: 'стоять',
      value: 'to stand',
      category: 'intermediate',
      image:
          'https://blogsdir.imgix.net/1432/files/2020/10/sit-2-stand-with-2-arm-support-300x300.jpg?auto=compress,format&cs=adobergb1998&'),
  Word(
      key: 'сидеть',
      value: 'to sit',
      category: 'intermediate',
      image:
          'https://www.sensorycorner.co.nz/cdn/shop/files/Movin--Sit-_Junior_-Gymnic-1692747992433_800x.jpg?v=1697421351'),
  Word(
      key: 'лежать',
      value: 'to lie down',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStmw1kbPN1iTNN6IpsbYexZ7wzniQi2vQIhg&s'),
  Word(
      key: 'покупать',
      value: 'to buy',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg2UcYQPmQv_1DSH_n87G3aiVxq7glQKMxA&s'),
  Word(
      key: 'продавать',
      value: 'to sell',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFIiVKWegEPo7wghJu_mo8xzMrQzgsEpjKFA&s'),
  Word(
      key: 'платить',
      value: 'to pay',
      category: 'intermediate',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9jQQl0_2u7C0P7neAx_9W36hjXl3PXsO3dQ&s'),
  Word(
      key: 'начинать',
      value: 'to start',
      category: 'intermediate',
      image:
          'https://media.istockphoto.com/id/1303457521/vector/ready-to-start-business-begin-new-job-or-preparation-for-work-focus-and-willingness-concept.jpg?s=612x612&w=0&k=20&c=S7dqTBPrHP7JKgAuD-vqh_arajQ5UmTywNzjV8XavOc='),
  Word(
      key: 'заканчивать',
      value: 'to finish',
      category: 'intermediate',
      image:
          'https://media.istockphoto.com/id/1300123069/photo/runners-running-towards-the-finish-line.jpg?s=612x612&w=0&k=20&c=XNlsYwQWlHHIlNYaxLuJU-YrD46ZTdPh9WWQpOt6Z60='),

// Advanced Level
  Word(
      key: 'достигать',
      value: 'to achieve',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh3GP_eZHU2ljRFu8cvnSMrisuS3Dgw61T3Q&s'),
  Word(
      key: 'влиять',
      value: 'to influence',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8SOKkfTDZYWV_xDOIJ6PXGFDmnsLpAHtUCA&s'),
  Word(
      key: 'обсуждать',
      value: 'to discuss',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDz9imugJK7dZhu6WSUx0hsW6QbigB0_iqTA&s'),
  Word(
      key: 'решать',
      value: 'to solve',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3qKsKytyrx-bFa_i0_MWsCxYe2M5WhY8Teg&s'),
  Word(
      key: 'создавать',
      value: 'to create',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmn0JiM6Ti2ijYCHUMd5NpoIbrXcX2sw8-UQ&s'),
  Word(
      key: 'разрушать',
      value: 'to destroy',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjLCGcX_Hki8b26c9skYgOQVquUQhQUFDTwg&s'),
  Word(
      key: 'поддерживать',
      value: 'to support',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLIZ4ynciekGfscXo5dCNoegtntoM-PN4z6A&s'),
  Word(
      key: 'предотвращать',
      value: 'to prevent',
      category: 'advanced',
      image:
          'https://png.pngtree.com/png-vector/20230518/ourmid/pngtree-prevention-vector-png-image_7101186.png'),
  Word(
      key: 'улучшать',
      value: 'to improve',
      category: 'advanced',
      image:
          'https://thumbs.dreamstime.com/b/hand-holds-arrow-graph-pulls-to-improve-business-up-flat-concept-illustration-progress-success-businessman-lifts-89108413.jpg'),
  Word(
      key: 'ухудшать',
      value: 'to worsen',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmtaUbYsHfff_118_iaXeGGQw5x0E-mpQtw&s'),
  Word(
      key: 'исследовать',
      value: 'to explore',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt2zSWwJ12AJQGRdDob0Hu9nv0srf8OBamoA&s'),
  Word(
      key: 'открывать',
      value: 'to discover',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfcS7KwjbY1JzixRi6w-xK9u1A6plLkNZoLA&s'),
  Word(
      key: 'изобретать',
      value: 'to invent',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIqkJTDy6ozfUIJ9oXlj_oPLLM6Rz7WYW8jg&s'),
  Word(
      key: 'управлять',
      value: 'to manage',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXF1HurdTtS3L4nOltCYRREvmQ2IOct_Uesg&s'),
  Word(
      key: 'контролировать',
      value: 'to control',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM3dHONose4iABqkIrvri1Jhbw2NgnliifAg&s'),
  Word(
      key: 'защищать',
      value: 'to protect',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt6Ca-5n_80B-c0i1AWeQNE-CPN-CERh95Tg&s'),
  Word(
      key: 'атаковать',
      value: 'to attack',
      category: 'advanced',
      image:
          'https://st2.depositphotos.com/1912333/7190/i/450/depositphotos_71901159-stock-photo-business-woman-attack.jpg'),
  Word(
      key: 'соглашаться',
      value: 'to agree',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTAyuy2rDFnHF4ZnPtmDey6B9oATsnzh5psw&s'),
  Word(
      key: 'спорить',
      value: 'to argue',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1DCjd5DTgLDSYAbAE8UQ7yZYVS_gWjUPEwg&s'),
  Word(
      key: 'доказывать',
      value: 'to prove',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRXwaQGLqKWj9naKpRTAHKn5iLHIkXsp8Fzw&s'),
  Word(
      key: 'сомневаться',
      value: 'to doubt',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHMAX3MkWQFv4lJCz5n_grjGUOQw9pCVCmHQ&s'),
  Word(
      key: 'верить',
      value: 'to believe',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKXRF2JCIpyZzox7Il_CkddZ6dVd0HZretWA&s'),
  Word(
      key: 'мечтать',
      value: 'to dream',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXg3d6vyek8E7_-YqFFjvrpGYiCoBHF9xAGA&s'),
  Word(
      key: 'планировать',
      value: 'to plan',
      category: 'advanced',
      image:
          'https://cdn.prod.website-files.com/62196607bf1b46c300301846/6568ae443b83c8970807a066_tgumae817adlzfhcnuxn.webp'),
  Word(
      key: 'организовывать',
      value: 'to organize',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv-8IzN8uLtVJx5XcjU21MByh1AWhqVOoXJw&s'),
  Word(
      key: 'участвовать',
      value: 'to participate',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSoNWKXqkH7J8s3gxnyEaRVMSmytIp5RFKwg&s'),
  Word(
      key: 'побеждать',
      value: 'to win',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpFoj4ebEsKJIqw2A7yBLFFHh2IljpUpuB-w&s'),
  Word(
      key: 'проигрывать',
      value: 'to lose',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS74_3b5-XZ6wDndNgkHD0CkYhQJYCqw0tO9g&s'),
  Word(
      key: 'рисковать',
      value: 'to risk',
      category: 'advanced',
      image:
          'https://www.notifytechnology.com/wp-content/uploads/2022/06/Notify_Social-June_6_V2_Web-banner-min-1-scaled.webp'),
  Word(
      key: 'избегать',
      value: 'to avoid',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc4fPqHT8o4FDGtYVUTsk7aVsGvt8SwX95Mw&s'),
  Word(
      key: 'вдохновлять',
      value: 'to inspire',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0Wx2bmGMzf6z2jB5-a0aUFRyrbcbEBdZugw&s'),
  Word(
      key: 'мотивировать',
      value: 'to motivate',
      category: 'advanced',
      image:
          'https://miro.medium.com/v2/resize:fit:820/1*OnViUDMyfw-kJq5QaxVv2g.jpeg'),
  Word(
      key: 'анализировать',
      value: 'to analyze',
      category: 'advanced',
      image:
          'https://media.licdn.com/dms/image/v2/D5612AQG4wbMQt7p7pQ/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1684282610430?e=2147483647&v=beta&t=6TJCNEcvsVPrKvlhSMh5Jk5VNUQd8omioD52MmeVhs4'),

  Word(
      key: 'сравнивать',
      value: 'to compare',
      category: 'advanced',
      image:
          'https://prostorybuilders.com/wp-content/uploads/2022/09/compare-g0361bbbda_1280.png'),
  Word(
      key: 'объяснять',
      value: 'to explain',
      category: 'advanced',
      image:
          'https://thumbs.dreamstime.com/b/teacher-explain-lesson-24534921.jpg'),
  Word(
      key: 'понимать',
      value: 'to comprehend',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3qnVtDsUDk_YD89QOrmP7IZjvq8LOX1NKeA&s'),
  Word(
      level: 3,
      key: 'представлять',
      value: 'to imagine',
      category: 'advanced',
      image:
          'https://www.walkerbooks.com.au/wp-content/uploads/book/9780763690526-928x1024.jpeg'),
  Word(
      level: 2,
      key: 'уважать',
      value: 'to respect',
      category: 'advanced',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAj71E9cs-g0uGQXpm5VqFieRC6RmWKg48_w&s'),
];
