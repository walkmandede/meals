import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:meals/globals.dart';
import 'package:meals/model/categorizedMeal.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/services/mealServices.dart';
import 'package:meals/view/MealDetailView.dart';
import 'package:meals/view/homePageMealListView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteMealsView extends StatefulWidget {


  @override
  _FavoriteMealsViewState createState() => _FavoriteMealsViewState();
}

class _FavoriteMealsViewState extends State<FavoriteMealsView> {

  List<String> favMeals = [];
  List<Meal> favMealsList = [];
  bool isLoaded = false;


  @override
  void initState() {
    getData();
    super.initState();
  }
  
  Future<void> getData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    var _favMeals = sp.getStringList('favMeals');
    setState(() {
      favMeals.addAll(_favMeals!);
    });
    favMeals.forEach((element) async {
      var _thisMeal = await fetchThisMeal(element);
      setState(() {
        favMealsList.add(_thisMeal);
      });
    });
    setState(() {
      isLoaded = true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      appBar: AppBar(
        title: Text('Favorite Meals'),
        backgroundColor: Colors.brown,
      ),
      body: !isLoaded?const CircularProgressIndicator():HomePageMealListView(meals: favMealsList),
    );
  }
}
