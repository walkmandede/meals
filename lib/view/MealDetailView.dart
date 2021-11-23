import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals/globals.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/services/mealServices.dart';
import 'package:meals/view/homePageMealListView.dart';
import 'package:translator/translator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MealDetailView extends StatefulWidget {

  final Meal meal;
  const MealDetailView({required this.meal});

  @override
  _MealDetailViewState createState() => _MealDetailViewState();
}

class _MealDetailViewState extends State<MealDetailView> {

  late Meal thisMeal;
  String burmeseTranslation = "";
  bool isLoaded = false;
  Map<String,String> ingredients = {};
  Map<String,String> translatedIngredients = {};
  int showPageNumber = 0;
  bool translated = false;
  bool translated1 = false;


  @override
  void initState() {
    getData();
    super.initState();
  }
  
  Future<void> getData() async{
    setState(() {
      thisMeal = widget.meal;
    });
    addIngredientsAndMeasures();
    getTranslatedData();
    setState(() {
      isLoaded = true;
    });
  }

  void addIngredientsAndMeasures(){
    setState(() {
      if(thisMeal.strIngredient1!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient1, thisMeal.strMeasure1)]);
      if(thisMeal.strIngredient2!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient2, thisMeal.strMeasure2)]);
      if(thisMeal.strIngredient3!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient3, thisMeal.strMeasure3)]);
      if(thisMeal.strIngredient4!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient4, thisMeal.strMeasure4)]);
      if(thisMeal.strIngredient5!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient5, thisMeal.strMeasure5)]);
      if(thisMeal.strIngredient6!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient6, thisMeal.strMeasure6)]);
      if(thisMeal.strIngredient7!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient7, thisMeal.strMeasure7)]);
      if(thisMeal.strIngredient8!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient8, thisMeal.strMeasure8)]);
      if(thisMeal.strIngredient9!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient9, thisMeal.strMeasure9)]);
      if(thisMeal.strIngredient10!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient10, thisMeal.strMeasure10)]);
      if(thisMeal.strIngredient11!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient11, thisMeal.strMeasure11)]);
      if(thisMeal.strIngredient12!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient12, thisMeal.strMeasure12)]);
      if(thisMeal.strIngredient13!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient13, thisMeal.strMeasure13)]);
      if(thisMeal.strIngredient14!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient14, thisMeal.strMeasure14)]);
      if(thisMeal.strIngredient15!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient15, thisMeal.strMeasure15)]);
      if(thisMeal.strIngredient16!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient16, thisMeal.strMeasure16)]);
      if(thisMeal.strIngredient17!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient17, thisMeal.strMeasure17)]);
      if(thisMeal.strIngredient18!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient18, thisMeal.strMeasure18)]);
      if(thisMeal.strIngredient19!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient19, thisMeal.strMeasure19)]);
      if(thisMeal.strIngredient20!="") ingredients.addEntries([MapEntry(thisMeal.strIngredient20, thisMeal.strMeasure20)]);
    });
    setState(() {

    });
  }

  Future<void> getTranslatedData()async{
    var translatedInstruction = await translateToMyanmar(thisMeal.strInstructions);
    setState(() {
      burmeseTranslation = translatedInstruction;
    });

    ingredients.keys.forEach((element) async{
      var ek =  element;
      var mk = await translateToMyanmar(element);
      var ev = ingredients[element].toString();
      var mv = await translateToMyanmar(ingredients[element].toString());
      setState(() {
        translatedIngredients.addEntries([
          MapEntry(ek, mk)
        ]);
      });
      setState(() {
        translatedIngredients.addEntries([
          MapEntry(ev, mv)
        ]);
      });
    });

  }
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return !isLoaded?const Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown.shade300,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.arrow_drop_up),label: 'Ingredients',),
        BottomNavigationBarItem(icon: Icon(Icons.arrow_drop_up),label: 'Recipe'),
      ],
      selectedItemColor: Colors.white,
      currentIndex: showPageNumber,
      onTap: (value) {
        setState(() {
          showPageNumber = value;
        });
      },
      ),
        body: showPageNumber==0?pageOne():pageTwo()
    );
  }

  Widget pageOne(){
    return Column(
      children: [
        Container(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.45,
                width: double.infinity,
                decoration: const BoxDecoration(
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(35)),
                    child: Image.network(thisMeal.strMealThumb,fit: BoxFit.fill,)),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.45),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(thisMeal.strMeal,
                      style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16/MediaQuery.textScaleFactorOf(context)),),
                    Divider(),
                    Text(thisMeal.strArea+" : "+thisMeal.strCategory,
                      style: TextStyle(
                          color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 12/MediaQuery.textScaleFactorOf(context)),),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(4),
            child: Text(!translated1?'ဘာသာစကားပြောင်းရန် ဘေးသို့ဆွဲပါ':'Swipe To Translate',style: TextStyle(color: Colors.brown.shade400),)),
        Expanded(
          child: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              if (details.primaryVelocity! > 0) {
                setState(() {
                  translated1 =!translated1;
                });
              } else if (details.primaryVelocity! < 0) {
                setState(() {
                  translated1 =!translated1;
                });            }
            },
            child: SingleChildScrollView(
              child: Column(
                  children: ingredients.keys.map((e) {
                    int i = 0;
                    return Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,top: 6,bottom: 6),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(0.4),
                        borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            "https://www.themealdb.com/images/ingredients/$e.png",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(translated1?translatedIngredients[e].toString():e,
                                style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14/MediaQuery.textScaleFactorOf(context)),),
                              Divider(),
                              Text(translated1?translatedIngredients[ingredients[e].toString()].toString():ingredients[e].toString(),
                                style: TextStyle(
                                    color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 12/MediaQuery.textScaleFactorOf(context)),),
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  ).toList()
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget pageTwo(){
    return Column(
      children: [
        Container(
          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: thisMeal.strYoutube!="N/A"&&thisMeal.strYoutube!=""?thisMeal.strYoutube.split('v=')[1]:"aa",
              flags: YoutubePlayerFlags(autoPlay: true,mute: false,enableCaption: true),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.all(4),

            child: Text(!translated?'ဘာသာစကားပြောင်းရန် ဘေးသို့ဆွဲပါ':'Swipe To Translate',style: TextStyle(color: Colors.brown.shade400),)),
        Expanded(
            child: GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity! > 0) {
                  setState(() {
                    translated =!translated;
                  });
                } else if (details.primaryVelocity! < 0) {
                  setState(() {
                    translated =!translated;
                  });            }
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.brown.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: SingleChildScrollView(
                  child: Text(translated?burmeseTranslation:thisMeal.strInstructions,
                  style: TextStyle(color: Colors.brown,fontSize: 15/MediaQuery.textScaleFactorOf(context),
                    fontWeight: FontWeight.w400
                  ),
                  )
                ),
              ),
            )
        )
      ],
    );
  }

}
