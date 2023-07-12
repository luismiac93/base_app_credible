import 'package:auto_route/annotations.dart';
import 'package:base_app/example/shared/providers.dart';
import 'package:base_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends ConsumerState<RegisterScreen> {
  @override
  void initState() {
    Future.microtask(
        () => ref.read(exampleNotifierProvider.notifier).getExample());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exampleNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text("touch me"),
            ),
            Text(context.l10n.helloWorld)
          ],
        ),
      ),
    );
  }
}
