import 'package:flu_gym/data/exercise.dart';
import 'package:flu_gym/data/workout_category_list.dart';
import 'package:flu_gym/widgets/exercise_card_widget.dart';
import 'package:flu_gym/widgets/workout_category_widget.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            label: 'category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(Icons.favorite),
          )
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Welcome User",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo/3.png"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              _index == 0 ? "Workout Category" : "Favourite Exercise",
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _index == 0
                ? Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => WorkoutCategoryWidget(
                          workoutCategoryModel: workoutCategoryList[index]),
                      itemCount: workoutCategoryList.length,
                    ),
                  )
                : Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) => ExerciseCardWidget(
                          exerciseModel: exerciseList
                              .where((element) => element.isFavourite)
                              .toList()[index]),
                      itemCount: exerciseList
                          .where((element) => element.isFavourite)
                          .toList()
                          .length),
                ),
          ],
        ),
      ),
    );
  }
}
