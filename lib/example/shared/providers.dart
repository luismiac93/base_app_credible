import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/infrastructure/core_repository.dart';
import '../../core/infrastructure/remote_service/core_service.dart';
import '/main.dart';
import '/core/shared/providers.dart';
import '/example/application/example_state.dart';
import '/example/application/example_notifier.dart';
import '/example/infrastructure/example_repository.dart';
import '/example/infrastructure/remote_service/example_service.dart';

/// Repository of example Service
final exampleServiceProvider = Provider(
  (ref) => ExampleService(
    ref.watch(dioProvider),
    ref.watch(appConfigProvider.state).state,
  ),
);

/// Service of core Service
final coreServiceProvider = Provider(
  (ref) => CoreService(
    ref.watch(dioProvider),
    ref.watch(appConfigProvider.state).state,
  ),
);

/// Repository of core Repository
final coreRepositoryProvider = Provider(
  (ref) => CoreRepository(ref.watch(coreServiceProvider)),
);

/// Repository of example Repository
final exampleRepositoryProvider = Provider(
  (ref) => ExampleRepository(ref.watch(exampleServiceProvider)),
);

///example notifier provider
final exampleNotifierProvider =
    StateNotifierProvider<ExampleNotifier, ExampleState>(
  (ref) => ExampleNotifier(
    exampleRepository: ref.watch(exampleRepositoryProvider),
  ),
);
