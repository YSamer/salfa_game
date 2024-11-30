import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/game_provider.dart';
import 'package:salfa_game/views/pages/game_steps/step_one_player.dart';
import 'package:salfa_game/views/pages/home_page.dart';
import 'package:salfa_game/views/widgets/main_button.dart';
import 'package:salfa_game/views/widgets/main_text.dart';

class StepSixPlayer extends StatelessWidget {
  final GameProvider gameProvider;
  const StepSixPlayer({super.key, required this.gameProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>.value(
      value: gameProvider,
      builder: (context, child) => Consumer<GameProvider>(
        builder: (context, game, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: List.generate(
                      game.players.length,
                      (i) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: MainText(
                              '${game.players[i].name}: ${game.players[i].grad}',
                              textAlign: TextAlign.center,
                              color: Colors.amber,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  32.hSize,
                  MainButton(
                    onPressed: () {
                      game.complate();
                      AppRoutes.routeRemoveAllTo(
                          context, StepOnePlayer(gameProvider: game));
                    },
                    child: const Center(
                      child: MainText.buttonText(
                        'اكمال لعب',
                      ),
                    ),
                  ),
                  12.hSize,
                  MainButton(
                    onPressed: () {
                      AppRoutes.routeRemoveAllTo(context, const HomePage());
                    },
                    expanded: false,
                    color: Colors.red,
                    child: const Center(
                      child: MainText.buttonText(
                        'إنهاء',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
