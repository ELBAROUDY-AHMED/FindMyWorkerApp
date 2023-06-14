import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/layout/cubit/states_layout.dart';
import 'package:san3a/layout/san3a_layout.dart';
import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/Onboarding_Screens/onbording.dart';
import 'package:san3a/modules/Register_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/cubit/bloc_observer.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';
import 'package:san3a/shared/styles/themes.dart';
//brakat
//Welcome to git hub
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  bool isOpen = CacheHelper.getData(key: 'isOpen') ?? false;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  token = CacheHelper.getData(key: 'token');
  role = CacheHelper.getData(key: 'role');

  late Widget widget;
  if(token == null){
    widget = Login_Screen();
  } else if (onBoarding){
    widget = const OnboardingScreen();
  } else {
    widget = San3aLayout();
  }
  // camera =await availableCameras();
  runApp(MyApp(isDark, isOpen, widget));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  final bool isOpen;

  const MyApp(this.isDark, this.isOpen, this.startWidget, {super.key});

  final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => San3aLayoutCubit()
              ..changeMode(fromShared: isDark, fromShared1: isOpen)),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(
            create: (context) => TineLineCubit()..GetPosts(token: token!)),
        BlocProvider(
            create: (context) => ChatCubit()..GetAllChats(token: token!))
      ],
      child: BlocConsumer<San3aLayoutCubit, San3aLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = San3aLayoutCubit.get(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
