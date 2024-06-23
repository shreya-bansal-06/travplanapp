import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String? getStringfromList(List<String>? data) {
  return data!.join(", ").toString();
}

dynamic converToJSON(String? prompt) {
  return [json.decode('{"role": "user", "content": "$prompt"}')];
}

String? jsonToString(dynamic jsonObject) {
  return jsonEncode(jsonObject);
}

String? jsonToFormattedItinerary(dynamic jsonObject) {
  List<String> itineraryLines = [];

  void parseItinerary(List<dynamic> itinerary) {
    for (var day in itinerary) {
      itineraryLines.add("Day: ${day['day']}");
      itineraryLines.add("Location: ${day['location']}");
      itineraryLines.add("Activities:");
      for (var activity in day['activities']) {
        itineraryLines.add(
            "  - ${activity['name']}: ${activity['description']} (Cost: ${activity['cost']} INR)");
      }
      itineraryLines.add("Dining:");
      for (var dining in day['dining']) {
        itineraryLines.add(
            "  - ${dining['name']}: ${dining['description']} (Cost: ${dining['cost']} INR)");
      }
      itineraryLines.add(
          "Accommodation: ${day['accommodation']['name']} - ${day['accommodation']['description']} (Cost: ${day['accommodation']['cost']} INR)");
      itineraryLines.add("");
    }
  }

  void parseBudget(Map<String, dynamic> budget) {
    itineraryLines.add("Budget:");
    itineraryLines.add("  Total: ${budget['total']} INR");
    itineraryLines.add("  Breakdown:");
    budget['breakdown'].forEach((category, amount) {
      itineraryLines.add(
          "    - ${category[0].toUpperCase()}${category.substring(1)}: $amount INR");
    });
  }

  parseItinerary(jsonObject['itinerary']);
  parseBudget(jsonObject['budget']);
  return itineraryLines.join("\n");
}

String? formatItineraryString(dynamic jsonString) {
  //final itinerary = jsonDecode(jsonString) as Map<String, dynamic>;

  final itinerary = jsonString;

  // Budget section (handle potential string values)
  String budget = "";
  budget += "**Budget Breakdown**\n";
  try {
    budget +=
        "  * Accommodation Budget: ₹${int.parse(itinerary['Budget']['Accommodation Budget'].toString())}\n";
    budget +=
        "  * Food Budget: ₹${int.parse(itinerary['Budget']['Food Budget'].toString())}\n";
    budget +=
        "  * Activities Budget: ₹${int.parse(itinerary['Budget']['Activities Budget'].toString())}\n\n";
  } catch (error) {
    budget += "  * Error parsing budget values\n\n";
  }

  // Daily Itinerary
  String formattedItinerary = "";
  formattedItinerary += "**Daily Itinerary**\n\n";
  for (var day in itinerary['Itinerary']) {
    formattedItinerary += "**${day['date']} - ${day['location']}**\n\n";

    // Activities
    formattedItinerary += "**Activities:**\n";
    for (var activity in day['activities']) {
      try {
        formattedItinerary +=
            "  * ${activity['name']} - ${activity['description']} (₹${int.parse(activity['cost'].toString())})\n";
      } catch (error) {
        formattedItinerary += "  * Error parsing activity cost\n";
      }
    }

    // Dining Options
    formattedItinerary += "\n**Dining Options:**\n";
    for (var option in day['dining_options']) {
      try {
        formattedItinerary +=
            "  * ${option['name']} - ${option['description']} (₹${int.parse(option['cost'].toString())})\n";
      } catch (error) {
        formattedItinerary += "  * Error parsing dining cost\n";
      }
    }

    // Accommodation
    formattedItinerary += "\n**Accommodation:**\n";
    try {
      formattedItinerary +=
          "  * ${day['accommodation']['name']} - ${day['accommodation']['description']} (₹${int.parse(day['accommodation']['cost'].toString())})\n\n";
    } catch (error) {
      formattedItinerary += "  * Error parsing accommodation cost\n\n";
    }
  }

  return budget + formattedItinerary;
}
