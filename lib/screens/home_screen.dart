import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper.dart';
import '../pages/pages.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
            }),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: BottomNavigatorBar(
        onItemSelected: _onNavigatorItemSelected,
      ),
    );
  }
}

class Avarta {}

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  var selectedIndex = 0;
  void itemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigatorBarItems(
              index: 0,
              label: 'Messages',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              isSelected: (selectedIndex == 0),
              onTap: itemSelected),
          NavigatorBarItems(
              index: 1,
              icon: CupertinoIcons.phone_fill,
              label: 'Calls',
              isSelected: (selectedIndex == 1),
              onTap: itemSelected),
          NavigatorBarItems(
              index: 2,
              icon: CupertinoIcons.person_2_fill,
              label: 'Contacts',
              isSelected: (selectedIndex == 2),
              onTap: itemSelected),
        ],
      ),
    );
  }
}

class NavigatorBarItems extends StatelessWidget {
  const NavigatorBarItems({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 23,
            color: isSelected ? AppColors.secondary : null,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: isSelected
                ? const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  )
                : const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
