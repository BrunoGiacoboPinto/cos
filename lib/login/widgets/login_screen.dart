import 'package:cos/login/view_model/login_view_model.dart';
import 'package:cos/routing/routes.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    widget.viewModel.addListener(_onLoginSuccess);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    widget.viewModel.removeListener(_onLoginSuccess);
    super.dispose();
  }

  void _onLoginSuccess() {
    if (widget.viewModel.state is LoginScreenSuccess) {
      context.goNamed(AppRoutes.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SafeArea(
        child: Column(
          children: [
            spacing2Xl,
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: spaceMd),
                child: Form(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1.25,
                        child: Image.asset(
                          'assets/images/car_on_sale.webp',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListenableBuilder(
                        listenable: widget.viewModel,
                        builder: (context, child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: switch (widget.viewModel.state) {
                              LoginScreenInitial() => Column(
                                children: [
                                  spacingXl,
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  spacingLg,
                                  TextField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: OutlineInputBorder(),
                                    ),
                                    obscureText: true,
                                  ),
                                ],
                              ),
                              LoginScreenLoading() => const CircularProgressIndicator(),
                              LoginScreenError(message: final message) => Text(
                                message,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
                              ),
                              LoginScreenSuccess() => const SizedBox.shrink(),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListenableBuilder(
              listenable: widget.viewModel,
              builder: (context, child) {
                if (widget.viewModel.state is LoginScreenInitial) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spaceMd),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () async {
                        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill in all fields'),
                            ),
                          );
                          return;
                        }

                        await widget.viewModel.login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
                      child: const Text('Login'),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            SizedBox(height: MediaQuery.viewPaddingOf(context).bottom),
          ],
        ),
      ),
    );
  }
}
