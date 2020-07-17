import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  final String title;

  const HeaderItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: Color(0xFFBDBDBD),
          thickness: 0.1,
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 5, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 60,
                height: 20,
                child: OutlineButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    '查看更多',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xff333333),
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () => null,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
