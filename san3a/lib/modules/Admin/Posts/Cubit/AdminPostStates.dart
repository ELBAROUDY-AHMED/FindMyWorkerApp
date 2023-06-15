import 'package:san3a/models/AdminPostModel.dart';

abstract class AdminPostStates{}

class AdminPostInitialState extends AdminPostStates {}

class AdminPostLoadingState extends AdminPostStates {}

class AdminPostSuccessState extends AdminPostStates {
  AdminPostModel? adminPostModel;
  AdminPostSuccessState(this.adminPostModel);
}

class AdminPostErrorState extends AdminPostStates {
  final String error;
  AdminPostErrorState(this.error);
}
