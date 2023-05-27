import 'package:flutter/material.dart';
import 'package:nexflix_clone_flutter/presentation/newAndHot/widgets/everyones_watching/widget_everyone_watching_info_card.dart';
import '../../../../domain/apiendpoints.dart';
import '../../../../infrastucture/base_client.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apicall(ApiEndPoints.moviepopular),
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
            padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            itemCount: snapshot.data.results.length,
            itemBuilder: (BuildContext context, int index) =>
                EveryOneWatchingInfoCard(
              movieInfo: snapshot.data.results[index],
            ),
          );
        });
  }
}
