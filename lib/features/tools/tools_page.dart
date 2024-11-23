import 'package:devbox_flutter/features/generators/generators_helper.dart';
import 'package:devbox_flutter/features/generators/generators_list.dart';
import 'package:devbox_flutter/features/tools/tool.dart';
import 'package:devbox_flutter/features/tools/tools_controller.dart';
import 'package:devbox_flutter/features/tools/tools_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:yaru/yaru.dart';

class ToolsPage extends GetView<ToolsController> {
  const ToolsPage({
    super.key,
    required this.barController,
  });

  final SidebarXController barController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          // final pageTitle = _getTitleByIndex(controller.selectedIndex);
          switch (barController.selectedIndex) {
            case 0:
              return toolList(ToolsGroup.generators, controller);
            // return ListView.builder(
            //   padding: const EdgeInsets.only(top: 10),
            //   itemBuilder: (context, index) => Container(
            //     height: 100,
            //     width: double.infinity,
            //     margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: Theme.of(context).canvasColor,
            //       boxShadow: const [BoxShadow()],
            //     ),
            //   ),
            // );
            default:
              return toolList(ToolsGroup.all, controller);
            // return Text(
            //   pageTitle,
            //   style: theme.textTheme.headlineSmall,
            // );
          }
        },
      ),
    );
  }
}

Widget toolList(ToolsGroup group, ToolsController controller) {
  var toolList = getToolListByGroup(group);
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.5),
    itemCount: group.count,
    itemBuilder: (BuildContext context, int index) {
      return YaruBanner.tile(
        onHover: (hovered) => controller.isHovered.value = hovered,
        title: Text(toolList[index].name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(toolList[index].description),
            // if (thirdLine != null) thirdLine,
          ],
        ),
        icon: Icon(SymbolsGet.get(
            toolList[index].icon,
            SymbolStyle
                .outlined)), //Icon(IconData(toolList[index].icon, fontFamily: 'MaterialIcons')),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => _getPageByIndex(
                    toolList[index].groupId, toolList[index].id))),
        // onTap: () => Get.to(
        //     () => _getPageByIndex(toolList[index].groupId, toolList[index].id)),
        // showDialog(
        //   context: context,
        //   builder: (context) => SimpleDialog(
        //     titlePadding: EdgeInsets.zero,
        //     contentPadding: const EdgeInsets.all(10),
        //     title: YaruDialogTitleBar(
        //       title: Text(toolList[index].name),
        //     ),
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Text(toolList[index].description),
        //       ),
        //     ],
        //   ),
        // ),
        surfaceTintColor: index.isEven ? Colors.pink : null,
      );
    },
  );
}

List<Tool> getToolListByGroup(ToolsGroup group) {
  switch (group.index) {
    case 0:
      return generators;
    default:
      return generators;
  }
}

// String _getTitleByIndex(int index) {
//   switch (index) {
//     case 0:
//       return 'Home';
//     case 1:
//       return 'Search';
//     case 2:
//       return 'People';
//     case 3:
//       return 'Favorites';
//     case 4:
//       return 'Custom iconWidget';
//     case 5:
//       return 'Profile';
//     case 6:
//       return 'Settings';
//     default:
//       return 'Not found page';
//   }
// }

Widget _getPageByIndex(int groupId, int toolId) {
  switch (groupId) {
    case 0:
      return getGeneratorPage(toolId);
    default:
      return const Center(
        child: Text('Not found page'),
      );
  }
}
