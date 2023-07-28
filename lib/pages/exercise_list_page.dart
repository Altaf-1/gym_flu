import 'package:flu_gym/model/exercise_model.dart';
import 'package:flu_gym/widgets/exercise_card_widget.dart';
import 'package:flutter/material.dart';

class ExerciseListPage extends StatelessWidget {
  static String routeName = "/exerciselistpage";

  const ExerciseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String title = arg["title"];
    final List<ExerciseModel> listOfExercise = arg["listOfExercise"];

    // final ExerciseModel exerciseModel = exerciseList[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ExerciseCardWidget(exerciseModel: listOfExercise[index]);
            },
            itemCount: listOfExercise.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
          )),
    );
  }
}
