import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/infrastructure/core_repository.dart';
import '/home/application/websites_state.dart';

///Websites notifier
class WebsitiesNotifier extends StateNotifier<WebsiteState> {
  /// Constructor
  WebsitiesNotifier({required this.coreRepository})
      : super(const WebsiteState.initial());

  ///Repository Websites
  final CoreRepository coreRepository;

  ///Get list of websites
  Future<void> getWebsites() async {
    state = const WebsiteState.loading();

    ///Get all Websites
    final result = await coreRepository.getWebSites();

    state = result.fold(
      (error) => WebsiteState.error(error),
      (websites) => WebsiteState.data(websites: websites),
    );
  }
}
