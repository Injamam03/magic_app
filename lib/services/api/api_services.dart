import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../utils/error_log.dart';
import '../storage_services/get_storage_services.dart';
import 'api.dart';

class ApiServices {
  ///////////////
  ApiServices._privateConstructor();
  static final ApiServices _instance = ApiServices._privateConstructor();
  static ApiServices get instance => _instance;
  //////////  object
  final _api = AppApi();
  final _storageServices = StorageServices.instance;
  Future<dynamic> putServices({
    required String url,
    dynamic body,
    int statusCode = 200,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _api.sendRequest.put(
        url,
        data: body,
        queryParameters: query,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      // AppSnackBar.instance.error("Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await _storageServices.storageClear();
          // AppRoute.instance.replaceNamed(AppRoutes.instance.signInPage);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          // AppSnackBar.instance.error("${e.response?.data["message"]}");
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== this is api post service class ==================================================================

  Future<dynamic> postServices({
    required String url,
    dynamic body,
    int statusCodeStart = 200,
    int statusCodeEnd = 299,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final dynamic response = await AppApi().sendRequest.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      if (response.statusCode >= statusCodeStart &&
          response.statusCode <= statusCodeEnd) {
        return response.data;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      // AppSnackBar.instance.error("Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await _storageServices.storageClear();
          // AppRoute.instance.replaceNamed(AppRoutes.instance.signInPage);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          // AppSnackBar.instance.error("${e.response?.data["message"]}");
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== this is api get service class ==================================================================
  Future<dynamic> getServices(
    String url, {
    int statusCode = 200,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await _api.sendRequest.get(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      // AppSnackBar.instance.error("Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await _storageServices.storageClear();
          // AppRoute.instance.replaceNamed(AppRoutes.instance.signInPage);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          // AppSnackBar.instance.error("${e.response?.data["message"]}");
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }
  // ============== this is api patch service class ==================================================================

  Future<dynamic> patchServices({
    required String url,
    Object? body,
    int statusCode = 200,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await _api.sendRequest.patch(
        url,
        data: body,
        queryParameters: query,
        options: options,
      );

      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        // AppSnackBar.instance.error("Unexpected response: ${response.statusCode} ${response.statusMessage}");
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      // AppSnackBar.instance.error("Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await _storageServices.storageClear();
          // AppRoute.instance.replaceNamed(AppRoutes.instance.signInPage);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          // AppSnackBar.instance.error("${e.response?.data["message"]}");
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== this is api delete service class ==================================================================
  Future<dynamic> deleteServices({
    required String url,
    Object? body,
    int statusCode = 200,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await _api.sendRequest.delete(
        url,
        data: body,
        queryParameters: query,
        options: options,
      );

      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        // AppSnackBar.instance.error("Unexpected response: ${response.statusCode} ${response.statusMessage}");
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      // AppSnackBar.instance.error("Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await _storageServices.storageClear();
          // AppRoute.instance.replaceNamed(AppRoutes.instance.signInPage);
        }

        if (e.response?.data["message"].runtimeType != Null) {
          // AppSnackBar.instance.error("${e.response?.data["message"]}");
        }

        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }

  // ============== this is api multipart service class ==================================================================

  Future<dynamic> multipartServices({
    required String url,
    Map<String, dynamic>? body,
    List<String>? filePath,
    List<String>? fileKey,
    int statusCodeStart = 200,
    int statusCodeEnd = 299,
  }) async {
    try {
      // Create FormData object
      FormData formData = FormData();

      // Add simple text fields to FormData
      if (body != null) {
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      // Add files to FormData
      if (filePath != null &&
          fileKey != null &&
          filePath.length == fileKey.length) {
        for (int i = 0; i < filePath.length; i++) {
          File file = File(filePath[i]);
          if (file.existsSync()) {
            formData.files.add(
              MapEntry(
                fileKey[i],
                await MultipartFile.fromFile(
                  file.path,
                  filename: file.path.split('/').last,
                ),
              ),
            );
          }
        }
      }

      // Send Request using POST method
      final dynamic response = await AppApi().sendRequest.post(
        url,
        data: formData,
      );

      if (response.statusCode >= statusCodeStart &&
          response.statusCode <= statusCodeEnd) {
        return response.data;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      errorLog('api socket exception', e);
      return null;
    } on TimeoutException catch (e) {
      errorLog('api time out exception', e);
      return null;
    } on DioException catch (e) {
      if (e.response.runtimeType != Null) {
        if (e.response?.statusCode == 401) {
          await _storageServices.storageClear();
        }
        return null;
      }
      errorLog('api dio exception', e);
      return null;
    } catch (e) {
      errorLog('api exception', e);
      return null;
    }
  }
}
