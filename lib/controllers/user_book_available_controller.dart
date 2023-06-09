import 'dart:developer';

import 'package:get/get.dart';
import 'package:app_swaplivros/controllers/book_controller.dart';
import 'package:app_swaplivros/models/availability.dart';
import 'package:app_swaplivros/models/user.dart';
import 'package:app_swaplivros/utils/state_machine.dart';

class UserBookAvailableController extends GetxController {
  final User user;

  final BookController _bookController = Get.find<BookController>();

  UserBookAvailableController({required this.user});

  RxList<Availability> availabilityList = <Availability>[].obs;

  Rx<FetchState> fetchState = FetchState.loading.obs;

  @override
  void onInit() {
    super.onInit();
    _getAvailableBooksFromUser();
  }

  _getAvailableBooksFromUser() {
    _bookController.getAvailableBooksFromUser(user).then((value) {
      availabilityList.value = value;
      inspect(value);
    }).catchError((e) {
      printError(info: e.toString());
      fetchState.value = FetchState.error;
    }).whenComplete(() {
      fetchState.value = FetchState.success;
    });
  }
}
