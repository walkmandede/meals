import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meals/model/categorizedMeal.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';

Future<Meal> fetchThisMeal(String id) async{
  var client = http.Client();
  var response = await client.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id"));
  if(response.statusCode==200)
  {
    final result = jsonDecode(response.body);
    Iterable list = result["meals"];
    return Meal.fromJson(list.first);
  }
  else{
    throw Exception('Failed To Load Movies');
  }
}

Future<List<Meal>> fetchAllMeal(String searchString) async{
  var client = http.Client();
  var response = await client.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$searchString"));
  if(response.statusCode==200)
  {
    final result = jsonDecode(response.body);
    Iterable list = result["meals"];
    return list.map((e) => Meal.fromJson(e)).toList();
  }
  else{
    throw Exception('Failed To Load Movies');
  }

}

Future<List<Meal>> fetchMealsStartedWith(String startLetter) async{
  var client = http.Client();
  var response = await client.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?f=$startLetter"));
  if(response.statusCode==200)
  {
    final result = jsonDecode(response.body);
    Iterable list = result["meals"];
    return list.map((e) => Meal.fromJson(e)).toList();
  }
  else{
    throw Exception('Failed To Load Movies');
  }
}

Future<List<CategorizedMeal>> fetchMealsWithCategory(String category) async{
  var client = http.Client();
  var response = await client.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=$category"));
  if(response.statusCode==200)
  {
    final result = jsonDecode(response.body);
    Iterable list = result["meals"];
    return list.map((e) => CategorizedMeal.fromJson(e)).toList();
  }
  else{
    throw Exception('Failed To Load Movies');
  }
}

Future<List<Category>> fetchMealCategories() async{
  var client = http.Client();
  var response = await client.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
  if(response.statusCode==200)
  {
    final result = jsonDecode(response.body);
    Iterable list = result["categories"];
    return list.map((e) => Category.fromJson(e)).toList();
  }
  else{
    throw Exception('Failed To Load Movies');
  }
}