import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class DetailFoodPage extends StatefulWidget {
  @override
  _DetailFoodPageState createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

  String _size = 'regular';
  String _spicy = 'normal';
  List<String> _chickenParts = [];
  int _maxChickenParts = 2;

  bool _showAppBar = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    setupAnimateAppbar();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void setupAnimateAppbar(){
    _scrollController = ScrollController()..addListener((){
      if(_scrollController.hasClients && _scrollController.offset > (MediaQuery.of(context).size.width*3/4)-80){
        setState(() {
          _showAppBar = true;
        });
      } else {
        setState(() {
          _showAppBar = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width*3/4;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: kToolbarHeight),
            child: ListView(
              controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: [
                buildCacheNetworkImage(width: bannerWidth, height: bannerHeight, url: GLOBAL_URL+"/assets/images/apps/food_delivery/food/1.jpg"),
                _buildFoodInformation(),
                _reusableWidget.divider1(),
                _buildOptionSize(),
                _reusableWidget.divider1(),
                _buildOptionSpicy(),
                _reusableWidget.divider1(),
                _buildOptionChickenParts(),
                _reusableWidget.divider1(),
                _buildSpecialInstructions(),
              ],
            ),
          ),
          Opacity(
            opacity: _showAppBar?1:0,
            child: Container(
              height: 80,
              child: AppBar(
                iconTheme: IconThemeData(
                  color: GlobalStyle.appBarIconThemeColor,
                ),
                systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
                centerTitle: true,
                title: Text('Chicken Rice Teriyaki', style: GlobalStyle.appBarTitle),
                backgroundColor: GlobalStyle.appBarBackgroundColor,
              ),
            ),
          ),
          _buildAddToCart(),
        ],
      ),
    );
  }

  Widget _buildFoodInformation(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text('Chicken Rice Teriyaki', style: GlobalStyle.detailFoodTitle, maxLines: 2, overflow: TextOverflow.ellipsis),
              ),
              Text('\$ '+_globalFunction.removeDecimalZeroFormat(4.5), style: GlobalStyle.detailFoodPrice),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis.', style: GlobalStyle.detailFoodDesc, maxLines: 3, overflow: TextOverflow.ellipsis,)
        ),
        SizedBox(height: 16)
      ],
    );
  }

  Widget _buildOptionSize(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Size', style: GlobalStyle.detailFoodOptions),
                  SizedBox(width: 8),
                  Text('Pick 1', style: GlobalStyle.detailFoodSubOptions)
                ],
              ),
              SizedBox(height: 16),
              _radioSize(value: 'regular', primaryText: 'Regular', secondaryText: '0'),
              _reusableWidget.divider3(),
              _radioSize(value: 'large', primaryText: 'Large', secondaryText: '+ \$1'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildOptionSpicy(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Spicy', style: GlobalStyle.detailFoodOptions),
                  SizedBox(width: 8),
                  Text('Pick 1', style: GlobalStyle.detailFoodSubOptions)
                ],
              ),
              SizedBox(height: 16),
              _radioSpicy(value: 'not_spicy', primaryText: 'Not Spicy', secondaryText: '0'),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              _radioSpicy(value: 'normal', primaryText: 'Normal', secondaryText: '0'),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              _radioSpicy(value: 'hot', primaryText: 'Hot', secondaryText: '0'),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              _radioSpicy(value: 'extra_hot', primaryText: 'Extra Hot', secondaryText: '0'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildOptionChickenParts(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Chicken Parts', style: GlobalStyle.detailFoodOptions),
                  SizedBox(width: 8),
                  Text('Pick Max 2', style: GlobalStyle.detailFoodSubOptions)
                ],
              ),
              SizedBox(height: 16),
              _checboxChicken(value: 'breast', primaryText: 'Chicken Breast', secondaryText: '0'),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              _checboxChicken(value: 'thighs', primaryText: 'Chicken Thighs', secondaryText: '0'),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              _checboxChicken(value: 'wings', primaryText: 'Chicken Wings', secondaryText: '0'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSpecialInstructions(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Special Instructions', style: GlobalStyle.detailFoodOptions),
                  SizedBox(width: 8),
                  Text('Optional', style: GlobalStyle.detailFoodSubOptions)
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: SOFT_GREY, width: 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: SOFT_GREY, width: 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  hintText: 'e.g. No soy sauce please',
                  hintStyle: TextStyle(
                      color: SOFT_GREY,
                      fontSize: 14
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
                ),
                style: TextStyle(
                    color: BLACK77,
                    fontSize: 14
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _radioSize({value = 'regular', primaryText = 'Regular', secondaryText = '0'}){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        setState(() {
          _size = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1,
                  color: Colors.grey
              ),
            ),
            child: _size==value?Center(
                child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      shape: BoxShape.circle,
                    )
                )
            ):SizedBox.shrink(),
          ),
          SizedBox(width: 16),
          Text(primaryText, style: TextStyle(
              fontSize: 13,
              color: BLACK77,
              fontWeight: _size==value?FontWeight.bold:FontWeight.normal
          )),
          Spacer(),
          Text(secondaryText, style: TextStyle(
            fontSize: 13,
            color: BLACK77,
          ))
        ],
      ),
    );
  }

  Widget _radioSpicy({value = 'normal', primaryText = 'Normal', secondaryText = '0'}){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        setState(() {
          _spicy = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1,
                  color: Colors.grey
              ),
            ),
            child: _spicy==value?Center(
                child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      shape: BoxShape.circle,
                    )
                )
            ):SizedBox.shrink(),
          ),
          SizedBox(width: 16),
          Text(primaryText, style: TextStyle(
              fontSize: 13,
              color: BLACK77,
              fontWeight: _spicy==value?FontWeight.bold:FontWeight.normal
          )),
          Spacer(),
          Text(secondaryText, style: TextStyle(
            fontSize: 13,
            color: BLACK77,
          ))
        ],
      ),
    );
  }

  Widget _checboxChicken({value = 'breast', primaryText = 'Chicken Breast', secondaryText = '0'}){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        setState(() {
          if(_chickenParts.contains(value)){
            _chickenParts.remove(value);
          } else {
            if(_chickenParts.length<_maxChickenParts){
              _chickenParts.add(value);
            }
          }
        });
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: (_chickenParts.contains(value)) ? PRIMARY_COLOR : BLACK77
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(4.0)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: (_chickenParts.contains(value))
                  ? Icon(
                Icons.check,
                size: 12.0,
                color: PRIMARY_COLOR,
              ):Icon(
                Icons.check_box_outline_blank,
                size: 12.0,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16),
          Text(primaryText, style: TextStyle(
              fontSize: 13,
              color: BLACK77,
              fontWeight: (_chickenParts.contains(value))?FontWeight.bold:FontWeight.normal
          )),
          Spacer(),
          Text(secondaryText, style: TextStyle(
            fontSize: 13,
            color: BLACK77,
          ))
        ],
      ),
    );
  }

  Widget _buildAddToCart(){
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: kToolbarHeight,
          color: ASSENT_COLOR,
          child: Center(
              child: Text('Add to Cart', style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ))
          ),
        ),
      ),
    );
  }
}
