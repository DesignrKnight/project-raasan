import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogrocy/core/services/navigation_service.dart';
import 'package:gogrocy/core/services/shared_prefs.dart';
import 'package:gogrocy/service_locator.dart';
import 'package:gogrocy/ui/shared/constants.dart' as constants;

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SharedPrefsService sharedPrefsService = locator<SharedPrefsService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    constants.mediaQueryData = MediaQuery.of(context);
    return Container(
        color: Colors.white,
        width: constants.screenWidth,
        height: constants.AppBarConfig.appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => _navigationService.navigateTo('city'),
              child: Container(
                color: Colors.white,
                width: constants.screenWidth / 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Products from",
                            style: TextStyle(
                                fontSize:
                                    constants.AppBarConfig.addressTitleFontSize,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                          FutureBuilder(
                            future: sharedPrefsService.getCity(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done)
                                return SizedBox(
                                    width: 8,
                                    height: 8,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1.5,
                                      ),
                                    ));
                              else
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.location_on,color: Colors.green,size: 14,),
                                    Text(
                                      snapshot.data,
                                      style: TextStyle(
                                          fontSize: constants
                                              .AppBarConfig.addressFontSize,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: constants.screenWidth / 3,
              child: Center(
                child: Text(
                  "GOGROCY",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: constants.AppBarConfig.titleFontSize,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              width: constants.screenWidth / 3,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () => _navigationService.navigateTo("search"),
                    focusColor: Colors.black12,
                    child: Container(

                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 14.0),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _navigationService.pushCart(),
                    focusColor: Colors.black12,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: constants.AppBarConfig.searchIconPaddingRight),
                        child: Icon(Icons.shopping_cart),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
