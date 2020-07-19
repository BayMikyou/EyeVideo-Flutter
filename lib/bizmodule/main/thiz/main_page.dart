import 'package:eye_video/bizmodule/blocs.dart';
import 'package:eye_video/bizmodule/main/category/category_page.dart';
import 'package:eye_video/bizmodule/main/category/repositories/mock/mock_category_repository.dart';
import 'package:eye_video/bizmodule/main/selections/blocs/selection_bloc.dart';
import 'package:eye_video/bizmodule/main/selections/respositories/mock/mock_selection_repository.dart';
import 'package:eye_video/bizmodule/main/selections/selection_page.dart';
import 'package:eye_video/bizmodule/main/thiz/blocs/main_bloc.dart';
import 'package:eye_video/bizmodule/main/thiz/repositories/mock/mock_main_repository.dart';
import 'package:eye_video/bizmodule/main/thiz/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var tabs = ['精选', '分类', '发现', '社区'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: buildTabBar(tabs),
          elevation: 2.0,
          actions: [
            Icon(Icons.search),
          ],
        ),
        drawer: BlocProvider(
          create: (ctx) => MainBloc(mainRepository: MockMainRepository()),
          child: DrawerWidget(),
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            var index = tabs.indexOf(tab);
            if (index == 0)
              return BlocProvider(
                create: (ctx) => SelectionBloc(
                    selectionRepository: MockSelectionRepository()),
                child: SelectionPage(),
              );
            else if (index == 1)
              return BlocProvider(
                create: (context) =>
                    CategoryBloc(categoryRepository: MockCategoryRepository()),
                child: CategoryPage(),
              );
            else
              return Center(child: Text(tab));
          }).toList(),
        ),
      ),
    );
  }

  Widget buildTabBar(List<String> tabs) {
    return TabBar(
      isScrollable: true,
      indicator: BoxDecoration(color: Colors.transparent),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: tabs.map((textStr) => Tab(text: textStr)).toList(),
      labelStyle: TextStyle(
        color: Color(0xff333333),
        fontSize: 15,
        fontFamily: 'NotoSansHans-Medium',
      ),
      unselectedLabelStyle: TextStyle(
        color: Color(0xff666666),
        fontSize: 15,
        fontFamily: 'NotoSansHans-Regular',
      ),
    );
  }
}
