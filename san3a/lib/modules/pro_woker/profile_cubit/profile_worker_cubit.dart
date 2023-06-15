import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/profileModel.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class ProfileWorkerCubit extends Cubit<ProfileWorkerState>{

  ProfileWorkerCubit():super(ProfileWorkerInitialState());

 static ProfileWorkerCubit get(context)=> BlocProvider.of(context);

  ProfileModel? _profile;

  ProfileModel? get profile => _profile;

  Future<void> getProfileIfnotExists() async {
    if(_profile == null){
      return GetProfilePostsWorker();
    }
    return;
  }

  void GetProfilePostsWorker() {
    emit(GetProfilePostWorkerLoadingState());

    DioHelper.getData(
        url: GETPROFILEPAGE,
        token: token
    )
        .then((value) {

      _profile=ProfileModel.fromJson(value.data);


      emit(GetProfilePostWorkerSuccessState(_profile));
    })
        .catchError((error) {

      emit(GetProfilePostWorkerErrorState(error.toString()));
    });
  }

}