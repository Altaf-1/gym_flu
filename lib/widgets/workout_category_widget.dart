import 'package:flu_gym/data/exercise.dart';
import 'package:flu_gym/model/workout_category_model.dart';
import 'package:flu_gym/pages/exercise_list_page.dart';
import 'package:flutter/material.dart';

class WorkoutCategoryWidget extends StatelessWidget {
  final WorkoutCategoryModel workoutCategoryModel;
  const WorkoutCategoryWidget({super.key, required this.workoutCategoryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExerciseListPage.routeName,
          arguments: {
            "title": workoutCategoryModel.categoryName,
            "listOfExercise": exerciseList
                .where((element) =>
                    element.category == workoutCategoryModel.categoryName)
                .toList(),
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            child: Stack(children: [
              Image.network(
                workoutCategoryModel.imageSource,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: 400,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black,
                      Colors.transparent,
                    ])),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          workoutCategoryModel.categoryName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
