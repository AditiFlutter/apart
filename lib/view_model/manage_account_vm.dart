import 'dart:convert';
import 'dart:io';

import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/utils/extensions/on_stream.dart';
import 'package:apart/view_model/base_vm.dart';
import 'package:apart/view_model/profile_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../Constant/app_colors.dart';
import '../model/ProfileModel.dart';
import '../utils/hive_utils.dart';
import '../utils/session_key.dart';

class ManageAcVM extends BaseViewModel{
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  var  filePath;
  final formKey = GlobalKey<FormState>();

  late ProfileVM profileVM;
  get _autoValidate => AutovalidateMode.disabled;
  var addressController = TextEditingController();
  var mobileController = TextEditingController();
  var nameController = TextEditingController();
  var _countryCode = "91";
  var _countryName = "India";
  @override
  initView() {
    profileVM = context.read<ProfileVM>();
    // nameController.text = HiveUtils.getSession<String>(SessionKey.user,
    //     defaultValue: "{}")
    //     .userModel().name ?? "";
    // emailController.text = HiveUtils.getSession<String>(SessionKey.user,
    //     defaultValue: "{}")
    //     .userModel().email ?? "";
    // mobileController.text = HiveUtils.getSession<String>(SessionKey.user,
    //     defaultValue: "{}")
    //     .userModel().phone ?? "";
    //
    return super.initView();
  }
  bool _visible =false;

  get countryName => _countryName;

  set countryName(value) {
    _countryName = value;
  }

  get countryCode => _countryCode;

  set countryCode(value) {
    _countryCode = value;
    notifyListeners();
  }
  bool get visible => _visible;

  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }

  Future<File> _cropImage(File profileImageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: profileImageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4),
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor:colorTheme,
              toolbarWidgetColor:colorWhite,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          )
        ]);
    return File(croppedFile!.path);
  }
  getImgCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if(photo != null){
      imageFile = File(photo.path);
      filePath = photo.path;
      print("file:: $filePath");
      _cropImage(File(photo.path)).then((value) async {
        print("Cropfile:: $filePath");
        // final bytes = File(photo.path).readAsBytesSync();
      });
      notifyListeners();
    }else{
      Fluttertoast.showToast( msg:'No File Selected');
    }
  }
  getImgGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      imageFile = File(image.path);
      filePath = image.path;
      print("file:: $filePath");
      print("imageFile:: $imageFile");
      print(filePath.split("image_picker").last);
      _cropImage(File(image.path)).then((value) async {
        filePath = value.path;
        print("Cropfile:: $filePath");
        // final bytes = File(image.path).readAsBytesSync();
      });
      notifyListeners();
    }else{
      Fluttertoast.showToast( msg:'No File Selected');
    }
  }

  void updateProfile() {
    callMultiPart(path: "profile", onSuccess: (statusCode, data) {
     // HiveUtils.addSession(SessionKey.userThumbPath, object['path']);
      Map object = jsonDecode(data);
      profileModel  profilemodel = profileModel.fromJson(object['data']);

      profileVM.profilemodel.user!.avatar = profilemodel.user!.avatar.toString();
      HiveUtils.addSession(SessionKey.user, jsonEncode(object['data']));
      context.pop();
    }, method: Method.post, params: {
      "address": addressController.text,
      "name": nameController.text,
    },file: filePath != null ? File(filePath):filePath,fileKey: "image");

  }

}