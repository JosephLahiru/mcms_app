import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: AppointmentCounter()));
}

class AppointmentCounter extends StatefulWidget {
  @override
  _AppointmentCounterState createState() => _AppointmentCounterState();
}

class _AppointmentCounterState extends State<AppointmentCounter> {
  int _appNum = 0;
  Timer? _timer;

  Future<int> getAppNum(String endPoint) async {
    var resp = await http.get(Uri.parse(endPoint));
    if (resp != null && resp.statusCode == 200) {
      List<dynamic> responseJson = jsonDecode(resp.body);
      if (responseJson.isNotEmpty) {
        return responseJson[0]['val'];
      } else {
        throw Exception('Empty response');
      }
    } else {
      throw Exception('Failed to load app number');
    }
  }

  Future<void> setAppNum(String endPoint) async {
    var resp = await http.post(Uri.parse(endPoint));
    if (resp == null || resp.statusCode != 200) {
      throw Exception('Failed to set app number');
    }
  }

  void _getAppNum() async {
    final num = await getAppNum('https://mcms_api.mtron.me/get_app_no');
    setState(() {
      _appNum = num;
    });
  }

  void _setAppNum(int num) async {
    await setAppNum('https://mcms_api.mtron.me/set_app_no/$num');
    _getAppNum();
  }

  @override
  void initState() {
    super.initState();
    _getAppNum();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => _getAppNum());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Appointments:',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_appNum',
              style: Theme.of(context).textTheme.headline1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _setAppNum(_appNum - 1),
                  child: Text('Previous Appointment'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _setAppNum(0),
                  child: Text('Reset Appointment'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _setAppNum(_appNum + 1),
                  child: Text('Next Appointment'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
