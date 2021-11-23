import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:meals/globals.dart';
import 'package:meals/model/categorizedMeal.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/services/mealServices.dart';
import 'package:meals/view/MealDetailView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageMealListView extends StatefulWidget {

  final List<Meal> meals;
  const HomePageMealListView({required this.meals});

  @override
  _HomePageMealListViewState createState() => _HomePageMealListViewState();
}

class _HomePageMealListViewState extends State<HomePageMealListView> {

  List<String> favMeals = [];


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
  }
  
  @override
  Widget build(BuildContext context) {
    return     SingleChildScrollView(
      child: Column(
          children: widget.meals.map((e) {
            return GestureDetector(
              onTap: () async{
                Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => MealDetailView(meal: e),));
              },
              child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.brown.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          child:  Image.network(
                            e.strMealThumb,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        Expanded(child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child:  Text(
                                e.strMeal,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14/MediaQuery.textScaleFactorOf(context)),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            // Container(
                            //   child: tags.contains('N/A')?Container():Wrap(
                            //     children: tags.map((e) => chipDesign(e, Colors.brown)).toList(),
                            //   ),
                            // )
                            Container(
                              padding: EdgeInsets.all(10),
                              child:  Text(
                                e.strArea+" : "+e.strCategory,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12/MediaQuery.textScaleFactorOf(context)),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child:  Text(
                                e.strTags,style: TextStyle(color: Colors.brown.shade100,fontWeight: FontWeight.w300,fontSize: 10/MediaQuery.textScaleFactorOf(context)),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        )),
                        IconButton(onPressed: () async{
                          SharedPreferences sp = await SharedPreferences.getInstance();
                          if(favMeals.contains(e.idMeal)){
                            setState(() {
                              favMeals.remove(e.idMeal);
                            });
                            await sp.setStringList('favMeals', favMeals);
                          }
                          else{
                            setState(() {
                              favMeals.add(e.idMeal);
                            });
                            await sp.setStringList('favMeals', favMeals);
                          }
                          }, icon: Icon(Icons.favorite_outlined,color: favMeals.contains(e.idMeal)?Colors.brown:Colors.brown.shade100,))
                      ],
                    ),
                  )
              ),
            );
          }).toList()
      ),
    );
  }
}
