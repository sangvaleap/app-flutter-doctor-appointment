import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/cart.dart';
import 'package:doctor_app/ui/apps/food_delivery/detail_food.dart';
import 'package:doctor_app/ui/apps/food_delivery/detail_restaurant.dart';
import 'package:doctor_app/ui/apps/food_delivery/search_address.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class ReusableWidget {
  // initialize global function
  final _globalFunction = GlobalFunction();

  PreferredSizeWidget bottomAppBar() {
    return PreferredSize(
        child: Container(
          color: Colors.grey[100],
          height: 1.0,
        ),
        preferredSize: Size.fromHeight(1.0));
  }

  Widget fabCart(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartPage()));
      },
      child: Stack(
        children: [
          Icon(Icons.shopping_bag_outlined, color: BLACK21, size: 42),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(14),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
    );
  }

  Widget createDefaultLabel(context, String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
          color: SOFT_BLUE, borderRadius: BorderRadius.circular(2)),
      child: Row(
        children: [
          Text(text, style: TextStyle(color: Colors.white, fontSize: 13)),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.done, color: Colors.white, size: 11)
        ],
      ),
    );
  }

  Widget buildHorizontalListCard(context, data) {
    final double imageWidth = (MediaQuery.of(context).size.width / 2.3);
    final double imageheight = (MediaQuery.of(context).size.width / 3.07);
    return Container(
      width: imageWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailRestaurantPage()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(6)),
                  child: buildCacheNetworkImage(
                      width: imageWidth, height: imageheight, url: data.image)),
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 36,
                      child: Text(data.name,
                          style: GlobalStyle.cardTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: ASSENT_COLOR, size: 16),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(data.location,
                              style: GlobalStyle.textPromo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    data.promo != ''
                        ? Row(
                            children: [
                              Icon(Icons.attach_money_sharp,
                                  color: ASSENT_COLOR, size: 16),
                              SizedBox(width: 4),
                              Flexible(
                                child: Text(data.promo,
                                    style: GlobalStyle.textPromo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRestaurantList(context, index, data) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailRestaurantPage()));
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: buildCacheNetworkImage(
                        width: boxImageSize,
                        height: boxImageSize,
                        url: data[index].image)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].name + ' - ' + data[index].location,
                        style: GlobalStyle.textRestaurantNameBig,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),
                      Text(
                        data[index].tag,
                        style: GlobalStyle.textTag,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 15),
                          SizedBox(width: 2),
                          Text(data[index].rating.toString(),
                              style: GlobalStyle.textRatingDistances),
                          SizedBox(width: 6),
                          Icon(Icons.location_pin,
                              color: ASSENT_COLOR, size: 15),
                          SizedBox(width: 2),
                          Text(data[index].distance.toString() + ' miles',
                              style: GlobalStyle.textRatingDistances),
                        ],
                      ),
                      SizedBox(height: 6),
                      data[index].promo != ''
                          ? Row(
                              children: [
                                Icon(Icons.local_offer_outlined,
                                    color: ASSENT_COLOR, size: 16),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    data[index].promo,
                                    style: GlobalStyle.textPromo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        (index == data.length - 1)
            ? Wrap()
            : Divider(
                height: 0,
                color: Colors.grey[400],
              )
      ],
    );
  }

  Widget buildFoodList(context, index, data) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailRestaurantPage()));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailFoodPage()));
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: buildCacheNetworkImage(
                        width: boxImageSize,
                        height: boxImageSize,
                        url: data[index].image)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index].name,
                          style: GlobalStyle.textRestaurantNameBig,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 6),
                      Text(
                          data[index].restaurantName +
                              ' - ' +
                              data[index].location,
                          style: GlobalStyle.textRestaurantNameNormal,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 15),
                          SizedBox(width: 2),
                          Text(data[index].rating.toString(),
                              style: GlobalStyle.textRatingDistances),
                          SizedBox(width: 6),
                          Icon(Icons.location_pin,
                              color: ASSENT_COLOR, size: 15),
                          SizedBox(width: 2),
                          Text(data[index].distance.toString() + ' miles',
                              style: GlobalStyle.textRatingDistances),
                        ],
                      ),
                      SizedBox(height: 12),
                      data[index].discount != 0
                          ? Text(
                              '\$ ' +
                                  _globalFunction.removeDecimalZeroFormat(
                                      data[index].price),
                              style: GlobalStyle.textPriceLineThrough)
                          : SizedBox.shrink(),
                      Text(
                          '\$ ' +
                              _globalFunction.removeDecimalZeroFormat(
                                  ((100 - data[index].discount) *
                                      data[index].price /
                                      100)),
                          style: GlobalStyle.textPrice),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        (index == data.length - 1)
            ? Wrap()
            : Divider(
                height: 0,
                color: Colors.grey[400],
              )
      ],
    );
  }

  Widget buildFoodDetailList(context, index, data) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailFoodPage()));
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: buildCacheNetworkImage(
                        width: boxImageSize,
                        height: boxImageSize,
                        url: data[index].image)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(data[index].name,
                                style: GlobalStyle.restaurantFoodTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                              '\$ ' +
                                  _globalFunction.removeDecimalZeroFormat(
                                      ((100 - data[index].discount) *
                                          data[index].price /
                                          100)),
                              style: GlobalStyle.restaurantFoodPrice),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis.',
                          style: GlobalStyle.restaurantFoodDesc,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        (index == data.length - 1)
            ? Wrap()
            : Divider(
                height: 0,
                color: Colors.grey[400],
              )
      ],
    );
  }

  Widget showPopup(
      address, addressData, Function(String newAddress) changeAddress) {
    // must use StateSetter to update data between main screen and popup.
    // if use default setState, the data will not update
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter mystate) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Address List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: List.generate(addressData.length, (index) {
                return Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.pop(context);
                        changeAddress(addressData[index]);
                      },
                      child: addressData[index] == address
                          ? Row(
                              children: [
                                Text(addressData[index],
                                    style: TextStyle(
                                        color: BLACK55, fontSize: 16)),
                                Spacer(),
                                createDefaultLabel(context, 'Current'),
                              ],
                            )
                          : Align(
                              alignment: Alignment.topLeft,
                              child: Text(addressData[index],
                                  style:
                                      TextStyle(color: BLACK55, fontSize: 16)),
                            ),
                    ),
                    Divider(
                      height: 32,
                      color: Colors.grey[400],
                    ),
                    addressData.length == index + 1
                        ? SizedBox(
                            width: double.maxFinite,
                            child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchAddressPage()));
                                },
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                    side: MaterialStateProperty.all(
                                      BorderSide(
                                          color: PRIMARY_COLOR, width: 1.0),
                                    )),
                                child: Text(
                                  'Add New Address',
                                  style: TextStyle(
                                      color: PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                  textAlign: TextAlign.center,
                                )),
                          )
                        : SizedBox.shrink(),
                  ],
                );
              }),
            ),
          ),
        ],
      );
    });
  }

  Widget deliveryInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            'Delivery Information',
            style: GlobalStyle.deliveryInformationTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: SOFT_BLUE),
                    child: Center(
                        child: Icon(Icons.restaurant,
                            size: 12, color: Colors.white)),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text('M3GC+C2 Brooklyn, New York, United States',
                        style: GlobalStyle.deliveryInformationAddress,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
              SizedBox(height: 4),
              Container(
                  margin: EdgeInsets.only(left: 11),
                  width: 1,
                  height: 12,
                  color: SOFT_GREY),
              SizedBox(height: 2),
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: Center(
                        child: Icon(Icons.location_pin,
                            size: 24, color: ASSENT_COLOR)),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text('Home Address',
                        style: GlobalStyle.deliveryInformationAddress,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              Text('Note to driver',
                  style: GlobalStyle.deliveryInformationNoteTitle),
              SizedBox(height: 4),
              Text('Meet me at the car park',
                  style: GlobalStyle.deliveryInformationNoteValue)
            ],
          ),
        )
      ],
    );
  }

  Widget divider1() {
    return Container(
      height: 8,
      color: Colors.grey[100],
    );
  }

  Widget divider2() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        height: 32,
        color: Colors.grey[400],
      ),
    );
  }

  Widget divider3() {
    return Divider(
      height: 32,
      color: Colors.grey[400],
    );
  }
}
