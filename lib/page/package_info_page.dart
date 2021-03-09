import 'package:device_info_example/api/ip_info_api.dart';
import 'package:device_info_example/api/package_info_api.dart';
import 'package:device_info_example/main.dart';
import 'package:device_info_example/widget/info_widget.dart';
import 'package:flutter/material.dart';

class PackageInfoPage extends StatefulWidget {
  @override
  _PackageInfoPageState createState() => _PackageInfoPageState();
}

class _PackageInfoPageState extends State<PackageInfoPage> {
  Map<String, dynamic> packageInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final packageInfo = await PackageInfoApi.getInfo();
    final ipAddress = await IpInfoApi.getIPAddress();

    final newPackageInfo = {
      'ipAddress': ipAddress,
      ...packageInfo,
    };

    if (!mounted) return;

    setState(() => this.packageInfo = newPackageInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: InfoWidget(map: packageInfo),
      );
}
