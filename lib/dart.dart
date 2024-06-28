import 'dart:convert';
import 'dart:io';
import 'package:ini/ini.dart';
import "package:shift_tracking_system_mobile_application/models/personel.dart";
import 'package:http/http.dart' as http;


   String? _host;
   int?_port;

const String _config="/lib/config/config.ini";
Future<void> main()async{
  await readDataFromIni(); // only works in server device.
  await push(Personel(idNumber: 0,email: "mail",name: "joe",surname: "doe",password: "pass")).then((value) => print(value.body));
}


// IT ONLY WORKS IN SERVER DEVICE
Future<void> readDataFromIni() async {
  final file = File(_config); // Replace 'config.ini' with your actual file path
  try {
    if (await file.exists()) {
      final config = Config.fromStrings(await file.readAsLines());
      final host = config.get('server', 'host') as String;
      final port = config.get('server', 'port') as String;
      _host = host;
      _port = int.parse(port) ;
      print("FILE READED HOST: $_host AND PORT IS: $_port");
    }
    print("FILE NOT EXIST");
  } on FileSystemException catch (e) {
    // Handle file system errors (e.g., file not found, permission issues)
    print("Error reading config file: $e");
  } catch (e) {
    // Handle other exceptions (e.g., parsing errors)
    print("Unexpected error reading config file: $e");
  }
}




Future<http.Response> push(Personel personel, {String host = "0.0.0.0",int port = 5000})async{
    final response = await http.post(
      Uri(scheme: "http",host: host,path: "/push",port: port),
      body:jsonEncode(personel.serialize()),
      headers: {"Content-Type": "application/json"},
    );
    return response;
}


