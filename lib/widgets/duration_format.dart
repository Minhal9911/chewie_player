class DurationFormat{
  static String formatDuration(String duration){
    var value=duration.split(':');
    var hours=value[0];
    var min=value[1];
    return "${hours.toString()} hr : ${min.toString()} min";
  }
}