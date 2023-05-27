import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/presentation/newAndHot/widgets/comingsoon/widgetfor_coming_soon.dart';

import '../../../../domain/apiendpoints.dart';
import '../../../../infrastucture/base_client.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apicall(ApiEndPoints.upcoming),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          const Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                Text('Please wait'),
              ],
            ),
          );
        }

        if (snapshot.data == null) {
          return const Text('No data found');
        }

        return ListView.builder(
            itemCount: snapshot.data.results.length,
            itemBuilder: (BuildContext context, int index) =>
                ComingSoonInfo(movieInfo: snapshot.data.results[index]));
      },
    );
  }
}
