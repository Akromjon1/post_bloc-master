import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:post_bloc/Application/Home/Bloc/home_bloc.dart';
import 'package:post_bloc/Application/Home/View/create_page.dart';
import 'package:post_bloc/Application/Home/View/update_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomePostGetEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Bloc"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomePostGetState) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return Slidable(
                  startActionPane: ActionPane(
                    extentRatio: 0.25,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdatePage(post: state.items[index])));
                        },
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.update,
                        label: 'Update',
                      ),
                    ],
                  ),

                  endActionPane: ActionPane(
                    extentRatio: 0.25,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_){
                          context.read<HomeBloc>().add(HomeDeleteEvent(id: state.items[index].id));
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child:  ListTile(
                    title: Text(
                      state.items[index].fullname,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      state.items[index].mobile,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );

              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
      ),
    );
  }
}
