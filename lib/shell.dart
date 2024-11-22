import 'package:devbox_flutter/pages/home_page.dart';
import 'package:devbox_flutter/pages/tools_page.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  Widget content = const HomePage();

  final _key = GlobalKey<ScaffoldState>();
  String title = 'Home';

  void indexChanged() {
    setState(() {
      content = ToolsPage(barController: _controller);
      // content = _getPageByIndex(_controller);
      title = _getTitleByIndex(_controller.selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: canvasColor,
        title: Text(title),
      ),
      key: _key,
      body: Row(
        children: [
          // SidebarX(
          //   controller: SidebarXController(selectedIndex: 0),
          //   items: const [
          //     SidebarXItem(icon: Icons.home, label: 'Home'),
          //     SidebarXItem(icon: Icons.search, label: 'Search'),
          //   ],
          // ),
          NavSidebar(controller: _controller, onTap: () => indexChanged()),
          // Your app screen body
          Expanded(
            child: content,
          ),
        ],
      ),
    );
  }
}

class NavSidebar extends StatelessWidget {
  NavSidebar({
    super.key,
    required SidebarXController controller,
    required this.onTap,
  }) : _controller = controller;

  final SidebarXController _controller;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            _controller.selectIndex(0);
            onTap();
            // onChanged('Home');
          },
        ),
        SidebarXItem(
          icon: Icons.search,
          label: 'Search',
          onTap: () {
            _controller.selectIndex(1);
            onTap();
          },
        ),
        SidebarXItem(
          icon: Icons.people,
          label: 'People',
          onTap: () {
            _controller.selectIndex(2);
            onTap();
          },
        ),
        SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorites',
          selectable: false,
          onTap: () {
            _controller.selectIndex(3);
            onTap();
          },
        ),
        SidebarXItem(
          iconWidget: FlutterLogo(size: 20),
          label: 'Flutter',
          onTap: () {
            _controller.selectIndex(4);
            onTap();
          },
        ),
      ],
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

// Widget _getPageByIndex(SidebarXController con) {
//   switch (con.selectedIndex) {
//     case 0:
//       return HomePage();
//     case 1:
//       return ToolsPage(
//         controller: con,
//       );
//     case 2:
//       return HomePage();
//     case 3:
//       return HomePage();
//     case 4:
//       return HomePage();
//     case 5:
//       return HomePage();
//     case 6:
//       return HomePage();
//     default:
//       return HomePage();
//   }
// }

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
