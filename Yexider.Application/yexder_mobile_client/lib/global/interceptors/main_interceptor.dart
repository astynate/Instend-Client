import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/result.dart';

enum YexiderContentTypes {
  none(''),

  textPlain('text/plain'),
  textHtml('text/html'),
  textCss('text/css'),
  textJavascript('text/javascript'),

  applicationJson('application/json'),
  applicationXml('application/xml'),
  applicationXWwwFormUrlencoded('application/x-www-form-urlencoded'),
  applicationJavascript('application/javascript'),
  applicationPdf('application/pdf'),
  applicationZip('application/zip'),

  multipartFormData('multipart/form-data'),
  multipartByteranges('multipart/byteranges'),

  imageGif('image/gif'),
  imageJpeg('image/jpeg'),
  imagePng('image/png'),
  imageTiff('image/tiff'),
  imageSvgXml('image/svg+xml'),

  audioMpeg('audio/mpeg'),
  audioOgg('audio/ogg'),
  audioWav('audio/wav'),

  videoMpeg('video/mpeg'),
  videoMp4('video/mp4'),
  videoQuicktime('video/quicktime'),
  videoXMsWmv('video/x-ms-wmv'),
  videoXFlv('video/x-flv'),
  videoWebm('video/webm'),

  applicationOctetStream('application/octet-stream'),
  applicationVndMsExcel('application/vnd.ms-excel'),
  applicationVndMsPowerpoint('application/vnd.ms-powerpoint'),
  applicationMsword('application/msword'),
  applicationVndOpenxmlformatsOfficedocumentSpreadsheetmlSheet('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),
  applicationVndOpenxmlformatsOfficedocumentPresentationmlPresentation('application/vnd.openxmlformats-officedocument.presentationml.presentation'),
  applicationVndOpenxmlformatsOfficedocumentWordprocessingmlDocument('application/vnd.openxmlformats-officedocument.wordprocessingml.document');

  final String value;
  const YexiderContentTypes(this.value);
}

class YexiderHttpClient {
  static const int _timeOut = 7;
  static const String _baseUrl = "http://10.0.2.2:5000"; // Web: "http://localhost:5000" | Emulator: "http://10.0.2.2:5000"

  static Future<Map<String, String>> _getHeaders(Map<String, String>? headers, YexiderContentTypes? contentType) async {
    Map<String, String> combinedHeaders = {
      'Authorization': 'Bearer ${await secureStorage.read(key: 'system_access_token')}',
      'Content-Type': contentType != null ? contentType.value : YexiderContentTypes.applicationJson.value,
      'Cookie:': 'system_refresh_token=${await secureStorage.read(key: 'system_refresh_token')}'
    };

    if (contentType == YexiderContentTypes.none) {
      combinedHeaders.remove('Content-Type');
    }

    if (headers != null) {
      combinedHeaders.addAll(headers);
    }

    return combinedHeaders;
  }

  Future<Result<http.Response>> get(String url, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(Uri.parse(_baseUrl + url), headers: await _getHeaders(headers, null))
        .timeout(const Duration(seconds: _timeOut));

      return Result<http.Response>().success(response); 
    } 
    catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> post(
    String url, {
    Map<String, String>? headers,
    Object? object,
    YexiderContentTypes? contentType,
  }) async {
    try {
      http.Response response = await http.post(Uri.parse(_baseUrl + url), headers: await _getHeaders(headers, contentType), body: object)
        .timeout(const Duration(seconds: _timeOut));

      return Result<http.Response>().success(response); 
    }
    catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> put(String url, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.put(Uri.parse(_baseUrl + url), headers: await  _getHeaders(headers, null))
        .timeout(const Duration(seconds: _timeOut));

      return Result<http.Response>().success(response); 
    } 
    catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> delete(String url, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.delete(Uri.parse(_baseUrl + url), headers: await  _getHeaders(headers, null))
        .timeout(const Duration(seconds: _timeOut));

      return Result<http.Response>().success(response); 
    } 
    catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }
}

/// ============================================================
/// 
/// Yexider Http Client for exchange data 
/// in Yexider .NET Server data format.
/// 
/// To use: 
///   1) import httpClient;
///   2) use methonds starts with send.
/// 
/// Attention!
/// 
/// Don't use classic get, post, put, delete
/// methods of http.BaseClient.
/// 
/// (c) Andreev S, 2024 — Minsk, Belarus.
/// 
/// ============================================================ 
YexiderHttpClient httpClient = YexiderHttpClient();