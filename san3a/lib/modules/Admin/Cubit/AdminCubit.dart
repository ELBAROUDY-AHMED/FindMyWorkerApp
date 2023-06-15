import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/Cubit/AdminStates.dart';
import 'package:san3a/modules/Admin/PaymentScreen.dart';
import 'package:san3a/modules/Admin/PostsScreen.dart';
import 'package:san3a/modules/Admin/ReportScreen.dart';
import 'package:san3a/modules/Admin/UsersScreen.dart';

class AdminCubit extends Cubit<AdminStates> {
  AdminCubit() : super(AdminInitialState());
  static AdminCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens = [
    PaymentScreen(),
    PostsScreen(),
    UsersScreen(),
    reportScreen(),
  ];

 void changeIndex(int index){
   currentIndex = index;
   emit(changeIndexState());
 }

}