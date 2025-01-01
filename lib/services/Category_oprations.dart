import 'package:flutter/material.dart';
import 'package:spotify/models/Category.dart';

class CategoryOprations {
  static List<Category> getCategories() {
    return <Category>[
      Category("Top Songs",
          "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/wrapped/yts/en"),
      Category("Top Songs Global",
          "https://charts-images.scdn.co/assets/locale_en/regional/weekly/region_global_default.jpg"),
      Category("Top 50 Songs",
          "https://charts-images.scdn.co/assets/locale_en/regional/daily/region_global_default.jpg"),
      Category("Viral 50 Songs",
          "https://charts-images.scdn.co/assets/locale_en/viral/daily/region_global_default.jpg"),
      Category("Arijit Singh Radio",
          "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/4YRxDV8wJFPHPTeXepOstw/en"),
      Category("Diljit Dosanjh Radio",
          "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/2FKWNmZWDBZR4dE5KX4plR/en"),
    //   Category("Shreya Ghoshal Radio",
    //       "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/0oOet2f43PA68X5RxKobEy/en"),
    //   Category("KK Radio",
    //       "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/4fEkbug6kZzzJ8eYX6Kbbp/en"),
    //   Category("Yo Yo Honey Singh Radio",
    //       "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/7uIbLdzzSEqnX0Pkrb56cR/en"),
    //   Category("AR Rahman Radio",
    //       "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/1mYsTxnqsietFxj1OgoGbG/en"),
    ];
  }
}
