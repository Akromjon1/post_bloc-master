import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/Application/Home/Bloc/home_bloc.dart';
import '../../../Data/Model/post_model.dart';

class CreatePage extends StatelessWidget {

  CreatePage({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Stack(
          children: [
            Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      hintText: "Title", hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: bodyController,
                  decoration: const InputDecoration(
                      hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Post createPost = Post(id: "1", fullname: titleController.text.toString(), mobile: bodyController.text.toString());
                    context.read<HomeBloc>().add(HomeCreateEvent(post: createPost));
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Create a Post",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
