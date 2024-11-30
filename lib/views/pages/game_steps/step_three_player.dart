import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/game_provider.dart';
import 'package:salfa_game/views/pages/game_steps/step_four_player.dart';
import 'package:salfa_game/views/widgets/main_button.dart';
import 'package:salfa_game/views/widgets/main_text.dart';

class StepThreePlayer extends StatelessWidget {
  final GameProvider gameProvider;
  const StepThreePlayer({super.key, required this.gameProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>.value(
      value: gameProvider,
      builder: (context, child) => Consumer<GameProvider>(
        builder: (context, game, child) {
          if (game.step3Done) {
            WidgetsBinding.instance.addPostFrameCallback((callback) {
              AppRoutes.routeRemoveTo(
                  context, StepFourPlayer(gameProvider: game));
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
                      Expanded(
                        child: MainText(
                          '${game.players[game.step3Player].name} اختر من تظن أنه برا السالفة ',
                          textAlign: TextAlign.center,
                          color: Colors.amber,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  22.hSize,
                  Column(
                    children: List.generate(
                      game
                          .otherPlayers(game.players[game.step3Player].name)
                          .length,
                      (i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 4),
                        child: MainButton(
                          onPressed: () {
                            game.voteStep3Player(game.otherPlayers(
                                game.players[game.step3Player].name)[i]);
                          },
                          child: Center(
                            child: MainText.buttonText(
                              game.otherPlayers(
                                  game.players[game.step3Player].name)[i],
                            ),
                          ),
                        ),
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
