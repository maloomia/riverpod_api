
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_api/providers/api_provider.dart';

class ShowApi extends ConsumerWidget {
  const ShowApi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(getApiProvider);
    return Scaffold(
      appBar: AppBar(),
      body: result.when
        (
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text("Error"),
          data: (value) {
            return ListView.builder(
              itemCount: value.length?? 0, itemBuilder: (context, index) {
              final post = value[index];
              return Column(
                children: [
                  Text(post.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                  SizedBox(height: 10,),
                  Text(post.content),
                  Divider(),
                ],
              );
            },
            );
          }


      ),

    );
  }
}