
// import 'package:flutter/material.dart';
// import 'SignUp.dart';
// //import 'home_page.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscurePassword = true;

//   late AnimationController _animController;
//   late Animation<double> _fadeAnim;
//   late Animation<Offset> _slideAnim;

//   @override
//   void initState() {
//     super.initState();
//     _animController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 900),
//     );
//     _fadeAnim =
//         CurvedAnimation(parent: _animController, curve: Curves.easeOut);
//     _slideAnim = Tween<Offset>(
//       begin: const Offset(0, 0.10),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
//     _animController.forward();
//   }

//   @override
//   void dispose() {
//     _animController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _onSignIn() {
//     if (_formKey.currentState!.validate()) {
//       // TODO: connect to Auth Service → POST /auth/login
//       //Navigator.pushReplacement(
//         //context,
//        // MaterialPageRoute(builder: (_) => const HomePage()),
//       //);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // ── Galaxy background ──────────────────────────────
//           Image.asset(
//             'assets/images/galaxy_bg.png',
//             fit: BoxFit.cover,
//             alignment: Alignment.center,
//           ),
//           Container(color: Colors.black.withOpacity(0.38)),

//           // ── Scrollable content ─────────────────────────────
//           SafeArea(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
//               child: FadeTransition(
//                 opacity: _fadeAnim,
//                 child: SlideTransition(
//                   position: _slideAnim,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 28),

//                       // ── Logo ────────────────────────────────
//                       Transform.translate(
//                         offset: const Offset(0, -30),
//                         child: Image.asset(
//                           'assets/images/honkai_logo.png',
//                           height: 139,
//                           width: 282,
//                           fit: BoxFit.contain,
//                         ),
//                       ),

//                       const SizedBox(height: 36),

//                       // ── Form card: 358 x 508, corner radius 20 ──
//                       Center(
//                         child: SizedBox(
//                           width: 358,
//                           height: 508,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF6D6598).withOpacity(0.40),
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.7),
//                                   offset: const Offset(0, 4),
//                                   blurRadius: 12,
//                                   spreadRadius: 0,
//                                 ),
//                               ],
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 22, vertical: 24),
//                             child: Form(
//                               key: _formKey,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [

//                                   // ── Heading ──────────────────
//                                   Center(
//                                     child: Column(
//                                       children: const [
//                                         Text(
//                                           'Welcome Back',
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w700,
//                                             letterSpacing: 1,
//                                           ),
//                                         ),
//                                         SizedBox(height: 2),
//                                         Text(
//                                           'Sign in to Continue Your Game Top Up Experience',
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 8,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),

//                                   const SizedBox(height: 20),

//                                   // ── Email label ───────────────
//                                   const _FieldLabel('Email'),
//                                   const SizedBox(height: 6),

//                                   // Field: 314 x 34, corner radius 20
//                                   Center(
//                                     child: SizedBox(
//                                       width: 314,
//                                       height: 34,
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(20),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Colors.black.withOpacity(0.25),
//                                               offset: const Offset(0, 4),
//                                               blurRadius: 12,
//                                             ),
//                                           ],
//                                         ),
//                                         child: _StarRailField(
//                                           controller: _emailController,
//                                           hint: 'Enter your email',
//                                           keyboardType: TextInputType.emailAddress,
//                                           validator: (v) {
//                                             if (v == null || v.isEmpty)
//                                               return 'Email wajib diisi';
//                                             if (!v.contains('@'))
//                                               return 'Format email tidak valid';
//                                             return null;
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   const SizedBox(height: 16),

//                                   // ── Password label ────────────
//                                   const _FieldLabel('Password'),
//                                   const SizedBox(height: 6),

//                                   // Field: 314 x 34, corner radius 20
//                                   Center(
//                                     child: SizedBox(
//                                       width: 314,
//                                       height: 34,
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(20),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Colors.black.withOpacity(0.25),
//                                               offset: const Offset(0, 4),
//                                               blurRadius: 12,
//                                             ),
//                                           ],
//                                         ),
//                                         child: _StarRailField(
//                                           controller: _passwordController,
//                                           hint: 'Enter your password',
//                                           obscure: _obscurePassword,
//                                           suffixIcon: IconButton(
//                                             icon: Icon(
//                                               _obscurePassword
//                                                   ? Icons.visibility_off_outlined
//                                                   : Icons.visibility_outlined,
//                                               color: Colors.white,
//                                               size: 18,
//                                             ),
//                                             onPressed: () => setState(() =>
//                                                 _obscurePassword =
//                                                     !_obscurePassword),
//                                           ),
//                                           validator: (v) {
//                                             if (v == null || v.isEmpty)
//                                               return 'Password wajib diisi';
//                                             return null;
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   // ── Create Account / Forgot Password ─
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () => Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (_) => const SignUp()),
//                                         ),
//                                         child: const Text(
//                                           'Create Account',
//                                           style: TextStyle(
//                                               color: Colors.white, fontSize: 10),
//                                         ),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {},
//                                         child: const Text(
//                                           'Forgot Password?',
//                                           style: TextStyle(
//                                               color: Colors.white, fontSize: 10),
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   const SizedBox(height: 20),

//                                   // ── Sign In button ───────────
//                                   SizedBox(
//                                     width: double.infinity,
//                                     height: 52,
//                                     child: ElevatedButton(
//                                       onPressed: _onSignIn,
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.white,
//                                         foregroundColor: const Color(0xff6D6598),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(30),
//                                         ),
//                                         elevation: 6,
//                                         shadowColor:
//                                             Colors.black.withOpacity(0.6),
//                                       ),
//                                       child: const Text(
//                                         'Sign In',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   const SizedBox(height: 20),

//                                   // ── Social login divider ──────
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: Divider(
//                                             color:
//                                                 Colors.white.withOpacity(0.18)),
//                                       ),
//                                       const Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 12),
//                                         child: Text(
//                                           'or continue with',
//                                           style: TextStyle(
//                                               color: Colors.white, fontSize: 12),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Divider(
//                                             color:
//                                                 Colors.white.withOpacity(0.18)),
//                                       ),
//                                     ],
//                                   ),

//                                   const SizedBox(height: 16),

//                                   // ── Social buttons ────────────
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       _SocialBtn(
//                                         label: 'assets/images/google.png',
//                                         color: Colors.transparent,
//                                         onTap: () {},
//                                       ),
//                                       const SizedBox(width: 30),
//                                       _SocialBtn(
//                                         label: 'assets/images/facebook.png',
//                                         color: Colors.transparent,
//                                         onTap: () {},
//                                       ),
//                                       const SizedBox(width: 30),
//                                       _SocialBtn(
//                                         label: 'assets/images/twitter.png',
//                                         color: Colors.transparent,
//                                         onTap: () {},
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 40),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────
// // Shared widgets — tidak diubah
// // ─────────────────────────────────────────────────────────────

// class _FallbackBg extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: RadialGradient(
//           center: Alignment(0.2, -0.4),
//           radius: 1.2,
//           colors: [
//             Color(0xFF2D1B6B),
//             Color(0xFF1A1040),
//             Color(0xFF0D0820),
//             Color(0xFF060412),
//           ],
//           stops: [0.0, 0.35, 0.65, 1.0],
//         ),
//       ),
//     );
//   }
// }

// class _TextLogo extends StatelessWidget {
//   const _TextLogo();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'HONKAI',
//           style: TextStyle(
//             color: Colors.white.withOpacity(0.85),
//             fontSize: 12,
//             fontWeight: FontWeight.w300,
//             letterSpacing: 8,
//           ),
//         ),
//         const Text(
//           'STAR RAIL',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//             fontWeight: FontWeight.w900,
//             letterSpacing: 4,
//             height: 1.0,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _FieldLabel extends StatelessWidget {
//   const _FieldLabel(this.text);
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: const TextStyle(
//         color: Colors.white,
//         fontSize: 13,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }

// class _StarRailField extends StatelessWidget {
//   const _StarRailField({
//     required this.controller,
//     required this.hint,
//     this.keyboardType,
//     this.obscure = false,
//     this.suffixIcon,
//     this.validator,
//   });

//   final TextEditingController controller;
//   final String hint;
//   final TextInputType? keyboardType;
//   final bool obscure;
//   final Widget? suffixIcon;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscure,
//       keyboardType: keyboardType,
//       validator: validator,
//       style: const TextStyle(color: Colors.white, fontSize: 13),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white, fontSize: 13),
//         suffixIcon: suffixIcon,
//         filled: true,
//         fillColor: const Color(0xFF6D6598),
//         // padding dikecilkan supaya muat di height 34
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide.none,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(color: Colors.white),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide:
//               const BorderSide(color: Color(0xFFFFFEFC), width: 1.5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(color: Color(0xFFFF6B6B), width: 1),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide:
//               const BorderSide(color: Color(0xFFFF6B6B), width: 1.5),
//         ),
//       ),
//     );
//   }
// }

// class _SocialBtn extends StatelessWidget {
//   const _SocialBtn({
//     required this.label,
//     required this.color,
//     required this.onTap,
//   });

//   final String label;
//   final Color color;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.45),
//               offset: const Offset(0, 5),
//               blurRadius: 14,
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Container(
//           width: 52,
//           height: 52,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//           ),
//           child: Center(
//             child: Image.asset(
//               label,
//               width: label.contains('google') ? 24 : 32,
//               height: label.contains('google') ? 24 : 32,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
            alignment: Alignment.center,
          ),
          // ✅ Dihapus: overlay hitam (mengikuti SignUp yang tidak pakai overlay)
          //Container(color: Colors.black.withOpacity(0.38)),

          // ── Scrollable content ─────────────────────────────
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 28),

                      // ── Logo ────────────────────────────────
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

                      // ── Form card ───────────────────────────
                      Center(
                        child: SizedBox(
                          width: 358,
                          // ✅ Dihapus: fixed height 508 (mengikuti SignUp yang wrap content)
                          child: Container(
                            decoration: BoxDecoration(
                              // ✅ Disamakan: opacity 0.22 seperti SignUp
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
                                          'Welcome Back',
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

                                  // ── Email label ───────────────
                                  const _FieldLabel('Email'),
                                  const SizedBox(height: 6),
                                  Center(
                                    child: SizedBox(
                                      width: 314,
                                      height: 34,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
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
                                    ),
                                  ),

                                  // ✅ Disamakan: spacing 40 seperti SignUp
                                  const SizedBox(height: 40),

                                  // ── Password label ────────────
                                  const _FieldLabel('Password'),
                                  const SizedBox(height: 6),
                                  Center(
                                    child: SizedBox(
                                      width: 314,
                                      height: 34,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.25),
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
                                                  ? Icons.visibility_off_outlined
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
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),

                                  // ── Create Account / Forgot Password ─
                                  const SizedBox(height: 8),
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
                                        child: const Text(
                                          'Create Account',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  // ── Sign In button ───────────
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
                                        elevation: 6,
                                        shadowColor:
                                            Colors.black.withOpacity(0.6),
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

                                  const SizedBox(height: 20),

                                  // ── Social login divider ──────
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                            color:
                                                Colors.white.withOpacity(0.18)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Text(
                                          'or continue with',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                            color:
                                                Colors.white.withOpacity(0.18)),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 16),

                                  // ── Social buttons ────────────
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _SocialBtn(
                                        label: 'assets/images/google.png',
                                        color: Colors.transparent,
                                        onTap: () {},
                                      ),
                                      const SizedBox(width: 30),
                                      _SocialBtn(
                                        label: 'assets/images/facebook.png',
                                        color: Colors.transparent,
                                        onTap: () {},
                                      ),
                                      const SizedBox(width: 30),
                                      _SocialBtn(
                                        label: 'assets/images/twitter.png',
                                        color: Colors.transparent,
                                        onTap: () {},
                                      ),
                                    ],
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
// Shared widgets — tidak diubah
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.45),
              offset: const Offset(0, 5),
              blurRadius: 14,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              label,
              width: label.contains('google') ? 24 : 32,
              height: label.contains('google') ? 24 : 32,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}