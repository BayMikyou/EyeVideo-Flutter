import 'package:eye_video/bizmodule/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is StateLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is StateEmpty) {
        return Center(
          child: Text('数据请求为空'),
        );
      } else if (state is StateLoadFailure) {
        return Center(
          child: Text('数据请求失败'),
        );
      } else if (state is StateLoadSuccess) {
        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          padding: EdgeInsets.all(3),
          mainAxisSpacing: 3,

          children: state.categoryModel.categoryList.map((itemData) {
            var coverImage = itemData.item.image;
            String title = itemData.item.title;
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    coverImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Text(
                    '${title.replaceAll("#", "")}',
                    style: TextStyle(
                      fontFamily: 'NotoSansHans-Medium',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        );
      }
      return Container();
    });
  }
}
