import 'package:flutter/material.dart';
import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';

class HotCategoryItems extends StatelessWidget {
  final List<Discovery> discoveryList;

  const HotCategoryItems({Key key, this.discoveryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: GridView.count(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        padding: EdgeInsets.only(top: 15),
        children: discoveryList
            .map(
              (discovery) => Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(discovery.data.image),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(discovery.data.title.replaceAll("#", "")),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
