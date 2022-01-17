// Don't forget to initialize all bloc provider at main.dart

import 'package:doctor_app/bloc/example/bloc.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Api2Page extends StatefulWidget {
  @override
  _Api2PageState createState() => _Api2PageState();
}

class _Api2PageState extends State<Api2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late ExampleBloc _exampleBloc;
  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  String _data = 'data will be appear here';

  @override
  void initState() {
    _exampleBloc = BlocProvider.of<ExampleBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    apiToken.cancel("cancelled"); // cancel fetch data from API
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'API 2 (POST Method)',
                  desc: 'This is the example of get data from API using POST Method'
              ),
            ),
            Container(
                child: _globalWidget.createButton(
                    buttonName: 'Get Data',
                    onPressed: (){
                      _exampleBloc.add(PostExample(id:'326548', apiToken: apiToken));
                    }
                ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('Data :', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: BlocListener<ExampleBloc, ExampleState>(
                listener: (context, state) {
                  if(state is ExampleError) {
                    Fluttertoast.showToast(msg: 'error occured', toastLength: Toast.LENGTH_SHORT);
                  }
                  if(state is PostExampleSuccess) {
                    _data = state.exampleData;
                  }
                },
                child: BlocBuilder<ExampleBloc, ExampleState>(
                  builder: (context, state) {
                    if(state is ExampleError) {
                      return Text('error occured');
                    } else if(state is ExampleWaiting) {
                      return Text('waiting...');
                    } else {
                      return Text(_data);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
