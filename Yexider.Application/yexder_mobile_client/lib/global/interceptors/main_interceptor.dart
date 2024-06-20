import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:yexder_mobile_client/global/models/system/result.dart';

class YexiderHttpClient {
  static const String _url = "http://localhost:5000";

  static Map<String, String> _getHeaders(Map<String, String>? headers) {
    Map<String, String> combinedHeaders = {
      'Authorization': 'Bearer token',
    };

    if (headers != null) {
      combinedHeaders.addAll(headers);
    }

    return combinedHeaders;
  }

  Future<Result<http.Response>> get(String url, {Map<String, String>? headers}) async {
    try {
      return Result<http.Response>()
        .success(await http.get(Uri.parse('$_url/$url'), headers: _getHeaders(headers)));
    } catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> post(String url, Map<String, String>? headers, Object object) async {
    try {
      return Result<http.Response>()
        .success(await http.post(Uri.parse('$_url/$url'), headers: _getHeaders(headers), body: object));
    } catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> put(String url, {Map<String, String>? headers}) async {
    try {
      return Result<http.Response>()
        .success(await http.put(Uri.parse('$_url/$url'), headers: _getHeaders(headers)));
    } catch (exception) {
      return Result<http.Response>()
        .failure(exception.toString());
    }
  }

  Future<Result<http.Response>> delete(String url, {Map<String, String>? headers}) async {
    try {
      return Result<http.Response>()
        .success(await http.delete(Uri.parse('$_url/$url'), headers: _getHeaders(headers)));
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