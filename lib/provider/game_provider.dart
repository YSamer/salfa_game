import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/data/data.dart';
import 'package:salfa_game/data/local/local_data.dart';
import 'package:salfa_game/injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:provider/provider.dart';

class GameProvider extends ChangeNotifier {
  GameProvider() {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      players = allPlayers.map((e) => Player(name: e, grad: 0)).toList();
      startSelect();
    });
  }

  static GameProvider get get =>
      Provider.of<GameProvider>(AppNavigator.context);
  static GameProvider get getFalse =>
      Provider.of<GameProvider>(AppNavigator.context, listen: false);
  SharedPreferences prefs = getIt<SharedPreferences>();

  List<String> get allPlayers => LocalData.allPlayers;
  List<Player> players = [];

  String? notSalfaPlayer;
  String? salfa;
  startSelect() {
    notSalfaPlayer =
        notSalfaPlayer ?? allPlayers[Random().nextInt(players.length)];
    salfa = salfa ?? animals[Random().nextInt(animals.length)];
  }

  // 1 معرفة اللاعب نفسه والسالفة
  bool show = false;
  int step1Player = 0;
  bool step1Done = false;

  void nextStep1Player() {
    if (show) {
      step1Player++;
      if (step1Player >= players.length) {
        step1Player--;
        step1Done = true;
        step2Player2 = otherPlayerNum(step2Player1);
      }
      show = false;
    } else {
      show = true;
    }
    notifyListeners();
  }

  //2 الأسئلة
  int step2Player1 = 0;
  late int step2Player2;
  bool step2Done = false;
  void nextStep2Player() {
    step2Player1++;
    if (step2Player1 >= players.length) {
      step2Player1--;
      step2Done = true;
    } else {
      step2Player2 = otherPlayerNum(step2Player1);
    }
    notifyListeners();
  }

  //3 التصويب
  int step3Player = 0;
  bool step3Done = false;
  void voteStep3Player(String suggessPlayer) {
    if (suggessPlayer == notSalfaPlayer) {
      players[step3Player].grad += 100;
    }
    step3Player++;
    if (step3Player >= players.length) {
      step3Player--;
      step3Done = true;
    }
    notifyListeners();
  }

  // 4 عرض اسم اللاعب اللي برا السالفة
  bool step4Done = false;
  void showNotSalfaPlayer() {
    step4Done = true;
    animalList = getRandomAnimalsWithSpecificOne(salfa ?? '');
    notifyListeners();
  }

  // 5 اختيار الحيوان المتوقع
  bool step5Done = false;
  List<String> animalList = [];
  String? selectedAnimal;
  void selectAnimal(String suggestAnimal) {
    if (selectedAnimal == null) {
      selectedAnimal = suggestAnimal;
      if (salfa == suggestAnimal) {
        players.firstWhere((e) => e.name == notSalfaPlayer).grad += 100;
      }
      notifyListeners();
    }
  }

  // 6 اظهار النتائج
  complate() {
    step1Done = false;
    step2Done = false;
    step3Done = false;
    step4Done = false;
    step5Done = false;
    step1Player = 0;
    step2Player1 = 0;
    step2Player2 = 0;
    step3Player = 0;
    selectedAnimal = null;
    animalList = [];
    salfa = null;
    notSalfaPlayer = null;
    startSelect();
    notifyListeners();
  }

  // Get Other random player num
  int otherPlayerNum(int current) {
    late int s;
    do {
      s = Random().nextInt(players.length);
    } while (s == current);
    return s;
  }

  List<String> otherPlayers(String p) {
    List<String> other = allPlayers.where((p1) => p1 != p).toList();
    return other;
  }

  List<String> getRandomAnimalsWithSpecificOne(String requiredAnimal) {
    Set<String> selectedAnimals = {requiredAnimal};

    List<String> animalsButOne =
        animals.where((e) => e != requiredAnimal).toList();
    while (selectedAnimals.length < 10) {
      final randomAnimal =
          animalsButOne[Random().nextInt(animalsButOne.length)];
      selectedAnimals.add(randomAnimal);
    }

    List<String> animalList = selectedAnimals.toList();
    animalList.shuffle();
    return animalList;
  }
}

class Player {
  final String name;
  int grad = 0;

  Player({
    required this.name,
    required this.grad,
  });
}
