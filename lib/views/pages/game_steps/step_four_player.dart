import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/game_provider.dart';
import 'package:salfa_game/views/pages/game_steps/step_five_player.dart';
import 'package:salfa_game/views/widgets/main_button.dart';
import 'package:salfa_game/views/widgets/main_text.dart';

class StepFourPlayer extends StatelessWidget {
  final GameProvider gameProvider;
  const StepFourPlayer({super.key, required this.gameProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>.value(
      value: gameProvider,
      builder: (context, child) => Consumer<GameProvider>(
        builder: (context, game, child) {
          if (game.step4Done) {
            WidgetsBinding.instance.addPostFrameCallback((callback) {
              AppRoutes.routeRemoveTo(
                  context, StepFivePlayer(gameProvider: game));
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
                              'اللي برا السالفة هو ${game.notSalfaPlayer}',
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
                          game.showNotSalfaPlayer();
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
