import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = '/meal-detail';
  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String text){
    return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: Theme.of(context).textTheme.title,
            ),
          );
  }

  Widget buildContainer(Widget child){
    return  Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey
              )
            ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          height: 160,
          width: 250,
          child: child,
    );
  }

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 230,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
              )
            ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                    ),
                  child: Text(selectedMeal.ingredients[index])
                  ),
                ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey
              )
            ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          height: 400,
          width: 300,
          child: ListView.builder(
              itemBuilder: (context,index) => Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${(index +1)}'),
                    ),
                  title: Text(selectedMeal.steps[index]),
                ), Divider(),
              ],
              ),
              itemCount: selectedMeal.steps.length,
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(mealId)? Icons.star : Icons.star_border),
        onPressed: () => toggleFavourite(mealId),
        ),
    );
  }
}