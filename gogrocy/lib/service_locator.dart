import 'package:get_it/get_it.dart';
import 'package:gogrocy/core/services/analytics_service.dart';
import 'package:gogrocy/core/services/authentication_service.dart';
import 'package:gogrocy/core/services/navigation_service.dart';
import 'package:gogrocy/core/services/shared_prefs.dart';
import 'package:gogrocy/core/viewModels/address_view_model.dart';
import 'package:gogrocy/core/viewModels/cart_view_model.dart';
import 'package:gogrocy/core/viewModels/categoty_product_view_model.dart';
import 'package:gogrocy/core/viewModels/login_model.dart';
import 'package:gogrocy/core/viewModels/product_detail_model.dart';
import 'package:gogrocy/core/viewModels/order_list_model.dart';
import 'package:gogrocy/core/viewModels/search_view_model.dart';
import 'package:gogrocy/core/viewModels/startup_view_model.dart';
import 'package:gogrocy/ui/views/address_form.dart';
import 'package:gogrocy/ui/views/city_selection.dart';
import 'package:gogrocy/ui/views/signup_view.dart';
import 'package:gogrocy/core/services/api.dart';
import 'package:gogrocy/core/services/bottom_appbar_provider.dart';
import 'package:gogrocy/core/viewModels/allProducts_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<SharedPrefsService>(() => SharedPrefsService());
  //locator.registerFactory(()=>SignUpViewModel());
  //locator.registerLazySingleton(() => AnalyticsService());
  locator.registerFactory(() => CitySelectionModel());
  locator.registerFactory<StartupViewModel>(() => StartupViewModel());
  locator.registerFactory<NavigationService>(() => NavigationService());
  locator.registerFactory<AuthenticationService>(() => AuthenticationService());
  locator.registerLazySingleton(() => SignUpView());
  locator.registerFactory<LoginModel>(() => LoginModel());
  locator.registerLazySingleton(() => Apis());
  locator.registerFactory(() => AllProductsModel());
  locator.registerFactory(() => CategoryProductsViewModel());
  locator.registerFactory(() => OrderViewModel());
  locator.registerFactory<ProductDetailModel>(() => ProductDetailModel());
  locator.registerFactory(() => CartViewModel());
  locator.registerFactory(() => SearchViewModel());
  locator.registerFactory(() => BottomNavBarProvider());
  locator.registerFactory(() => AddressViewModel());
  locator.registerFactory(() => AddressFormModel());
}
