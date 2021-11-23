
class Meal{
  String idMeal;
  String strMeal;
  String strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String strIngredient6;
  String strIngredient7;
  String strIngredient8;
  String strIngredient9;
  String strIngredient10;
  String strIngredient11;
  String strIngredient12;
  String strIngredient13;
  String strIngredient14;
  String strIngredient15;
  String strIngredient16;
  String strIngredient17;
  String strIngredient18;
  String strIngredient19;
  String strIngredient20;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  String strMeasure4;
  String strMeasure5;
  String strMeasure6;
  String strMeasure7;
  String strMeasure8;
  String strMeasure9;
  String strMeasure10;
  String strMeasure11;
  String strMeasure12;
  String strMeasure13;
  String strMeasure14;
  String strMeasure15;
  String strMeasure16;
  String strMeasure17;
  String strMeasure18;
  String strMeasure19;
  String strMeasure20;
  String strSource;
  String strImageSource;
  String strCreativeCommonsConfirmed;
  String dateModified;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified});

  factory Meal.fromJson(Map<String,dynamic> json){
    return Meal(
      idMeal : json["idMeal"]??"N/A",
      strMeal : json["strMeal"]??"N/A",
      strDrinkAlternate : json["strDrinkAlternate"]??"N/A",
      strCategory : json["strCategory"]??"N/A",
      strArea : json["strArea"]??"N/A",
      strInstructions : json["strInstructions"]??"N/A",
      strMealThumb : json["strMealThumb"]??"N/A",
      strTags : json["strTags"]??"N/A",
      strYoutube : json["strYoutube"]??"N/A",
      strIngredient1 : json["strIngredient1"]??"N/A",
      strIngredient2 : json["strIngredient2"]??"N/A",
      strIngredient3 : json["strIngredient3"]??"N/A",
      strIngredient4 : json["strIngredient4"]??"N/A",
      strIngredient5 : json["strIngredient5"]??"N/A",
      strIngredient6 : json["strIngredient6"]??"N/A",
      strIngredient7 : json["strIngredient7"]??"N/A",
      strIngredient8 : json["strIngredient8"]??"N/A",
      strIngredient9 : json["strIngredient9"]??"N/A",
      strIngredient10 : json["strIngredient10"]??"N/A",
      strIngredient11 : json["strIngredient11"]??"N/A",
      strIngredient12 : json["strIngredient12"]??"N/A",
      strIngredient13 : json["strIngredient13"]??"N/A",
      strIngredient14 : json["strIngredient14"]??"N/A",
      strIngredient15 : json["strIngredient15"]??"N/A",
      strIngredient16 : json["strIngredient16"]??"N/A",
      strIngredient17 : json["strIngredient17"]??"N/A",
      strIngredient18 : json["strIngredient18"]??"N/A",
      strIngredient19 : json["strIngredient19"]??"N/A",
      strIngredient20 : json["strIngredient20"]??"N/A",
      strMeasure1 : json["strMeasure1"]??"N/A",
      strMeasure2 : json["strMeasure2"]??"N/A",
      strMeasure3 : json["strMeasure3"]??"N/A",
      strMeasure4 : json["strMeasure4"]??"N/A",
      strMeasure5 : json["strMeasure5"]??"N/A",
      strMeasure6 : json["strMeasure6"]??"N/A",
      strMeasure7 : json["strMeasure7"]??"N/A",
      strMeasure8 : json["strMeasure8"]??"N/A",
      strMeasure9 : json["strMeasure9"]??"N/A",
      strMeasure10 : json["strMeasure10"]??"N/A",
      strMeasure11 : json["strMeasure11"]??"N/A",
      strMeasure12 : json["strMeasure12"]??"N/A",
      strMeasure13 : json["strMeasure13"]??"N/A",
      strMeasure14 : json["strMeasure14"]??"N/A",
      strMeasure15 : json["strMeasure15"]??"N/A",
      strMeasure16 : json["strMeasure16"]??"N/A",
      strMeasure17 : json["strMeasure17"]??"N/A",
      strMeasure18 : json["strMeasure18"]??"N/A",
      strMeasure19 : json["strMeasure19"]??"N/A",
      strMeasure20 : json["strMeasure20"]??"N/A",
      strSource : json["strSource"]??"N/A",
      strImageSource : json["strImageSource"]??"N/A",
      strCreativeCommonsConfirmed : json["strCreativeCommonsConfirmed"]??"N/A",
      dateModified : json["dateModified"]??"N/A",);
  }

}