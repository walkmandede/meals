
class CategorizedMeal{
  String idMeal;
  String strMealThumb;
  String strMeal;


  CategorizedMeal({
    required this.idMeal,
    required this.strMealThumb,
    required this.strMeal,

  });

  factory CategorizedMeal.fromJson(Map<String,dynamic> json){
    return CategorizedMeal(
      idMeal : json["idMeal"]??"N/A",
      strMealThumb : json["strMealThumb"]??"N/A",
      strMeal : json["strMeal"]??"N/A",
    );
  }

}