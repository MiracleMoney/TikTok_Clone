import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone2/constants/gaps.dart';
import 'package:tiktok_clone2/constants/sizes.dart';
import 'package:tiktok_clone2/features/%08discover/discover_screen.dart';
import 'package:tiktok_clone2/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone2/common/widgets/main_navigation/widget/nav_tab.dart';
import 'package:tiktok_clone2/common/widgets/main_navigation/widget/post_video_button.dart';
import 'package:tiktok_clone2/features/users/user_profile_screen.dart';
import 'package:tiktok_clone2/features/videos/video_timeline_screen.dart';
import 'package:tiktok_clone2/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  // final screens = [
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  //   Container(),
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  // const Center(
  //   child: Text(
  //     "Home",
  //     style: TextStyle(
  //       fontSize: 49,
  //     ),
  //   ),
  // ),
  // const Center(
  //   child: Text(
  //     "Discover",
  //     style: TextStyle(
  //       fontSize: 49,
  //     ),
  //   ),
  // ),
  // const Center(
  //   child: Text(
  //     "Search",
  //     style: TextStyle(
  //       fontSize: 49,
  //     ),
  //   ),
  // ),
  // const Center(
  //   child: Text(
  //     "Inbox",
  //     style: TextStyle(
  //       fontSize: 49,
  //     ),
  //   ),
  // ),
  // const Center(
  //   child: Text(
  //     "Profile",
  //     style: TextStyle(
  //       fontSize: 49,
  //     ),
  //   ),
  // ),
  // ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostViedoButtonTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Record viedo"),
        ),
      ),
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "니꼬",
              tab: "",
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
        padding: const EdgeInsets.only(
          bottom: Sizes.size32,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostViedoButtonTap,
                child: PostVideoButton(
                  inverted: _selectedIndex != 0,
                ),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
