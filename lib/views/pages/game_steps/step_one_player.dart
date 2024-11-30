import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/game_provider.dart';
import 'package:salfa_game/views/pages/game_steps/step_two_player.dart';
import 'package:salfa_game/views/widgets/main_button.dart';
import 'package:salfa_game/views/widgets/main_text.dart';

class StepOnePlayer extends StatelessWidget {
  final GameProvider? gameProvider;
  const StepOnePlayer({super.key, this.gameProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>.value(
      value: gameProvider ?? GameProvider(),
      builder: (context, child) => Consumer<GameProvider>(
        builder: (context, game, child) {
          if (game.step1Done) {
            WidgetsBinding.instance.addPostFrameCallback((callback) {
              AppRoutes.routeTo(context, StepTwoPlayer(gameProvider: game));
            });
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MainText(
                        game.show
                            ? game.allPlayers[game.step1Player] ==
                                    game.notSalfaPlayer
                                ? 'أنت برا السالفة'
                                : 'أنت داخل السالفة \n السالفة هي ${game.salfa}'
                            : game.allPlayers[game.step1Player],
                        textAlign: TextAlign.center,
                        color: Colors.amber,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  22.hSize,
                  MainButton(
                    onPressed: () {
                      game.nextStep1Player();
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
          );
        },
      ),
    );
  }
}
