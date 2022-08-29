import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/Application/Home/Bloc/home_bloc.dart';
import '../../../Data/Model/post_model.dart';

class UpdatePage extends StatefulWidget {
  final Post post;
  UpdatePage({Key? key, required this.post}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.post.fullname;
    bodyController.text = widget.post.mobile;
  }

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
                        Post updatePost = Post(id: widget.post.id, fullname: titleController.text.toString(), mobile: bodyController.text.toString());
                        context.read<HomeBloc>().add(HomeUpdateEvent(post: updatePost));
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Update a Post",
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
