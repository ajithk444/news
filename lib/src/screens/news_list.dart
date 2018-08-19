import 'dart:async';
import '../blocs/stories_provider.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storiesBloc = StoriesProvider.of(context);
    storiesBloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: buildList(storiesBloc),
    );
  }

  Widget buildList(StoriesBloc storiesBloc) {
    return StreamBuilder(
      stream: storiesBloc.topIdsStream,
      builder: (context,AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              return Text('${snapshot.data[index]}');
            },);
      },
    );
  }
}
