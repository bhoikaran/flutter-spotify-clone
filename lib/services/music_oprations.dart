import 'package:spotify/models/music.dart';

class MusicOprations {
  
MusicOprations._(){}

static List<Music> getMusic(){
  return<Music>[
     Music(
      'Bhool Bhulaiyaa 3',
      'https://c.saavncdn.com/443/Bhool-Bhulaiyaa-3-Hindi-2024-20241108131003-500x500.jpg',
      'An exciting soundtrack from the movie Bhool Bhulaiyaa 3, filled with mystery and entertainment.',
    ),
    Music(
      'Teri Baaton Mein Aisa Uljha Jiya',
      'https://c.saavncdn.com/214/Teri-Baaton-Mein-Aisa-Uljha-Jiya-Hindi-2024-20240205151011-500x500.jpg',
      'A soulful romantic song capturing the essence of love and emotions.',
    ),
    Music(
      'Laapataa Ladies',
      'https://c.saavncdn.com/252/Laapataa-Ladies-Hindi-2024-20241104085935-500x500.jpg',
      'A vibrant and upbeat track from the movie Laapataa Ladies, celebrating joy and laughter.',
    ),
    Music(
      'GLORY',
      'https://c.saavncdn.com/173/GLORY-Hindi-2024-20240926151002-500x500.jpg',
      'An inspiring anthem filled with powerful lyrics and a majestic tune.',
    ),
  ];
}
}