import 'dart:convert';

extension StringExtension on String {
  Map<String, dynamic> parseToMap() {

// remove all quotes from the string values
    final string2=replaceAll("'", "");

// now we add quotes to both keys and Strings values
    final quotedString = string2.replaceAllMapped(RegExp(r'\b\w+\b'), (match) {
      return '"${match.group(0)}"';
    });

// decoding it as a normal json
    final decoded = json.decode(quotedString);
    return decoded;
  }
}