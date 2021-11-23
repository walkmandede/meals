import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals/globals.dart';
import 'package:meals/model/categorizedMeal.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/services/mealServices.dart';
import 'package:meals/view/MealDetailView.dart';
import 'package:meals/view/favoriteView.dart';
import 'package:meals/view/homePageMealListView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategorizedMeal> meals = [];
  List<Meal> mealsToShow = [];
  List<Category> categories = [];
  bool isLoaded = false;
  String chosenCategory = "All";

  @override
  void initState() {
    getData();
    super.initState();
  }
  
  Future<void> getData() async{
    var _categories = await fetchMealCategories();
    setState(() {
      categories = _categories;
      chosenCategory = categories[0].strCategory;
    });
    await updateMealsToShow(categories[0].strCategory);
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> updateMealsToShow(String cc) async{
    setState(() {
      meals.clear();
      mealsToShow.clear();
    });
    var _meals = await fetchMealsWithCategory(cc);
    setState(() {
      meals = _meals;
    });
    meals.forEach((element) async{
      var id = element.idMeal;
      var thisMeal = await fetchThisMeal(id);
      setState(() {
        mealsToShow.add(thisMeal);
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return !isLoaded?const Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Pocket Chief'),
        actions: [
          TextButton.icon(onPressed: () {
            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => FavoriteMealsView(),));
          }, icon: Icon(Icons.favorite,color: Colors.brown.shade100,), label: Text('Favorite Meals',style: TextStyle(color: Colors.brown.shade100),))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Categories',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16/MediaQuery.textScaleFactorOf(context)),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: ScrollController(),
              child: Row(
                children: categories.map((e) {
                  return GestureDetector(
                    onTap: () async{
                      setState(() {
                        chosenCategory = e.strCategory;
                      });
                      await updateMealsToShow(e.strCategory);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: chosenCategory==e.strCategory?Colors.brown:Colors.brown.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              e.strCategoryThumb,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),                            Divider(),
                            Container(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                e.strCategory, style: TextStyle(fontWeight: FontWeight.bold,color: chosenCategory==e.strCategory?Colors.white:Colors.brown),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Divider(),
            Expanded(child: HomePageMealListView(meals: mealsToShow))
          ],
        )
      ),
    );
  }
}
