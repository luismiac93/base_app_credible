import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/presentation/widgets/custom_background.dart';
import '/home/application/home_provider.dart';
import '/core/domain/user.dart';
import '/core/shared/providers.dart';
import '/register/application/register_provider.dart';
import '/register/application/register_state.dart';
import '/core/presentation/routes/app_router.dart';
import '/core/presentation/widgets/custom_text_form_field.dart';
import '/l10n/l10n.dart';

@RoutePage()
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;

    ref.listen<RegisterState>(registerNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          data: (user) {
            ref.read(userProvider.notifier).state = user;
            context.replaceRoute(const HomeRoute());
          },
          error: (error) {
            // TODO: Management ui error
            print(error);
          });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: CustomPaint(
                painter: CustomBackgroundPainter(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    context.l10n.welcome,
                    style: textStyle.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.register,
                    style: textStyle.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 64),
                  Column(
                    children: [
                      CustomTextFormField(
                        hintText: context.l10n.name,
                        onChanged: (value) {
                          ref.read(nameProvider.notifier).state = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        textInputType: TextInputType.emailAddress,
                        hintText: context.l10n.email,
                        onChanged: (value) {
                          ref.read(emailProvider.notifier).state = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        obscureText: true,
                        hintText: context.l10n.password,
                        onChanged: (value) {
                          ref.read(passwordProvider.notifier).state = value;
                        },
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: ref.watch(nameProvider).isEmpty ||
                                ref.watch(emailProvider).isEmpty ||
                                ref.watch(passwordProvider).isEmpty ||
                                ref.watch(passwordProvider).length < 3
                            ? null
                            : () {
                                final name = ref.read(nameProvider);
                                final email = ref.read(emailProvider);
                                final password = ref.read(passwordProvider);
                                final user = User(
                                    name: name,
                                    email: email,
                                    password: password);
                                ref
                                    .read(registerNotifierProvider.notifier)
                                    .register(user);
                              },
                        child: Text(context.l10n.register),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.l10n.youHaveAnAccountYet),
                      TextButton(
                        onPressed: () {
                          context.pushRoute(const LoginRoute());
                        },
                        child: Text(
                          context.l10n.loginHere,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
