import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/presentation/constants/assets_constants.dart';
import '/core/shared/providers.dart';
import '/home/application/home_provider.dart';
import '/home/presentation/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(websitiesNotifierProvider.notifier).getWebsites());
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final websitiesNotifier = ref.watch(websitiesNotifierProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(AssetsImagesConstants.user),
          ),
        ),
        title: Text('${user?.name} '),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox( height: 20,),
            websitiesNotifier.when(
              initial: () => const SizedBox(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (websites) {
                return Column(
                  children: [
                    ...websites.map((web) => WebsiteCard(url: web)).toList(),
                  ],
                );
              },
              error: (err) => const SizedBox(),
            ),
          ],
        )),
      ),
    );
  }
}
