import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/model/apps/ecommerce/order_list_model.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/order/order_detail.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

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
    final double boxImageSize = (MediaQuery.of(context).size.width / 6);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            'Order List',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView.builder(
          itemCount: orderListData.length,
          // Add one more item for progress indicator
          padding: EdgeInsets.symmetric(vertical: 0),
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _buildOrderListCard(index, boxImageSize);
          },
        )
    );
  }

  Widget _buildOrderListCard(index, boxImageSize){
    return Container(
      margin: EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailPage()));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  child: Text(orderListData[index].status, style: TextStyle(
                      color: SOFT_BLUE, fontSize: 12
                  )),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey[400],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                  child: Text(orderListData[index].date, style: TextStyle(
                      fontSize:12, color: Colors.grey[400]
                  )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
                  child: Text(orderListData[index].invoice, style: TextStyle(
                      fontSize:14, fontWeight: FontWeight.bold
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: orderListData[index].image)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              orderListData[index].name,
                              style: GlobalStyle.productName.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text('+2 other product', style: GlobalStyle.shoppingCartOtherProduct.copyWith(color: Colors.grey[400]))
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey[400],
                ),
                Container(
                    margin: EdgeInsets.all(12),
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Total Payment', style: TextStyle(
                            fontSize: 12
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text('\$'+_globalFunction.removeDecimalZeroFormat(orderListData[index].payment), style: GlobalStyle.productPrice),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
