import 'package:doctor_app/model/feature/product_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DestinationPage extends StatefulWidget {
  final ProductModel productData;

  const DestinationPage({Key? key, required this.productData}) : super(key: key);

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xFFaaaaaa);

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
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Destination Page',
                  desc: 'This is the destination page from auto complete page'
              ),
              _buildProduct(),
            ],
          ),
        )
    );
  }

  Widget _buildProduct(){
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Container(
      margin: EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius:
                BorderRadius.all(Radius.circular(4)),
                child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: widget.productData.image)),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productData.name,
                    style: TextStyle(
                        fontSize: 13,
                        color: _color1
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(widget.productData.price),
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,
                            color: _color2, size: 12),
                        Text(' '+widget.productData.location,
                            style: TextStyle(
                                fontSize: 11,
                                color: _color2
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        _globalWidget.createRatingBar(rating: widget.productData.rating, size: 12),
                        Text('('+widget.productData.review.toString()+')', style: TextStyle(
                            fontSize: 11,
                            color: _color2
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(widget.productData.sale.toString()+' Sale',
                        style: TextStyle(
                            fontSize: 11,
                            color: _color2
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
