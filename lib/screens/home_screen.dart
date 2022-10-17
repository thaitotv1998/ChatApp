import 'package:flutter/material.dart';
import '../helper.dart';
import '../pages/pages.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final ValueNotifier<String> pageTitle = ValueNotifier('Chats');

  final pages = const [
    MessagePage(),
    CallPage(),
    ContactPage(),
  ];

  final pageTitles = ['Chats', 'Calls', 'Contacts'];

  void _onNavigatorItemSelected(index) {
    pageIndex.value = index;
    pageTitle.value = pageTitles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Avatar.small(url: Helper.randomPicUrl()),
        ),
        title: ValueListenableBuilder(
          valueListenable: pageTitle,
          builder: (BuildContext context, String value, _) {
            return Text(
              pageTitle.value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: GBottomNavBar(
        onItemSelected: _onNavigatorItemSelected,
      ),
    );
  }
}
