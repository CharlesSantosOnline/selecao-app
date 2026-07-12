import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:esportes_flutter/config/string_constants.dart';
import 'package:esportes_flutter/models/menu_item.dart';
import 'package:esportes_flutter/theme/ui_color.dart';
import 'package:esportes_flutter/theme/ui_icon.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:esportes_flutter/widgets/menu_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    _loadVersion();
    super.initState();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() => _packageInfo = info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(UiIcon.logo),
              const SizedBox(height: 40),
              SvgPicture.asset(UiIcon.identity),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var item in MenuItem.menuItems)
                    MenuItemWidget(item: item)
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    BY,
                    style: TextStyle(
                      color: UiColor.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'v${_packageInfo.version}',
                    style: const TextStyle(
                      color: UiColor.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
