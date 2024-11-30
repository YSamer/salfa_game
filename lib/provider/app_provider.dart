import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/data/local/local_data.dart';
import 'package:salfa_game/injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      getLocalPlayers();
    });
  }
  static AppProvider get get => Provider.of<AppProvider>(AppNavigator.context);
  static AppProvider get getFalse =>
      Provider.of<AppProvider>(AppNavigator.context, listen: false);
  SharedPreferences prefs = getIt<SharedPreferences>();

  List<String> players = [];

  getLocalPlayers() {
    players = prefs.getStringList(LocalKeys.players) ?? [];
    notifyListeners();
  }

  void addPlayer(String player) {
    players.add(player);
    prefs.setStringList(LocalKeys.players, players);
    notifyListeners();
  }

  void addNewPlayer() {
    // Add an empty string to the list to allow user to add a new player.
    if (!players.contains('')) {
      players.add('');
      prefs.setStringList(LocalKeys.players, players);
    }
    notifyListeners();
  }

  void removePlayer(String player) {
    players.remove(player);
    prefs.setStringList(LocalKeys.players, players);
    notifyListeners();
  }

  void updatePlayer(String player, String newPlayer) {
    int index = players.indexOf(player);
    if (index != -1) {
      players[index] = newPlayer;
      prefs.setStringList(LocalKeys.players, players);
      // notifyListeners();
    }
  }
}
