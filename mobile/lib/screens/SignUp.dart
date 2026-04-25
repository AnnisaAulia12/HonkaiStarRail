
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
          // ── Galaxy background (sama kayak Login) ───────────
          Image.asset(
            'assets/images/galaxy_bg.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
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

                      // ── Logo (sama kayak Login) ──────────────
                      Transform.translate(
                        offset: const Offset(0, -30),
                        child: Image.asset(
                          'assets/images/honkai_logo.png',
                          height: 139,
                          width: 282,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 36),

                      // ── Form card: warna & style sama Login ──
                      // SignUp punya 3 field jadi height lebih tinggi
                      Center(
                        child: SizedBox(
                          width: 358,
                          child: Container(
                            decoration: BoxDecoration(
                              // ← sama persis kayak Login
                              color: const Color(0xFF6D6598).withOpacity(0.22),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.7),
                                  offset: const Offset(0, 4),
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 24),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  // ── Heading ──────────────────
                                  Center(
                                    child: Column(
                                      children: const [
                                        Text(
                                          'Create Account',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          'Sign up to enjoy fast and secure game top ups.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // ── Email ─────────────────────
                                  const _FieldLabel('Email'),
                                  const SizedBox(height: 6),
                                  Center(
                                    child: SizedBox(
                                      width: 314,
                                      height: 34,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              offset: const Offset(0, 4),
                                              blurRadius: 12,
                                            ),
                                          ],
                                        ),
                                        child: _StarRailField(
                                          controller: _emailController,
                                          hint: 'Enter your email',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (v) {
                                            if (v == null || v.isEmpty)
                                              return 'Email wajib diisi';
                                            if (!v.contains('@'))
                                              return 'Format email tidak valid';
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 40),

                                  // ── Username ──────────────────
                                  const _FieldLabel('Username'),
                                  const SizedBox(height: 6),
                                  Center(
                                    child: SizedBox(
                                      width: 314,
                                      height: 34,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              offset: const Offset(0, 4),
                                              blurRadius: 12,
                                            ),
                                          ],
                                        ),
                                        child: _StarRailField(
                                          controller: _usernameController,
                                          hint: 'Enter your username',
                                          validator: (v) {
                                            if (v == null || v.isEmpty)
                                              return 'Username wajib diisi';
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 40),

                                  // ── Password ──────────────────
                                  const _FieldLabel('Password'),
                                  const SizedBox(height: 6),
                                  Center(
                                    child: SizedBox(
                                      width: 314,
                                      height: 34,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              offset: const Offset(0, 4),
                                              blurRadius: 12,
                                            ),
                                          ],
                                        ),
                                        child: _StarRailField(
                                          controller: _passwordController,
                                          hint: 'Enter your password',
                                          obscure: _obscurePassword,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscurePassword
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            onPressed: () => setState(() =>
                                                _obscurePassword =
                                                    !_obscurePassword),
                                          ),
                                          validator: (v) {
                                            if (v == null || v.isEmpty)
                                              return 'Password wajib diisi';
                                            if (v.length < 8)
                                              return 'Minimal 8 karakter';
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 28),

                                  // ── Sign Up button ────────────
                                  SizedBox(
                                    width: double.infinity,
                                    height: 52,
                                    child: ElevatedButton(
                                      onPressed: _onSignUp,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor:
                                            const Color(0xFF6D6598),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        elevation: 6,
                                        shadowColor:
                                            Colors.black.withOpacity(0.6),
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

                                  // ── Link ke Login ─────────────
                                  Center(
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const Login()),
                                      ),
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'Already have an account? ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Sign In',
                                              style: TextStyle(
                                                color: Color(0xFFB48EFF),
                                                fontWeight: FontWeight.w700,
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
// Shared widgets — sama persis style Login
// ─────────────────────────────────────────────────────────────

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 13,
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
      style: const TextStyle(color: Colors.white, fontSize: 13),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 13),
        suffixIcon: suffixIcon,
        filled: true,
        // ← fillColor sama kayak Login
        fillColor: const Color(0xFF6D6598),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Color(0xFFFFFEFC), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFFFF6B6B), width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Color(0xFFFF6B6B), width: 1.5),
        ),
      ),
    );
  }
}