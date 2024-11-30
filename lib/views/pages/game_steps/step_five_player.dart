import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/game_provider.dart';
import 'package:salfa_game/views/pages/game_steps/step_six_player.dart';
import 'package:salfa_game/views/widgets/main_button.dart';
import 'package:salfa_game/views/widgets/main_text.dart';

class StepFivePlayer extends StatelessWidget {
  final GameProvider gameProvider;
  const StepFivePlayer({super.key, required this.gameProvider});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MainText(
                          '${game.notSalfaPlayer} اختر من تظن أنه برا السالفة ',
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
                      game.animalList.length,
                      (i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 4),
                        child: MainButton(
                          onPressed: () {
                            game.selectAnimal(game.animalList[i]);
                          },
                          verticalPadding: 4,
                          color: (game.animalList[i] == game.salfa &&
                                  game.selectedAnimal != null)
                              ? Colors.green
                              : (game.selectedAnimal == game.animalList[i])
                                  ? Colors.red
                                  : const Color(0xFF27BDBE),
                          child: Center(
                            child: MainText.buttonText(
                              game.animalList[i],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  32.hSize,
                  MainButton(
                    onPressed: () {
                      AppRoutes.routeRemoveTo(
                          context, StepSixPlayer(gameProvider: game));
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
