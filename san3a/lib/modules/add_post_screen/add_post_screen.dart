import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/add_post_screen/cubit/post_cubit.dart';
import 'package:san3a/modules/add_post_screen/cubit/post_states.dart';
import 'package:san3a/shared/component/component.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key,}) : super(key: key);
  @override
  State<AddScreen> createState() => _AddScreenState();

}

class _AddScreenState extends State<AddScreen> {
  String valueChoose = 'elSan3a' ;
  TextEditingController postController= TextEditingController();
  var formkey = GlobalKey<FormState>();
  int index =0;
  bool isPost=false ;
@override

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostCubit(),
      child: BlocConsumer<PostCubit , PostStates>(
          listener:(context , state){
          },

          builder:(context , state){
            var cubit = PostCubit.get(context);
            return Scaffold(

              appBar:AppBar(

                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:const Icon(Icons.arrow_back),),
                title: const Text('Create post',
                  style: TextStyle(

                    fontSize: 18,
                  ),),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultButton(
                        background: cubit.ColorButton,
                        text: 'Post',
                        function: (){
                          if (formkey.currentState!.validate()){
                           // PostCubit.get(context).addPost(image, description, job: job);
                          }
                        },
                        width: 90,
                        height:10),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(

                        children: [
                          Expanded(

                            flex: 0,
                            child: Column(

                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.blueGrey[300],
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                            child: Column(

                              children: [
                                Row(
                                  children:  [
                                    Text(
                                      'Mohamed Ahmed',
                                      style: Theme.of(context).textTheme.bodyText1
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          alignment: Alignment(0.5, 0),
                                          menuMaxHeight:120,
                                          style: TextStyle(fontSize: 12),
                                          elevation: 0,
                                          value: valueChoose,
                                          borderRadius: BorderRadius.circular(15),
                                          items: const [
                                            DropdownMenuItem<String>( enabled:false,value:'elSan3a' ,child: Text('Choose san3a',style: TextStyle(color: Colors.grey),),),
                                            DropdownMenuItem<String>(value:'3' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'4' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'5' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'6' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'2' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'8' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'9' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'10' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'11' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'12' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'13' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'14' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'15' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'16' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'17' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'18' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'19' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'20' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'16' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'17' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'18' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'19' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'20' ,child: Text('Mechanices',style: TextStyle(color: Colors.black),),),

                                          ],
                                          onChanged: dropDownCallback,
                                        )),
                                    defaultButton(
                                        background: Colors.blue,
                                        text: 'Image',
                                        function: (){
                                          PostCubit.get(context).getImageProfileFromGallery();
                                        },
                                        width: 90,
                                        height:30),
                                  ],

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:20,),
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 350,
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 8,
                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 17 , color: Colors.white,),
                                  controller: postController,
                                  keyboardType: TextInputType.text,
                                  onChanged: (String? value){
                                    if(value!.isNotEmpty){
                                      isPost=true;
                                      cubit.changeColorButton(isPost);
                                    }
                                    else if(value.isEmpty){
                                      isPost=false;
                                      cubit.changeColorButton(isPost);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText:'Write your post here...',
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                    border: InputBorder.none,


                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child:GridView.builder(
                                itemBuilder: (context , index){
                                  this.index = index;
                                  return Image.file(File(PostCubit.get(context).pickedFile[index].path) , fit: BoxFit.cover,);
                                },
                                itemCount: PostCubit.get(context).pickedFile.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3 ),
                                addSemanticIndexes: index>=0 ? cubit.changeColorButton1(index): cubit.changeColorButton1(index) ,
                              ),


                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  void dropDownCallback( String? selectValue){
    if(selectValue is String){
      setState(() {
        valueChoose = selectValue;
      });
    }
  }
}



// defaultTextField(
//     hint: 'Write your post here',
//     type: TextInputType.text,
//     controller: postController,
//    border: InputBorder.none,
//    height: 300,
//
//     // validate:(value){
//     //   if(value!.isEmpty){
//     //     isPost=false;
//     //     cubit.changeColorButton(isPost);
//     //     return 'please enter post';
//     //   }
//     //   else if(value.isNotEmpty){
//     //     isPost=true;
//     //         cubit.changeColorButton(isPost);
//     //   }
//     // }
//     onchange:(String? value){
//       if(value!.isNotEmpty){
//         isPost=true;
//         cubit.changeColorButton(isPost);
//       }
//       else if(value.isEmpty){
//         isPost=false;
//         cubit.changeColorButton(isPost);
//       }
//     }
// ),
