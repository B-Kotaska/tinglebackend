import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tingle/common/api/fetch_gift_category_api.dart';
import 'package:tingle/common/function/country_services.dart';
import 'package:tingle/page/feed_page/view/feed_view.dart';

import 'package:tingle/page/message_page/view/message_view.dart';
import 'package:tingle/page/party_page/view/party_view.dart';
import 'package:tingle/page/profile_page/view/profile_view.dart';
import 'package:tingle/page/stream_page/view/stream_view.dart';
import 'package:tingle/utils/constant.dart';
import 'package:tingle/utils/internet_connection.dart';
import 'package:tingle/utils/utils.dart';

class BottomBarController extends GetxController {
  PreloadPageController preloadPageController = PreloadPageController();

  int selectedTabIndex = 0;

  List bottomBarPages = [
    const StreamView(),
    const PartyView(),
    const FeedView(),
    const MessageView(),
    const ProfileView(),
  ];

  @override
  void onInit() {
    init();

    super.onInit();
  }

  void init() async {
    FetchGiftCategoryApi.onGetGiftCategory();
    CountryService.onGetCountries();

    Utils.onGetRandomFakeImage();
  }

  void onChangeBottomBar(int index) {
    if (index != selectedTabIndex) {
      selectedTabIndex = index;
      update([AppConstant.onChangeBottomBar]);
    }
  }

  Future<void> onInitPayment() async {
    if (InternetConnection.isConnect.value) {
      Stripe.publishableKey = Utils.stripeTestPublicKey;
    }
  }
}
