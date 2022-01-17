import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline5Page extends StatefulWidget {
  @override
  _Timeline5PageState createState() => _Timeline5PageState();
}

class _Timeline5PageState extends State<Timeline5Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: Text(
            'SDLC - Waterfall Model',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text('Waterfall Model', textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w500, color: Colors.lightBlue
              )),
              SizedBox(height: 32),
              _timeline(position:'first', step: 1, title: 'Requirement\nGathering & Analysis', desc: 'All possible requirements of the system to be developed are captured in this phase and documented in a requirement specification document.'),
              _timeline(step: 2, title: 'System Design', desc: 'The requirement specifications from first phase are studied in this phase and the system design is prepared. This system design helps in specifying hardware and system requirements and helps in defining the overall system architecture.'),
              _timeline(step: 3, title: 'Implementation', desc: 'With inputs from the system design, the system is first developed in small programs called units, which are integrated in the next phase. Each unit is developed and tested for its functionality, which is referred to as Unit Testing.'),
              _timeline(step: 4, title: 'Integration and Testing', desc: 'All the units developed in the implementation phase are integrated into a system after testing of each unit. Post integration the entire system is tested for any faults and failures.'),
              _timeline(step: 5, title: 'Deployment of system', desc: 'Once the functional and non-functional testing is done; the product is deployed in the customer environment or released into the market.'),
              _timeline(position:'last', step: 6, title: 'Maintenance', desc: 'There are some issues which come up in the client environment. To fix those issues, patches are released. Also to enhance the product some better versions are released. Maintenance is done to deliver these changes in the customer environment.')
            ],
          ),
        )
    );
  }

  Widget _timeline({required int step, required String title, required String desc, String position='mid'}){
    return TimelineTile(
      isFirst: position=='first'?true:false,
      isLast: position=='last'?true:false,
      indicatorStyle: IndicatorStyle(
          indicatorXY: 0.5,
          width: 40,
          height: 40,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(
                  Radius.circular(40.0)
              ),
            ),
            child: Center(
                child: Text(step.toString(), style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold
                ))
            ),
          )
      ),
      beforeLineStyle: LineStyle(
          color: Colors.grey[400]!,
          thickness: 2
      ),
      afterLineStyle: LineStyle(
          color: Colors.grey[400]!,
          thickness: 2
      ),
      alignment: TimelineAlign.center,
      startChild: step.isOdd?Container(
          margin: EdgeInsets.only(top:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, textAlign: TextAlign.start, style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18
              )),
              SizedBox(
                height: 16,
              ),
              Text(desc, textAlign: TextAlign.start, style: TextStyle(
                  fontSize: 14
              )),
              SizedBox(
                height: 24,
              ),
            ],
          )
      ):null,
      endChild: step.isEven?Container(
          margin: EdgeInsets.only(top:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title, textAlign: TextAlign.end, style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18
              )),
              SizedBox(
                height: 16,
              ),
              Text(desc, textAlign: TextAlign.end, style: TextStyle(
                  fontSize: 14
              )),
              SizedBox(
                height: 24,
              ),
            ],
          )
      ):null,
    );
  }
}
