import 'package:flutter/material.dart';
import 'package:gogrocy/core/models/ProductsByCity.dart';
import 'package:gogrocy/core/models/category_product_list_arguments.dart';
import 'package:gogrocy/core/models/order_details_arguments.dart';
import 'package:gogrocy/core/models/sign_up_arguments.dart';
import 'package:gogrocy/ui/shared/routeTransitions/slide_left.dart';
import 'package:gogrocy/ui/views/about.dart';
import 'package:gogrocy/ui/views/address_view.dart';
import 'package:gogrocy/ui/views/all_products_list.dart';
import 'package:gogrocy/ui/views/category/category_product_view.dart';
import 'package:gogrocy/ui/views/orders/order_details_view.dart';
import 'package:gogrocy/ui/views/city_selection.dart';
import 'package:gogrocy/ui/views/orders/orders.dart';
import 'package:gogrocy/ui/views/privacy_policy.dart';
import 'package:gogrocy/ui/views/product_detail_view.dart';
import 'package:gogrocy/ui/views/search_view.dart';
import 'package:gogrocy/ui/views/signup_view.dart';
import 'package:gogrocy/ui/views/landing_page.dart';
import 'package:gogrocy/ui/views/login_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoginView());
    case 'city':
      return MaterialPageRoute(builder: (context) => CitySelectionView());
    case 'home':
      return MaterialPageRoute(builder: (context) => HomePageView());
    case 'login':
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return LoginView();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    case 'awesome':
      SignUpArguments args = settings.arguments;
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return SignUpView(
            mobile: args.mobile,
            countryCode: args.countryCode,
          );
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    case 'product':
      Result product = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ProductDetailView(product));
    case 'category':
      CategoryProductListArgument categoryProductListArgument =
          settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ProductCategoryView(
                categoryId: categoryProductListArgument.categoryId,
                categoryTitle: categoryProductListArgument.categoryTitle,
              ));
    case 'allProducts':
      return MaterialPageRoute(builder: (context) => AllProductsView());
    case 'orders':
      return SlideLeftRoute(page: OrderView());
    case 'orderDetails':
      OrderDetailsArguments orderDetailsArguments = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => OrderDetailsView(
                orders: orderDetailsArguments.orders,
                index: orderDetailsArguments.index,
              ));
    case 'web':
      String initialUrl = settings.arguments;
      return SlideLeftRoute(page: CustomWebView(initialUrl));
    case 'address':
      return SlideLeftRoute(page: AddressView());
    case 'about':
      return SlideLeftRoute(page: AboutView());
    case 'search':
      return MaterialPageRoute(builder: (context) => SearchView());
    case 'productToCart':
      return MaterialPageRoute(builder: (context) => HomePageView(startingPage: 0));
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
