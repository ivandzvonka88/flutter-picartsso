import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:picartsso/domain/models/style_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../exceptions/app_exception.dart';
import '../arts_datasource.dart';

final _defaultArts = StateProvider<List<StyleImage>>(
  (_) => <StyleImage>[],
);

final _customArts = StateProvider<List<StyleImage>>(
  (_) => <StyleImage>[],
);

final _sharedPreferences = FutureProvider<SharedPreferences>(
  (_) async => await SharedPreferences.getInstance(),
);

final artsDataSource = Provider<ArtsDataSource>(
  (ref) => ArtsDataSourceImpl(ref),
);

class ArtsDataSourceImpl implements ArtsDataSource {
  final Ref _ref;

  ArtsDataSourceImpl(
    this._ref,
  );

  @override
  Future<Result<void, AppException>> addCustomArt(
      StyleImage newCustomArt) async {
    final oldCustomArtsList = _ref.read(_customArts);
    final newCustomArtsList = [...oldCustomArtsList, newCustomArt];
    _ref.read(_customArts.notifier).state = newCustomArtsList;

    final sharedPref = await _ref.read(_sharedPreferences.future);
    try {
      await sharedPref.setStringList(
          'customArts',
          newCustomArtsList
              .map((customArt) => json.encode(customArt.toJson()))
              .toList());
      return const Success(null);
    } on Exception catch (e) {
      return Error(
        AppException.general(
          "SharedPreferences not loaded: ${e.toString()}",
        ),
      );
    }
  }

  @override
  List<StyleImage> get customArts => [..._ref.read(_customArts)];

  @override
  Result<List<StyleImage>, AppException> get defaultArts {
    final listDefaultArts = _ref.read(_defaultArts);
    return (listDefaultArts.isEmpty)
        ? const Error(AppException.general("Default Arts list wasn't loaded."))
        : Success([...listDefaultArts]);
  }

  @override
  Result<StyleImage, AppException> findArtByName(String artName) {
    return defaultArts.when(
      (arts) {
        try {
          var result = arts.firstWhere(
            (art) => art.artName.contains(artName),
            orElse: () => customArts.firstWhere(
              (customArt) => customArt.artName.contains(artName),
            ),
          );
          return Success(result);
        } on StateError {
          return const Error(AppException.general("Art not found."));
        }
      },
      (error) => Error(error),
    );
  }

  @override
  Future<Result<void, AppException>> loadCustomArts() async {
    final sharedPref = await _ref.read(_sharedPreferences.future);
    try {
      var customArtsJson = sharedPref.getStringList('customArts');

      if (customArtsJson != null && customArtsJson.isNotEmpty) {
        var customArtsStyleImages = customArtsJson
            .map((customArtJson) =>
                StyleImage.fromJson(json.decode(customArtJson)))
            .toList();
        _ref.read(_customArts.notifier).state = customArtsStyleImages;
      }

      return const Success(null);
    } on Exception catch (e) {
      return Error(
        AppException.general(
          "SharedPreferences not loaded: ${e.toString()}",
        ),
      );
    }
  }

  @override
  Future<Result<void, AppException>> loadDefaultImages() async {
    late String manifestContent;
    try {
      manifestContent = await rootBundle.loadString("AssetManifest.json");
    } on Exception {
      return const Error(
          AppException.general("File AssetManifest.json not found."));
    }

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets/style_imgs/')) // 0 - 17
        .where((String key) => key.contains('.jpg')) // 0 - 3
        .toList();

    imagePaths.sort();

    final defaultArts = <StyleImage>[];

    for (var artPath in imagePaths) {
      print("IMAGE PATH: $artPath");
      //var pathDecoded = Uri.decodeComponent(artPath);
      var cleanedPath = artPath.replaceAll('assets/style_imgs/', '');
      cleanedPath = cleanedPath.replaceAll('.jpg', '');
      cleanedPath = cleanedPath.replaceAll('_', ' ');
      var separatedNames = cleanedPath.split('--');
      var styleImageByteData = await rootBundle.load(artPath);
      var image = styleImageByteData.buffer.asUint8List();
      var newStyleImage = StyleImage(
        artName: separatedNames[0],
        authorName: separatedNames[1],
        image: image,
      );
      defaultArts.add(newStyleImage);
    }

    _ref.read(_defaultArts.notifier).state = defaultArts;

    return const Success(null);
  }
}

  // final _defaultArts = [
  //   const StyleImage('Ar, Ferro e Água', 'Robert Delaunay',
  //       _loadImagePath('assets/style_imgs/style0.jpg')),
  //   const StyleImage('Bicentennial Print', 'Roy Lichtenstein',
  //       'assets/style_imgs/style1.jpg'),
  //   const StyleImage(
  //       'Mancha Negra', 'Wassily Kandinsky', 'assets/style_imgs/style2.jpg'),
  //   const StyleImage(
  //       'Brushstrokes', 'Sol LeWitt', 'assets/style_imgs/style3.jpg'),
  //   const StyleImage(
  //       'June Tree', 'Natasha Wescoat', 'assets/style_imgs/style4.jpg'),
  //   const StyleImage(
  //       'Composição VII', 'Wassily Kandinsky', 'assets/style_imgs/style5.jpg'),
  //   const StyleImage('Dawn', 'Kyū Ei', 'assets/style_imgs/style6.jpg'),
  //   const StyleImage('Tons da Noite', 'Oscar Florianus Bluemner',
  //       'assets/style_imgs/style7.jpg'),
  //   const StyleImage(
  //       'Felsenhuhn', 'Wiener Werkstätte', 'assets/style_imgs/style9.jpg'),
  //   const StyleImage(
  //       'Bruxas da Floresta', 'Paul Klee', 'assets/style_imgs/style10.jpg'),
  //   const StyleImage('Jalousie (Jealousy)', 'Eugène Grasset',
  //       'assets/style_imgs/style11.jpg'),
  //   const StyleImage('La ville de Paris', 'Robert Delaunay',
  //       'assets/style_imgs/style12.jpg'),
  //   const StyleImage(
  //       'La Muse', 'Pablo Picasso', 'assets/style_imgs/style13.jpg'),
  //   const StyleImage('Landscape of Daydream 9553', 'Ik Mo Kim',
  //       'assets/style_imgs/style14.jpg'),
  //   const StyleImage(
  //       'Perfume', 'Luigi Russolo', 'assets/style_imgs/style16.jpg'),
  //   const StyleImage('A Noite Estrelada', 'Vincent van Gogh',
  //       'assets/style_imgs/style19.jpg'),
  //   const StyleImage('The Idea-Motion-Fight – Dedicated to Karl Liebknecht',
  //       'Johannes Molzahn', 'assets/style_imgs/style20.jpg'),
  //   const StyleImage(
  //       'The Mellow Pad', 'Stuart Davis', 'assets/style_imgs/style21.jpg'),
  //   const StyleImage(
  //       "L'Escalier", 'Fernand Léger', 'assets/style_imgs/style22.jpg'),
  //   const StyleImage(
  //       'Udnie', 'Francis Picabia', 'assets/style_imgs/style23.jpg'),
  //   const StyleImage('A Grande Onda de Kanagawa', 'Katsushika Hokusai',
  //       'assets/style_imgs/style24.jpg'),
  //   const StyleImage('Wild Garden', 'Nikos Hadjikyriakos-Ghikas',
  //       'assets/style_imgs/style25.jpg'),
  // ];