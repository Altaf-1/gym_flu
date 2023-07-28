import 'package:flu_gym/data/exercise.dart';
import 'package:flu_gym/model/exercise_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class ExerciseDetailPage extends StatefulWidget {
  static String routeName = "/exerciseDetailPage";
  const ExerciseDetailPage({super.key});

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  @override
  Widget build(BuildContext context) {
    final exerciseModel =
        ModalRoute.of(context)!.settings.arguments as ExerciseModel;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExerciseModel model = exerciseList
              .firstWhere((element) => element.name == exerciseModel.name);

          setState(() {
            model.isFavourite = !model.isFavourite;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          exerciseModel.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.network(
              exerciseModel.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              exerciseModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const Divider(
              color: Colors.black,
            ),
            ...exerciseModel.steps
                .mapIndexed((index, e) => ListTile(
                      title: Text(e),
                      leading:
                          CircleAvatar(child: Text((index + 1).toString())),
                    ))
                .toList(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Targated Muscle",
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: exerciseModel.targetMuscles
                  .map(
                    (e) => Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Equipment",
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: exerciseModel.equipment
                  .map(
                    (e) => Card(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.repeat,
                        color: Color.fromARGB(255, 189, 54, 5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(exerciseModel.sets),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.fitness_center,
                        color: Color.fromARGB(255, 189, 54, 5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(exerciseModel.reps),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.timer,
                        color: Color.fromARGB(255, 189, 54, 5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(exerciseModel.duration),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
