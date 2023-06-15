import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/AdminPostModel.dart';
import 'package:san3a/modules/Admin/Posts/Cubit/AdminPostStates.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class AdminPostCubit extends Cubit<AdminPostStates> {
  AdminPostCubit() : super(AdminPostInitialState());

static AdminPostCubit get(context) => BlocProvider.of(context);

AdminPostModel? adminPostModel;

  void GetPostsForAdmin({required String token}) {
    emit(AdminPostLoadingState());
    DioHelper.getData(url: GETPOSTS, token: token).then((value) {
      adminPostModel = AdminPostModel.fromJson(value.data);
      emit(AdminPostSuccessState(adminPostModel));
    }).catchError((error) {
      emit(AdminPostErrorState(error.toString()));

    });
  }

}