import 'package:http/http.dart' as http;

// Axios instance from Yexider React Client.
// Created to add JWT-AUTH data to Yexider .NET Server requests.
// To use just import instance.

final interceptor = http.Client();
const String url = "http://localhost:5000";

// © Andreev S, 2024 — Minsk, Belarus.