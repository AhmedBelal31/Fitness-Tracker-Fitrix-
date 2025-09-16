import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common_ui/widgets/custom_button.dart';
import '../../../../core/common_ui/widgets/custom_text_field.dart';
import '../../../../core/theming/app_colors.dart';
import '../cubits/register/register_cubit.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/register/register_cubit.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimation();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
          ),
        );
  }

  void _startAnimation() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return 'Password must contain uppercase, lowercase and number';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register(
        userName: _userNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phoneNumber: _phoneController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: ColorsManager.scaffoldBackground,
        body: Container(
          decoration: const BoxDecoration(
            gradient: ColorsManager.appBackgroundGradient,
          ),
          child: SafeArea(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20),

                            // Back button
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorsManager.cardBackground,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: ColorsManager.softShadow,
                                ),
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: ColorsManager.primaryGreen,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Header
                            _buildHeader(),

                            const SizedBox(height: 40),

                            // Registration form
                            _buildRegistrationForm(),

                            const SizedBox(height: 32),

                            // Register button
                            _buildRegisterButton(),

                            const SizedBox(height: 32),

                            // Login link
                            _buildLoginLink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: ColorsManager.primaryGradient,
            boxShadow: ColorsManager.primaryShadow,
          ),
          child: const Icon(
            Icons.person_add_outlined,
            size: 40,
            color: ColorsManager.whiteText,
          ),
        ),

        const SizedBox(height: 24),

        // Welcome text
        const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: ColorsManager.primaryText,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Join Fitrix and start your transformation',
          style: TextStyle(fontSize: 16, color: ColorsManager.lightText),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRegistrationForm() {
    return Column(
      children: [
        // Username field
        CustomTextField(
          controller: _userNameController,
          label: 'Username',
          hint: 'Choose a username',
          prefixIcon: Icons.person_outlined,
          validator: _validateUserName,
        ),

        const SizedBox(height: 24),

        // Email field
        CustomTextField(
          controller: _emailController,
          label: 'Email Address',
          hint: 'Enter your email',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: _validateEmail,
        ),

        const SizedBox(height: 24),

        // Phone field
        CustomTextField(
          controller: _phoneController,
          label: 'Phone Number',
          hint: 'Enter your phone number',
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          validator: _validatePhone,
        ),

        const SizedBox(height: 24),

        // Password field
        CustomTextField(
          controller: _passwordController,
          label: 'Password',
          hint: 'Create a strong password',
          prefixIcon: Icons.lock_outlined,
          isPassword: true,
          validator: _validatePassword,
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomButton(
          text: 'Create Account',
          onPressed: state.isLoading ? null : _handleRegister,
          isLoading: state.isLoading,
          icon: Icons.person_add,
        );
      },
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(color: ColorsManager.lightText, fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, _) => const LoginScreen(),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
              ),
            );
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: ColorsManager.primaryGreen,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
