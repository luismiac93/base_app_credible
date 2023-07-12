import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Dio Service Dependency Injection
final dioProvider = Provider((ref) => Dio());
