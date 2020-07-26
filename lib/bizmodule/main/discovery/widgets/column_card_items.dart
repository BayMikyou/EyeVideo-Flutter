import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';
import 'package:eye_video/framework/uikit/scrollview/overscroll_behavior.dart';
import 'package:flutter/material.dart';

class ColumnCardItems extends StatelessWidget {
  final List<Discovery> discoveryList;

  const ColumnCardItems({Key key, this.discoveryList}) : super(key: key);

  Widget getColumnItem(BuildContext context, String coverImage, String title,
      String description) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 120,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(coverImage),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'NotoSansHans-Medium',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'NotoSansHans-Regular',
                  fontSize: 12,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 2.0,
            padding: EdgeInsets.all(10),
            mainAxisSpacing: 8,
            children: discoveryList.map((discovery) {
              var coverImage = discovery.data.image;
              var title = discovery.data.title;
              var description = discovery.data.description;
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 120,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(coverImage),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'NotoSansHans-Medium',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            fontFamily: 'NotoSansHans-Regular',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ));
  }
}
