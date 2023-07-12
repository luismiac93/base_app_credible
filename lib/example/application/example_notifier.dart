import 'package:base_app/example/infrastructure/example_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/example/application/example_state.dart';

///Example notifier
class ExampleNotifier extends StateNotifier<ExampleState> {
  /// Constructor
  ExampleNotifier({required this.exampleRepository})
      : super(const ExampleState.initial());

  ///Repository Example
  final ExampleRepository exampleRepository;

  ///Get list of the Character
  Future<void> getExample() async {
    state = const ExampleState.loading();

    ///Get all Example to the user country
    final result = await exampleRepository.getCharacters();

    state = result.fold(
      (error) => ExampleState.error(error),
      (characters) => ExampleState.data(characters: characters),
    );
  }
}
