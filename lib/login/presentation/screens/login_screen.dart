import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/presentation/widgets/widgets.dart';
import '/core/presentation/routes/app_router.dart';
import '/home/application/home_provider.dart';
import '/core/domain/user.dart';
import '/core/shared/providers.dart';
import '/login/application/login_state.dart';
import '/l10n/l10n.dart';
import '/login/application/login_provider.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    ref.listen<LoginState>(loginNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          data: (user) {
            ref.read(userProvider.notifier).state = user;
            context.replaceRoute(const HomeRoute());
          },
          error: (error) {
            // TODO: Management ui error advice
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
                    style: textStyle.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.login,
                    style: textStyle.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 64),
                  Column(
                    children: [
                      CustomTextFormField(
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
                        onPressed: () {
                          final email = ref.read(emailProvider);
                          final password = ref.read(passwordProvider);
                          final user =
                              User(name: '', email: email, password: password);
                          ref.read(loginNotifierProvider.notifier).login(user);
                        },
                        child: Text(context.l10n.login),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.l10n.youDoNotHaveAnAccountYet),
                      TextButton(
                        onPressed: () {
                          context.pushRoute(const RegisterRoute());
                        },
                        child: Text(
                          context.l10n.registerHere,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
