import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longitude;
  Future<void> getCurrentLocation() async {
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      /*Future<Position> position =  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
   Here we only get the receipt not the donut flutter: Instance of 'Future<Position>' but
   we need the donut that's why the await is used!!
    */
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){

    }
  }
}
