import '../../Utils/AllImports.dart';

setFirstName(String fname) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('fname', fname);

}
setName(String firstname) async{
  final prefs=await SharedPreferences.getInstance();
  prefs.setString('first_name', firstname);
}