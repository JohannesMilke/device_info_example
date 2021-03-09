import 'dart:io';

import 'package:device_info_example/api/device_info_api.dart';
import 'package:device_info_example/api/ip_info_api.dart';
import 'package:device_info_example/api/package_info_api.dart';
import 'package:device_info_example/main.dart';
import 'package:device_info_example/widget/info_widget.dart';
import 'package:flutter/material.dart';

class BugInfoPage extends StatefulWidget {
  @override
  _BugInfoPageState createState() => _BugInfoPageState();
}

class _BugInfoPageState extends State<BugInfoPage> {
  Map<String, dynamic> map = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final packageName = await PackageInfoApi.getPackageName();
    final appVersion = await PackageInfoApi.getAppVersion();
    final ipAddress = await IpInfoApi.getIPAddress();
    final phone = await DeviceInfoApi.getPhoneInfo();
    final phoneVersion = await DeviceInfoApi.getPhoneVersion();
    final operatingSystem = await DeviceInfoApi.getOperatingSystem();
    final screenResolution = await DeviceInfoApi.getScreenResolution();

    if (!mounted) return;

    setState(() => map = {
          'IP Address': ipAddress,
          'Phone': phone,
          'Phone OS Version': phoneVersion,
          'Operating System': operatingSystem,
          'Screen Resolution': screenResolution,
          '': '',
          'App Version': appVersion,
          Platform.isAndroid ? 'Package Name' : 'Bundle ID': packageName,
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: InfoWidget(map: map),
      );
}
