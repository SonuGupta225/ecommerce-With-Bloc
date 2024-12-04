import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/data/app_pref.dart';
import 'package:http/http.dart'as http;
import 'exception.dart';
class ApiHelper{
  postApi({required String url,Map<String,dynamic>?mapData,bool isHeader=false}) async {
    var uri = Uri.parse(url);
    String token='';
    if(isHeader){
      token=await AppPrefs().getToken();
    }
    try{
      var data=await http.post(uri,body: mapData!=null?jsonEncode(mapData):{},headers: isHeader?{
        'Authorization' :'Bearer $token'
      }:{});
      return returnException(data);
    }on SocketException catch(e){
      throw(NetworkError(errorMsg: 'No Internet'));
    }
  }
  getApi({required String url,}) async {
    var uri = Uri.parse(url);
    String token=await AppPrefs().getToken();

    try{
      var data=await http.get(uri,headers:{
        'Authorization' :'Bearer $token'
      });
      return returnException(data);
    }on SocketException catch(e){
      throw(NetworkError(errorMsg: 'No Internet'));
    }
  }


  returnException(http.Response response){
    switch(response.statusCode){
      case 200 :{
        var mData=jsonDecode(response.body);
        return mData;
      }
      case 400:BadRequestError(errorMsg: response.toString());
      case 401:UnauthorisedError(errorMsg: response.toString());
      case 404:InvalidInputError(errorMsg: response.toString());
      default:NetworkError(errorMsg: 'Error - ${response.toString()}');
    }
  }
}
class JsonResponse{
  String? message;
  bool? status;
  String? token;
  JsonResponse({required this.status,required this.message,required this.token,});
}