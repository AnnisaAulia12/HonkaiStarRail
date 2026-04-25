import 'package:flutter/material.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.10),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    if (_formKey.currentState!.validate()) {
      // TODO: connect to Auth Service → POST /auth/register
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ── Galaxy background ──────────────────────────────
          Image.asset(
            'assets/images/galaxy_bg.png',
            fit: BoxFit.contain,
            //errorBuilder: (_, __, ___) => _FallbackBg(),
          ),
          //Container(color: Colors.black.withOpacity(0.38)),

          // ── Scrollable content ─────────────────────────────
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 28),

                      // ── Logo ────────────────────────────────
                      Image.asset(
                        'assets/images/honkai_logo.png',
                        height: 100,
                        fit: BoxFit.cover,
                        //errorBuilder: (_, __, ___) => const _TextLogo(),
                      ),

                      const SizedBox(height: 36),

                      // ── Form card ───────────────────────────
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1040).withOpacity(0.78),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6C3DE0).withOpacity(0.30),
                              blurRadius: 48,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(28),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ── Heading ──────────────────────
                              const Text(
                                'Create Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Sign up to enjoy fast and secure game top ups.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.50),
                                  fontSize: 13,
                                ),
                              ),

                              const SizedBox(height: 28),

                              // ── Email ────────────────────────
                              const _FieldLabel('Email'),
                              const SizedBox(height: 8),
                              _StarRailField(
                                controller: _emailController,
                                hint: 'Enter your email',
                                keyboardType: TextInputType.emailAddress,
                                validator: (v) {
                                  if (v == null || v.isEmpty)
                                    return 'Email wajib diisi';
                                  if (!v.contains('@'))
                                    return 'Format email tidak valid';
                                  return null;
                                },
                              ),

                              const SizedBox(height: 18),

                              // ── Username ─────────────────────
                              const _FieldLabel('Username'),
                              const SizedBox(height: 8),
                              _StarRailField(
                                controller: _usernameController,
                                hint: 'Enter your username',
                                validator: (v) {
                                  if (v == null || v.isEmpty)
                                    return 'Username wajib diisi';
                                  return null;
                                },
                              ),

                              const SizedBox(height: 18),

                              // ── Password ─────────────────────
                              const _FieldLabel('Password'),
                              const SizedBox(height: 8),
                              _StarRailField(
                                controller: _passwordController,
                                hint: 'Enter your password',
                                obscure: _obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.white38,
                                    size: 20,
                                  ),
                                  onPressed: () => setState(() =>
                                      _obscurePassword = !_obscurePassword),
                                ),
                                validator: (v) {
                                  if (v == null || v.isEmpty)
                                    return 'Password wajib diisi';
                                  if (v.length < 8)
                                    return 'Minimal 8 karakter';
                                  return null;
                                },
                              ),

                              const SizedBox(height: 32),

                              // ── Sign Up button ───────────────
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: _onSignUp,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFF1A1040),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // ── Link ke Login ────────────────
                              Center(
                                child: GestureDetector(
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Login()),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 13,
                                      ),
                                      children: const [
                                        TextSpan(
                                          text: 'Sign In',
                                          style: TextStyle(
                                            color: Color(0xFFB48EFF),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Shared widgets
// ─────────────────────────────────────────────────────────────

class _FallbackBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.2, -0.4),
          radius: 1.2,
          colors: [
            Color(0xFF2D1B6B),
            Color(0xFF1A1040),
            Color(0xFF0D0820),
            Color(0xFF060412),
          ],
          stops: [0.0, 0.35, 0.65, 1.0],
        ),
      ),
    );
  }
}

class _TextLogo extends StatelessWidget {
  const _TextLogo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'HONKAI',
          style: TextStyle(
            color: Colors.white.withOpacity(0.85),
            fontSize: 12,
            fontWeight: FontWeight.w300,
            letterSpacing: 8,
          ),
        ),
        const Text(
          'STAR RAIL',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
            height: 1.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 2,
          width: 150,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.transparent,
                Color(0xFFB48EFF),
                Colors.transparent,
              ],
            ),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.75),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _StarRailField extends StatelessWidget {
  const _StarRailField({
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.obscure = false,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscure;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.30),
          fontSize: 14,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFF2A1F5E).withOpacity(0.60),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Color(0xFF8B6FFF), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Color(0xFFFF6B6B), width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Color(0xFFFF6B6B), width: 1.5),
        ),
      ),
    );
  }
}