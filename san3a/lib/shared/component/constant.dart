

import 'package:san3a/shared/component/component.dart';

import '../../modules/Login_Screen/Login_Screen.dart';
import '../network/local/cache_helper.dart';

void signOut(context) async {
  await CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, Login_Screen());
    }
  });
}

void printFullText(String text) {
  //Copied Method
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

 String? token;
String? role;
