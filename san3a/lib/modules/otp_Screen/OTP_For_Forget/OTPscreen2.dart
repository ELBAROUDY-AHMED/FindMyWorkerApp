import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Forget/Cudit/cubit.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Forget/Cudit/states.dart';
import 'package:san3a/modules/rereset/Choose_send/Cubit/choose_send_cubit.dart';
import 'package:san3a/modules/rereset/Reset_Password/Resetpassword.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import '../../../shared/network/local/cache_helper.dart';



class OTPscreen2 extends StatelessWidget {

  @override
  final formKey = GlobalKey<FormState>();
  var otpcontroller = TextEditingController();

  final String typesend;
  final String phone;
  final String email;

  OTPscreen2({required this.typesend , required this.phone, required this.email});

  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) =>OtpForgetCubit(),
      child:BlocConsumer<OtpForgetCubit , OtpForgetStates>(
        listener: (context , state){
          if (state is otpSuccessState) {
            if (state.otpModel!.status) {
              CacheHelper.saveData(
                key: 'token',
                value: state.otpModel!.token,
              ).then((value) {
                token = state.otpModel!.token!;
                print(state.otpModel!.token);
                print('ناناااااهنااااااااااااااااااااااااااااااااااانننااااااااا');
                navigateAndFinish(context, ResetPassword_Screen(token:token));
                showToast(
                    text: state.otpModel!.message,
                    state: ToastState.SUCCESS);
              });
            } else {
              showToast(
                text: state.otpModel!.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context , state){
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SafeArea(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          // This will be the login form
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: const Image(
                                      image: AssetImage('assets/images/final_logo.png'),
                                      height: 180.0,
                                      width: 180.0,
                                    ),
                                  ),
                                  const SizedBox(height: 15.0),
                                  const Text(
                                    'We have sent to you an OTP',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  // const SizedBox(height: 10.0),
                                  // Text(
                                  //   "Please check your {mobile number 011******46} to reset your password",
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //     fontSize: 16.0,
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                              Column(
                                children: [
                                  Container(
                                    child: Center(
                                      child: TextFormField(
                                        controller: otpcontroller,
                                        onFieldSubmitted: (evalue) {
                                          print(evalue);
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter The Code sent to your Number/Email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          // hintText: 'Email Adress',
                                          // prefixIcon: Icon(Icons.phone),
                                          labelText: ' Enter Code sent to You ',
                                          border: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(50))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30.0),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          // alignment: Alignment.bottomRight,
                                          child: default_Button(
                                            function: () {
                                              if (formKey.currentState!.validate()) {
                                                if(typesend == "email"){
                                                  OtpForgetCubit.get(context).OTPPostForEmail(otp: otpcontroller.text);
                                                }else {
                                                  OtpForgetCubit.get(context).OTPPostForPhone(otp: otpcontroller.text, phone: phone,);
                                                }
                                              }
                                            },
                                            text: 'Confirm',
                                            isUpperCase: false,
                                            textStyle: null,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          // alignment: Alignment.bottomLeft,
                                          child: default_Button(
                                            function: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Login_Screen(),
                                                ),
                                              );
                                            },
                                            text: 'back',
                                            isUpperCase: false,
                                            textStyle: null,
                                            backgroundcolor: const Color(0xFFB6B7B7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Didn't Recieve? "),
                                          InkWell(
                                            onTap: (){
                                              if(ChooseSendCubit.get(context).type == "email")
                                              {
                                                ChooseSendCubit.get(context).SendOTP_To_Email(email: '${email}');
                                              }else{
                                                ChooseSendCubit.get(context).SendOTP_To_Phone(phone: '${phone}');
                                              }
                                            },
                                            child: Text(
                                              "sent agin",
                                              style: TextStyle(
                                                color: const Color(0xff4377ec),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ) ,
    );
  }
}

// class OTPInput extends StatelessWidget {
//   const OTPInput({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: ShapeDecoration(
//         color: const Color(0xFFB6B7B7),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 18, left: 20),
//             child: Text(
//               "*",
//               style: TextStyle(fontSize: 45),
//             ),
//           ),
//           TextField(
//             decoration: InputDecoration(border: InputBorder.none),
//           ),
//         ],
//       ),
//     );
//   }
//}
