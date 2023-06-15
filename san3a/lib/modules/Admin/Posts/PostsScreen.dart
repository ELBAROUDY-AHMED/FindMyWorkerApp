import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/AdminScreen.dart';
import 'package:san3a/modules/Admin/Posts/Cubit/AdminPostCubit.dart';
import 'package:san3a/modules/Admin/Posts/Cubit/AdminPostStates.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/colors.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminPostCubit, AdminPostStates>(
      listener: (context, states) {
        // if (state is PostSuccessState) {
        //   navigateTo(context, const ProUser());
        // }
      },
      builder: (context, state) {
        var Cubit = AdminPostCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, AdminScreen());
                      },
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                    ),
                    Text(
                      ' All Report Posts',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 3.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: ConditionalBuilder(
                      condition:  state is AdminPostSuccessState,
                      builder: (context) => ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            // navigateTo(context, PostItem(Cubit.adminPostModel!,context , index));
                          },
                          child: Card(
                            elevation: 10.0,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 25,
                                              backgroundImage: NetworkImage(
                                                  AdminPostCubit.get(context)
                                                      .adminPostModel!
                                                      .postData[index]
                                                      .userDataPost
                                                      .photo),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AdminPostCubit.get(context)
                                                    .adminPostModel!
                                                    .postData[index]
                                                    .userDataPost
                                                    .name),
                                                Text(AdminPostCubit.get(context)
                                                    .adminPostModel!
                                                    .postData[index]
                                                    .dateOfPost),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        AdminPostCubit.get(context)
                                            .adminPostModel!
                                            .postData[index]
                                            .textPost!,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                    AdminPostCubit.get(context)
                                                .adminPostModel!
                                                .postData[index]
                                                .image ==
                                            null
                                        ? SizedBox()
                                        : SizedBox(
                                            child: Image(
                                              image: NetworkImage(
                                                  AdminPostCubit.get(context)
                                                      .adminPostModel!
                                                      .postData[index]
                                                      .image!),
                                            ),
                                          ),
                                  ],
                                ),
                                const Divider(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      defaultButtonWithIcon(
                                        icon: Icons.send,
                                        background: defaultColor,
                                        text: 'Delete',
                                        function: () async {
                                          // await ChatCubit.get(context).GetChatsFromPost(
                                          //     idUser: TineLineCubit.get(context).getPost!.postData[index].userDataPost.id);
                                          // navigateTo(context, IndividualChatFromPost(index, TineLineCubit.get(context).getPost!));
                                        },
                                        width: 120.0,
                                        radius: 40.0,
                                        height: 40.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: Cubit.adminPostModel!.length,
                      ),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
