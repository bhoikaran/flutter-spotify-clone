import 'package:spotify/models/music.dart';

class MusicOprations {
  
MusicOprations._(){}

static List<Music> getMusic(){
  return<Music>[
     Music(
      'Bhool Bhulaiyaa 3',
      'https://c.saavncdn.com/443/Bhool-Bhulaiyaa-3-Hindi-2024-20241108131003-500x500.jpg',
      'From the movie Bhool Bhulaiyaa 3',
    ),
    Music(
      'Teri Baaton Mein Aisa Uljha Jiya',
      'https://c.saavncdn.com/214/Teri-Baaton-Mein-Aisa-Uljha-Jiya-Hindi-2024-20240205151011-500x500.jpg',
      'A soulful romantic song.',
    ),
    Music(
      'Laapataa Ladies',
      'https://c.saavncdn.com/252/Laapataa-Ladies-Hindi-2024-20241104085935-500x500.jpg',
      'From the movie Laapataa Ladies',
    ),
    Music(
      'GLORY',
      'https://c.saavncdn.com/173/GLORY-Hindi-2024-20240926151002-500x500.jpg',
      'An inspiring anthem.',
    ),
  ];
}
}