import 'dart:convert';
import 'dart:io';
import 'package:apart/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../utils/hive_utils.dart';
import 'package:apart/utils/session_key.dart';
import 'dart:developer';


abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext context;

  setContext(BuildContext mContext) {
    context = mContext;
  }

  initView() {}

  disposeView() {}
  static ProgressDialog progressDialog = ProgressDialog();

  call({String host = "api.systeqindia.in",
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? params,
    Map<String, String>? headers,
    Method method = Method.get,
    bool isShowLoader = true,
    required Function(int statusCode, String data) onSuccess}) {
    if (isShowLoader) {
      progressDialog.showProgressDialog(context);
    }
    var url = Uri.http(host, "api/$path", queryParameters);
    log(url.toString());
    ////////
    var request = http.Request(method.value, url);
    print("PARAM::${params.toString()}");
    request.bodyFields = params ?? {};
    // request.body = jsonEncode(params);
    if (headers != null) {
      headers.putIfAbsent("content-type", () => "application/x-www-form-urlencoded");
      request.headers.addAll(headers);
    } else {
      Map<String, String> defaultHeader = {
        'content-type': "application/x-www-form-urlencoded"
      };
      request.headers.addAll(defaultHeader);
    }
    if(HiveUtils.getSession<String>(SessionKey.token,defaultValue:"").isNotEmpty){
      request.headers.putIfAbsent("Authorization", () =>"Bearer ${HiveUtils.getSession<String>(SessionKey.token,defaultValue:"")}" );
    }
    request.send().then((response) {
      if (isShowLoader) {
        progressDialog.dismissProgressDialog(context);
      }
      response.stream.bytesToString().then((data) {
        log("RES:::$data");
        log("RES_CODE:::${response.statusCode}");
        if (response.statusCode < 400) {
          onSuccess(response.statusCode, data);
        } else if(response.statusCode == 422){
          Map object = jsonDecode(data);
         if (object['message'] != null) {
            Fluttertoast.showToast(
              backgroundColor:Colors.red.shade400,
              msg: object['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
            );
          }
        }else {
          Fluttertoast.showToast(
            msg: jsonDecode(data)['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
          );
        }
      });
    });
  }


  callMultiPart({String host = "api.systeqindia.in",
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? params,
    Map<String, String>? headers,
    Method method = Method.get,
    File? file,

    String fileKey = "",
    bool isShowLoader = true,
    required Function(int statusCode, String data) onSuccess}) {
    if (isShowLoader) {
      progressDialog.showProgressDialog(context);
    }
    var url = Uri.http(host, "lelemall/index.php/api/$path", queryParameters);
    log(url.toString());
    ////////
    var request = http.MultipartRequest(method.value, url);
    print("PARAM::${params.toString()}");
    request.fields.addAll(params ?? {});
    if(file != null) {
      request.files.add(
        http.MultipartFile(
          fileKey,
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path.split('/').last,
        ),
      );
    }
    if (headers != null) {
      headers.putIfAbsent("content-type", () => "application/x-www-form-urlencoded");
      request.headers.addAll(headers);
    } else {
      Map<String, String> defaultHeader = {
        'content-type': "application/x-www-form-urlencoded"
      };
      request.headers.addAll(defaultHeader);
    }
    if(HiveUtils.getSession<String>(SessionKey.token,defaultValue:"").isNotEmpty){
      request.headers.putIfAbsent("Authorization", () => HiveUtils.getSession<String>(SessionKey.token,defaultValue:""));
    }
    request.send().then((response) {
      if (isShowLoader) {
        progressDialog.dismissProgressDialog(context);
      }
      response.stream.bytesToString().then((data) {
        log("RES:::$data");
        if (response.statusCode < 400) {
          onSuccess(response.statusCode, data);
        }else if(response.statusCode == 422){
          Map object = jsonDecode(data);
          if (object['errors'] != null) {
            object['errors'].forEach((v) {
              Fluttertoast.showToast(
                msg: v,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            });
          }
        } else {
          Fluttertoast.showToast(
            msg: jsonDecode(data)['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
          );
        }
      });
    });
  }
}



enum Method { post, get, delete, patch }

extension MethodValue on Method {
  String get value {
    switch (this) {
      case Method.post:
        return 'POST';
      case Method.get:
        return 'GET';
      case Method.delete:
        return 'DELETE';
      case Method.patch:
        return 'PATCH';
      default:
        return "";
    }
  }
}