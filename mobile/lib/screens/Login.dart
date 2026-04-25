import 'package:flutter/material.dart';
import 'SignUp.dart';
//import 'home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
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
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignIn() {
    if (_formKey.currentState!.validate()) {
      // TODO: connect to Auth Service → POST /auth/login
      //Navigator.pushReplacement(
        //context,
       // MaterialPageRoute(builder: (_) => const HomePage()),
      //);
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
            fit: BoxFit.cover,
            alignment: Alignment.center
            //errorBuilder: (_, __, ___) => _FallbackBg(),
          ),
          Container(color: Colors.black.withOpacity(0.38)),

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
                        height: 139,
                        width: 282,
                        fit: BoxFit.contain,
                        //errorBuilder: (_, __, ___) => const _TextLogo(),
                      ),

                      const SizedBox(height: 36),

                      // ── Form card (blue glowing border) ─────
                      Container(
                        decoration: BoxDecoration( // 918EA1
                          color: const Color(0xFF6D6598).withOpacity(0.40),
                          borderRadius: BorderRadius.circular(24),
                          // border: Border.all(
                          //   color: const Color(0xFF4A9EFF).withOpacity(0.70),
                          //   width: 1.5,
                          // ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              //blurRadius: 48,
                              //spreadRadius: 4,
                              offset: Offset(0, 4),
                              blurRadius: 12,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(28),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ── Heading ─────────────────────
                              Center(
                                child: Column(
                                  children: [
                                    const Text(
                                      'Welcome Back',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1,
                                      ),
                                    ),

                                    const SizedBox(height: 2),

                                    const Text(
                                      'Sign in to Continue Your Game Top Up Experience',
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

                              // ── Email ────────────────────────
                              const _FieldLabel('Email'),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                                child: _StarRailField(
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
                              ),

                              const SizedBox(height: 18),

                              // ── Password ─────────────────────
                              const _FieldLabel('Password'),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: Offset(0, 4),
                                      blurRadius: 12,
                                    ), 
                                  ],
                                ),
                                child : _StarRailField(
                                controller: _passwordController,
                                hint: 'Enter your password',
                                obscure: _obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () => setState(() =>
                                      _obscurePassword = !_obscurePassword),
                                ),
                                validator: (v) {
                                  if (v == null || v.isEmpty)
                                    return 'Password wajib diisi';
                                  return null;
                                },
                              ),
                            ),
                              // ── Create Account / Forgot Password ─
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const SignUp()),
                                    ),
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // TODO: forgot password flow
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 28),

                              // ── Sign In button ───────────────
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: _onSignIn,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xff6D6598),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 28),

                              // ── Social login divider ─────────
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white.withOpacity(0.18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text(
                                      'or continue with',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white.withOpacity(0.18),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              // ── Social buttons ───────────────
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _SocialBtn(
                                    label: 'assets/images/google.png',
                                    color: Colors.transparent,
                                    onTap: () {
                                      // TODO: Google OAuth
                                    },
                                  ),
                                  const SizedBox(width: 30),
                                  _SocialBtn(
                                    label: 'assets/images/facebook.png',
                                    color: Colors.transparent,
                                    onTap: () {
                                      // TODO: Facebook OAuth
                                    },
                                  ),
                                  const SizedBox(width: 30),
                                  _SocialBtn(
                                    label: 'assets/images/twitter.png',
                                    color: Colors.transparent,
                                    onTap: () {
                                      // TODO: X/Twitter OAuth
                                    },
                                  ),
                                ],
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
      style: const TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFF6D6598),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Color(0xFFFFFEFC), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Color(0xFFFF6B6B), width: 1),
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

class _SocialBtn extends StatelessWidget {
  const _SocialBtn({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Image.asset(
            label,
            width: label.contains('google') ? 24 : 32,
            height: label.contains('google') ? 24 : 32,
            fit : BoxFit.contain,
            // label,
            // style: TextStyle(
            //   color: color,
            //   fontSize: 20,
            //   fontWeight: FontWeight.w900,
            // ),
          ),
        ),
      ),
    );
  }
}