import 'package:intl/intl.dart';

class MyDateUtils {
  static String formatNewsDate(String inputDateString){
    var inputDateFormatter = DateFormat('yyyy-MM-ddThh:mm:ssZ');
    var outputDateFormatter= DateFormat('yyyy/MMM/dd hh:mm a');
    var inputDate =inputDateFormatter.parse(inputDateString); // convert string to dateTime and make it like input format
    var outputDateString= outputDateFormatter.format(inputDate);
    return outputDateString;



  }



}