library my_prj.globals;
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


Widget chipDesign(String label, Color color) => Container(
  child: Chip(
    label: Text(
      label,
      style: const TextStyle(color: Colors.white,fontSize: 12),
    ),
    backgroundColor: color,
    elevation: 4,
    shadowColor: Colors.grey[50],
    padding: const EdgeInsets.all(4),
  ),
  margin: const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),

);

Future<String> translateToMyanmar(String englishText) async {
  var translation = await GoogleTranslator().translate(englishText, to: 'my');
  return translation.text;
}