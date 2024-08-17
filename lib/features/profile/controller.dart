import 'dart:developer';

import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/di/global_controller/global_controller.dart';
import 'package:Transrentals/features/profile/data/models/profile_response.dart';
import 'package:Transrentals/features/profile/data/repositories/profile_repository.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  final _profileRepo = Get.find<ProfileRepository>();
  final _sharedPref = Get.find<SharedPreferenceHelper>();
  final _globalController = Get.find<GlobalController>();

  late TabController tabController;
  final currentTab = 0.obs;
  final profileModel = GetProfileModel().obs;

  final isUPIExpanded = false.obs;
  final isIMPSExpanded = false.obs;
  final isBANKTRANSFERExpanded = false.obs;

  final isUPIEditing = false.obs;
  final isIMPSEditing = false.obs;
  final isBANKTRANSFEREditing = false.obs;

  late AnimationController upiController;
  late AnimationController impsController;
  late AnimationController bankTransferController;

  //UPI
  final upiNameTextController = TextEditingController();
  final upiIDTextController = TextEditingController();

  //IMPS
  final impsNameTextController = TextEditingController();
  final impsAccNoTextController = TextEditingController();
  final impsIFSCCodeTextController = TextEditingController();
  final impsBankNameTextController = TextEditingController();
  final impsAccTypeTextController = TextEditingController().obs;

  //Bank Transfer
  final bankTransferNameTextController = TextEditingController();
  final bankTransferAccNoTextController = TextEditingController();
  final bankTransferIFSCCodeTextController = TextEditingController();
  final bankTransferBankNameTextController = TextEditingController();
  final bankTransferAccTypeTextController = TextEditingController().obs;
  final bankTransferBranchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    upiController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    impsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    bankTransferController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    tabController.addListener(() {
      log('tabController.index.round() ${tabController.index.round()}');
      currentTab.value = tabController.index.round();
    });

    _callGetProfileAPI();
  }

  @override
  void onClose() {
    super.onClose();
    upiController.dispose();
    impsController.dispose();
    bankTransferController.dispose();
    upiNameTextController.dispose();
    upiIDTextController.dispose();
    impsNameTextController.dispose();
    impsAccNoTextController.dispose();
    impsIFSCCodeTextController.dispose();
    impsBankNameTextController.dispose();
    impsAccTypeTextController.value.dispose();
    bankTransferNameTextController.dispose();
    bankTransferAccNoTextController.dispose();
    bankTransferIFSCCodeTextController.dispose();
    bankTransferBankNameTextController.dispose();
    bankTransferAccTypeTextController.value.dispose();
    bankTransferBranchTextController.dispose();
  }

  Future<void> goToEditProfile() async {
    final result = await Get.toNamed(Routes.editProfile,
        arguments: {'profileModel': profileModel.value});

    if (result != null && result == true) {
      _callGetProfileAPI();
    }
  }

  void _callGetProfileAPI() {
    _profileRepo.getProfileRequested().then((value) {
      profileModel.value = value;

      isUPIEditing.value = profileModel.value.upiDetails == null ? true : false;
      isIMPSEditing.value =
          profileModel.value.impsDetails == null ? true : false;
      isBANKTRANSFEREditing.value =
          profileModel.value.bankDetails == null ? true : false;

      _sharedPref.saveUserModel(
          _sharedPref.loggedInUser.mergeGetProfile(profileModel.value.user));
      _globalController.userModel.value = _sharedPref.loggedInUser;

      upiNameTextController.text = value.upiDetails?.name ?? '';
      upiIDTextController.text = value.upiDetails?.upiId ?? '';

      impsNameTextController.text = value.impsDetails?.name ?? '';
      impsAccNoTextController.text = value.impsDetails?.accountNo ?? '';
      impsIFSCCodeTextController.text = value.impsDetails?.ifscCode ?? '';
      impsBankNameTextController.text = value.impsDetails?.bankName ?? '';
      impsAccTypeTextController.value.text =
          value.impsDetails?.accountType ?? '';
      impsAccTypeTextController.refresh();

      bankTransferNameTextController.text = value.bankDetails?.holderName ?? '';
      bankTransferAccNoTextController.text = value.bankDetails?.accountNo ?? '';
      bankTransferIFSCCodeTextController.text =
          value.bankDetails?.ifscCode ?? '';
      bankTransferBankNameTextController.text =
          value.bankDetails?.bankName ?? '';
      bankTransferAccTypeTextController.value.text =
          value.bankDetails?.accountType ?? '';
      bankTransferBranchTextController.text = value.bankDetails?.branch ?? '';
      bankTransferAccTypeTextController.refresh();
    });
  }

  void updateUPIDetails() {
    if (upiNameTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter Name');
    } else if (upiIDTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter UPI ID');
    } else {
      final data = {
        'user_id': _sharedPref.loggedInUser.id,
        'type': '0',
        'upi_name': upiNameTextController.text,
        'upi_id': upiIDTextController.text,
      };
      _profileRepo.updateBankDetails(data).then((value) {
        upiNameTextController.clear();
        upiIDTextController.clear();
        _callGetProfileAPI();
        isUPIEditing.value = false;
        // isUPIExpanded.value = false;
        // upiController.reverse();
      });
    }
  }

  void updateIMPSDetails() {
    if (impsNameTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter Name');
    } else if (impsAccNoTextController.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please Enter Account Number');
    } else if (impsIFSCCodeTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter IFSC Code');
    } else if (impsBankNameTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter Bank Name');
    } else if (impsAccTypeTextController.value.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please Enter Account Type');
    } else {
      final data = {
        'user_id': _sharedPref.loggedInUser.id,
        'type': '1',
        'imps_name': impsNameTextController.text,
        'imps_account_no': impsAccNoTextController.text,
        'imps_ifsc_code': impsIFSCCodeTextController.text,
        'imps_bank_name': impsBankNameTextController.text,
        'imps_account_type': impsAccTypeTextController.value.text,
      };
      _profileRepo.updateBankDetails(data).then((value) {
        impsNameTextController.clear();
        impsAccNoTextController.clear();
        impsIFSCCodeTextController.clear();
        impsBankNameTextController.clear();
        impsAccTypeTextController.value.clear();
        _callGetProfileAPI();
        isIMPSEditing.value = false;
        // isIMPSExpanded.value = false;
        // impsController.reverse();
      });
    }
  }

  void updateBankTransferDetails() {
    if (bankTransferNameTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter Name');
    } else if (bankTransferAccNoTextController.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please Enter Account Number');
    } else if (bankTransferIFSCCodeTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter IFSC Code');
    } else if (bankTransferBankNameTextController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please Enter Bank Name');
    } else if (bankTransferAccTypeTextController.value.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please Enter Account Type');
    } else if (bankTransferBranchTextController.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please Enter Branch Name');
    } else {
      final data = {
        'user_id': _sharedPref.loggedInUser.id,
        'type': '2',
        'holder_name': bankTransferNameTextController.text,
        'account_no': bankTransferAccNoTextController.text,
        'ifsc_code': bankTransferIFSCCodeTextController.text,
        'bank_name': bankTransferBankNameTextController.text,
        'account_type': bankTransferAccTypeTextController.value.text,
        'branch': bankTransferBranchTextController.text,
      };
      _profileRepo.updateBankDetails(data).then((value) {
        bankTransferNameTextController.clear();
        bankTransferAccNoTextController.clear();
        bankTransferIFSCCodeTextController.clear();
        bankTransferBankNameTextController.clear();
        bankTransferAccTypeTextController.value.clear();
        bankTransferBranchTextController.clear();
        _callGetProfileAPI();
        isBANKTRANSFEREditing.value = false;
        // isBANKTRANSFERExpanded.value = false;
        // bankTransferController.reverse();
      });
    }
  }
}
