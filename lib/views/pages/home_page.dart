import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/functions/show_snackbar.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/app_provider.dart';
import 'package:salfa_game/views/pages/game_steps/step_one_player.dart';
import 'package:salfa_game/views/widgets/main_button.dart';
import 'package:salfa_game/views/widgets/main_text.dart';
import 'package:salfa_game/views/widgets/main_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, app, child) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: app.players.isNotEmpty
                      ? ListView.builder(
                          itemCount: app.players.length,
                          itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: MainTextField(
                                    controller: TextEditingController(
                                        text: app.players[i]),
                                    onChanged: (v) {
                                      app.updatePlayer(
                                          app.players[i], v.trim());
                                    },
                                  ),
                                ),
                                12.wSize,
                                InkWell(
                                  onTap: () {
                                    app.removePlayer(app.players[i]);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.amber,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MainText(
                                'برجاء إضافة لاعبين',
                                textAlign: TextAlign.center,
                                color: Colors.grey,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        onPressed: () {
                          if (app.players.length < 3) {
                            showSnackbar(
                                'لا يمكن الدخول للعبة بأقل من ثلاثة لاعبين ',
                                error: true);
                            return;
                          }
                          if (app.players
                              .where((e) => e.trim() == '')
                              .isNotEmpty) {
                            showSnackbar('لا يمكن أن يكون الاسم فارغ!',
                                error: true);
                            return;
                          }
                          if (app.players.length >
                              app.players.map((e) => e.trim()).toSet().length) {
                            showSnackbar('هناك أسماء مكررة', error: true);
                            return;
                          }
                          AppRoutes.routeTo(context, const StepOnePlayer());
                        },
                        child: const Center(
                          child: MainText.buttonText(
                            'الدخول',
                          ),
                        ),
                      ),
                    ),
                    22.wSize,
                    SizedBox(
                      width: 60,
                      child: MainButton(
                        onPressed: () {
                          app.addNewPlayer();
                        },
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
