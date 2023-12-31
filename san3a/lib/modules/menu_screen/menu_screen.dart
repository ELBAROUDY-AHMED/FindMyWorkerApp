import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/layout/cubit/states_layout.dart';
import 'package:san3a/modules/Edit_Profile/Edit_profile.dart';
import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Login_Screen/Cubit/states.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/help/help_screen.dart';
import 'package:san3a/modules/payment_screen/ToggelScreen.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_cubit.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_state.dart';
import 'package:san3a/modules/pro_woker/pro_worker.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:san3a/modules/saved_posts/saved_posts.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_worker.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuState();
}

class _MenuState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentCubitCubit()..getAuthToken(),
      child: BlocConsumer<San3aLayoutCubit,San3aLayoutStates>(
        listener:(context,state){

        } ,
        builder: (context,state){
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        BlocConsumer<ProfileWorkerCubit , ProfileWorkerState>(
                          listener:(context ,state){

                          } ,
                          builder: (context ,state){
                            final cubit = ProfileWorkerCubit.get(context);

                            return ConditionalBuilder(
                                condition: state is GetProfilePostWorkerSuccessState,
                                builder: (context)=>Column(
                                  children: [
                                    Container(
                                        height: 100.0,
                                        width: 100.0,
                                        child:  CircleAvatar(
                                          backgroundImage: NetworkImage(cubit.profile?.data!.userData!.photo??''),
                                        )

                                    ),

                                    const SizedBox(height: 5),
                                    Text(cubit.profile?.data!.userData!.name??'' ,style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24,fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.dark_mode_outlined,
                                            size: 40,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Dark Mode',
                                              style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24,fontWeight: FontWeight.bold) ,
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20.0),
                                            child: FlutterSwitch(
                                              width: 50.0,
                                              height: 25.0,
                                              toggleSize: 20.0,
                                              value:  San3aLayoutCubit.get(context).isOpen,
                                              borderRadius: 30.0,
                                              padding: 1.0,
                                              onToggle: (val) {
                                                San3aLayoutCubit.get(context).changeMode();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    MenuPage(
                                        fun: () {
                                          navigateTo(context, ProWorker());
                                        },
                                        color: Colors.orange,
                                        icon: Icons.camera_alt_outlined,
                                        text: 'Profile',
                                        context: context
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        fun: () {navigateTo(context, SavedPosts());},
                                        color: Colors.blue,
                                        icon: Icons.save_outlined,
                                        text: 'Saved Posts',
                                        context: context
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    BlocConsumer<PaymentCubitCubit,PaymentCubitState>(
                                      listener: (BuildContext context, state) {
                                        if( state is getPaymentRequestRegistrationIdSucessState){
                                           navigateTo(context, ToggleScreen());
                                        }
                                      },
                                      builder: (BuildContext context, Object? state) {
                                        return MenuPage(
                                            color: Colors.pink,
                                            icon: Icons.payments_outlined,
                                            text: 'Payment',
                                            fun: () {
                                              PaymentCubitCubit.get(context).getOrderRegisterationId(
                                                  name:cubit.profile!.data!.userData!.name! ,
                                                  email: cubit.profile!.data!.userData!.email!,
                                                  phone: cubit.profile!.data!.userData!.phone!
                                              );

                                            },
                                            context: context
                                        );
                                      },

                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        color: Colors.purple,
                                        icon: Icons.edit_note_outlined,
                                        text: 'Edit Profile',
                                        fun: () { navigateTo(context, Edit_profile()); },
                                        context: context
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.0),

                                            child: Text(
                                              'Language',
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                              padding: const EdgeInsets.only(right: 16.0),
                                              child: IconButton(
                                                icon: Icon(Icons.language),
                                                onPressed: (){  showDialog(

                                                    context: context,
                                                    builder: (context)
                                                    {return BackdropFilter(
                                                      filter: ImageFilter.blur(sigmaX: 6,sigmaY: 6),
                                                      child:AlertDialog(
                                                        insetPadding: EdgeInsets.all(10),

                                                        title: const Text(" Change Language"),

                                                        actions: <Widget>[
                                                          Container(
                                                            padding: const EdgeInsets.all(14),
                                                            child: Row(
                                                              children: [
                                                                TextButton(
                                                                    onPressed: () {
                                                                    },
                                                                    child: const Text("Arabic")),
                                                                const Spacer(),
                                                                TextButton(
                                                                    onPressed: () {

                                                                    },
                                                                    child: const Text("English")),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );}
                                                ); },
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        color: Colors.teal,
                                        icon: Icons.help_outline_outlined,
                                        text: 'Help',
                                        fun: () { navigateTo(context, HelpScreen()); },
                                        context: context
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        color: Colors.red,
                                        icon: Icons.logout,
                                        text: 'LogOut',
                                        fun: () {showDialog(context: context,
                                            builder:(BuildContext context){
                                              return BackdropFilter(filter: ImageFilter.blur(sigmaY: 6,
                                                  sigmaX: 6),
                                                child: AlertDialog(

                                                  title: Row(
                                                    children: const [
                                                      Text("Log Out"),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Icon(Icons.logout,size: 20,)
                                                    ],
                                                  ),
                                                  content: const Text("Are you sure ?"),
                                                  actions: <Widget>[
                                                    Container(

                                                      child: Row(
                                                        children: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                              child: const Text("No")),
                                                          const Spacer(),
                                                          TextButton(
                                                              onPressed: () {
                                                                navigateTo(context, Login_Screen());
                                                              },
                                                              child: const Text("Yes")),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                        ); },
                                        context: context

                                    ),
                                  ],
                                ),
                                fallback: (context)=>Center(child: CircularProgressIndicator())
                            );
                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
