import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:yexder_mobile_client/global/models/system/result.dart';

enum YexiderContentTypes {
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
  static const String _baseUrl = "http://10.0.2.2:5000"; // Web: "http://localhost:5000" | Emulator: "http://10.0.2.2:5000"

  static Map<String, String> _getHeaders(Map<String, String>? headers, YexiderContentTypes? contentType) {
    Map<String, String> combinedHeaders = {
      'Authorization': 'Bearer token',
      'Content-Type': contentType != null ? contentType.value : YexiderContentTypes.applicationJson.value
    };

    if (headers != null) {
      combinedHeaders.addAll(headers);
    }

    return combinedHeaders;
  }

  Future<Result<http.Response>> get(String url, {Map<String, String>? headers}) async {
    try {
      return Result<http.Response>()
        .success(await http.get(Uri.parse(_baseUrl + url), headers: _getHeaders(headers, null)));
    } catch (exception) {
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
      return Result<http.Response>()
        .success(await http.post(Uri.parse(_baseUrl + url), headers: _getHeaders(headers, contentType), body: object));
    } catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> put(String url, {Map<String, String>? headers}) async {
    try {
      return Result<http.Response>()
        .success(await http.put(Uri.parse(_baseUrl + url), headers: _getHeaders(headers, null)));
    } catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> delete(String url, {Map<String, String>? headers}) async {
    try {
      return Result<http.Response>()
        .success(await http.delete(Uri.parse(_baseUrl + url), headers: _getHeaders(headers, null)));
    } catch (exception) {
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