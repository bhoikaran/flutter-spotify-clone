import 'package:spotify/models/music.dart';

class MusicOprations {
  
MusicOprations._(){}

static List<Music> getMusic(){
  return<Music>[
     Music(
      'Bhool Bhulaiyaa 3',
      'https://c.saavncdn.com/443/Bhool-Bhulaiyaa-3-Hindi-2024-20241108131003-500x500.jpg',
      'From the movie Bhool Bhulaiyaa 3',"https://aac.saavncdn.com/443/ecaf68741269f26720f881fa7dfd9121_160.mp4",
    ),
    Music(
      'Teri Baaton Mein Aisa Uljha Jiya',
      'https://c.saavncdn.com/214/Teri-Baaton-Mein-Aisa-Uljha-Jiya-Hindi-2024-20240205151011-500x500.jpg',
      'A soulful romantic song.',"https://aac.saavncdn.com/214/19ad75d7c206f140f72994382ba0b516_160.mp4",
    ),
    Music(
      'Sajani',
      'https://c.saavncdn.com/252/Laapataa-Ladies-Hindi-2024-20241104085935-500x500.jpg',
      'From the movie Laapataa Ladies',"https://aac.saavncdn.com/252/f53c1a90a2f35d67490badb846d8c849_160.mp4",
    ),
    Music(
      'GLORY',
      'https://c.saavncdn.com/173/GLORY-Hindi-2024-20240926151002-500x500.jpg',
      'An inspiring anthem.',"https://aac.saavncdn.com/173/e98d601d7cfc68d0035f4e8a2deae6f9_160.mp4",
    ),
  ];
}
}