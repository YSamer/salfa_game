import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/game_provider.dart';
import 'package:salfa_game/views/pages/game_steps/step_three_player.dart';
import 'package:salfa_game/views/widgets/main_button.dart';
import 'package:salfa_game/views/widgets/main_text.dart';

class StepTwoPlayer extends StatelessWidget {
  final GameProvider gameProvider;
  const StepTwoPlayer({super.key, required this.gameProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>.value(
      value: gameProvider,
      builder: (context, child) => Consumer<GameProvider>(
        builder: (context, game, child) {
          if (game.step2Done) {
            WidgetsBinding.instance.addPostFrameCallback((callback) {
              AppRoutes.routeRemoveTo(
                  context, StepThreePlayer(gameProvider: game));
            });
          }
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: MainText(
                              '${game.players[game.step2Player1].name} اسأل ${game.players[game.step2Player2].name}',
                              textAlign: TextAlign.center,
                              color: Colors.amber,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      22.hSize,
                      MainButton(
                        onPressed: () {
                          game.nextStep2Player();
                        },
                        child: const Center(
                          child: MainText.buttonText(
                            'التالي',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
