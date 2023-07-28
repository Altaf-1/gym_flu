import 'package:flu_gym/model/exercise_model.dart';
import 'package:flu_gym/pages/exercise_detail_page.dart';
import 'package:flutter/material.dart';

class ExerciseCardWidget extends StatelessWidget {
  final ExerciseModel exerciseModel;
  const ExerciseCardWidget({super.key, required this.exerciseModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExerciseDetailPage.routeName,
          arguments: exerciseModel,
        );
      },
      child: Container(
        height: 280,
        color: const Color.fromARGB(255, 138, 136, 136),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  exerciseModel.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    exerciseModel.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: List.generate(
                        5,
                        (index) => Icon(
                              index + 1 <= exerciseModel.difficulty
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              size: 20,
                              color: Colors.orange,
                            )),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Equepment: ${exerciseModel.equipment.join(",")}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 246, 242, 242)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
