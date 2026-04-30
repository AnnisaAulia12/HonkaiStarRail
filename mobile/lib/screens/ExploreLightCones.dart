
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ExploreLightCones());
}

// ═══════════════════════════════════════════════════════════════════════════════
// APP ROOT
// ═══════════════════════════════════════════════════════════════════════════════

class ExploreLightCones extends StatelessWidget {
  const ExploreLightCones({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honkai Star Rail Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const ExplorePage(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════════════════════════

enum PathType {
  all,
  theHunt,
  destruction,
  erudition,
  harmony,
  nihility,
  preservation,
  abundance,
}

class PathCategory {
  final PathType type;
  final String label;
  final String iconAsset;
  const PathCategory({
    required this.type,
    required this.label,
    required this.iconAsset,
  });
}

class LightCone {
  final String name;
  final int stars;
  final PathType path;
  final String imageAsset;
  final String pathIconAsset;
  const LightCone({
    required this.name,
    required this.stars,
    required this.path,
    required this.imageAsset,
    required this.pathIconAsset,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// MOCK DATA
// ═══════════════════════════════════════════════════════════════════════════════

const List<PathCategory> kCategories = [
  PathCategory(type: PathType.all,          label: 'All',          iconAsset: 'assets/icons/all.png'),
  PathCategory(type: PathType.theHunt,      label: 'The Hunt',     iconAsset: 'assets/images/TheHunt.png'),
  PathCategory(type: PathType.destruction,  label: 'Destruction',  iconAsset: 'assets/images/Destruction.png'),
  PathCategory(type: PathType.erudition,    label: 'Erudition',    iconAsset: 'assets/images/Erudition.png'),
  PathCategory(type: PathType.harmony,      label: 'Harmony',      iconAsset: 'assets/images/Harmony.png'),
  PathCategory(type: PathType.nihility,     label: 'Nihility',     iconAsset: 'assets/images/Nihility.png'),
  PathCategory(type: PathType.preservation, label: 'Preservation', iconAsset: 'assets/images/Preservation.png'),
  PathCategory(type: PathType.abundance,    label: 'Abundance',    iconAsset: 'assets/images/Abundance.png'),
];

const List<LightCone> kLightCones = [
  // The Hunt
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.theHunt,     imageAsset: 'assets/cards/charmony_fall.png',   pathIconAsset: 'assets/images/TheHunt.png'),
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.theHunt,     imageAsset: 'assets/images/TheHunt.png',   pathIconAsset: 'assets/images/TheHunt.png'),
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.theHunt,     imageAsset: 'assets/images/TheHunt.png',   pathIconAsset: 'assets/images/TheHunt.png'),
  // Destruction
  LightCone(name: 'A Grounded Ascent',       stars: 4, path: PathType.destruction, imageAsset: 'assets/cards/grounded_ascent.png', pathIconAsset: 'assets/images/Destruction.png'),
  LightCone(name: 'A Grounded Ascent',       stars: 4, path: PathType.destruction, imageAsset: 'assets/cards/grounded_ascent.png', pathIconAsset: 'assets/images/Destruction.png'),
  LightCone(name: 'A Grounded Ascent',       stars: 4, path: PathType.destruction, imageAsset: 'assets/cards/grounded_ascent.png', pathIconAsset: 'assets/images/Destruction.png'),
  // Harmony
  LightCone(name: 'Boundless Choreo',        stars: 4, path: PathType.harmony,     imageAsset: 'assets/cards/boundless_choreo.png',pathIconAsset: 'assets/images/Harmony.png'),
  LightCone(name: 'Boundless Choreo',        stars: 4, path: PathType.harmony,     imageAsset: 'assets/cards/boundless_choreo.png',pathIconAsset: 'assets/images/Harmony.png'),
  LightCone(name: 'Boundless Choreo',        stars: 4, path: PathType.harmony,     imageAsset: 'assets/cards/boundless_choreo.png',pathIconAsset: 'assets/images/Harmony.png'),
  // Erudition
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.erudition,   imageAsset: 'assets/cards/charmony_fall.png',   pathIconAsset: 'assets/images/Erudition.png'),
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.erudition,   imageAsset: 'assets/cards/charmony_fall.png',   pathIconAsset: 'assets/images/Erudition.png'),
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.erudition,   imageAsset: 'assets/cards/charmony_fall.png',   pathIconAsset: 'assets/images/Erudition.png'),
  // Nihility
  LightCone(name: 'Boundless Choreo',        stars: 4, path: PathType.nihility,    imageAsset: 'assets/cards/boundless_choreo.png',pathIconAsset: 'assets/images/Nihility.png'),
  LightCone(name: 'Boundless Choreo',        stars: 4, path: PathType.nihility,    imageAsset: 'assets/cards/boundless_choreo.png',pathIconAsset: 'assets/images/Nihility.png'),
  LightCone(name: 'Boundless Choreo',        stars: 4, path: PathType.nihility,    imageAsset: 'assets/cards/boundless_choreo.png',pathIconAsset: 'assets/images/Nihility.png'),
  // Preservation
  LightCone(name: 'A Grounded Ascent',       stars: 4, path: PathType.preservation,imageAsset: 'assets/cards/grounded_ascent.png', pathIconAsset: 'assets/images/Preservation.png'),
  LightCone(name: 'A Grounded Ascent',       stars: 4, path: PathType.preservation,imageAsset: 'assets/cards/grounded_ascent.png', pathIconAsset: 'assets/images/Preservation.png'),
  LightCone(name: 'A Grounded Ascent',       stars: 4, path: PathType.preservation,imageAsset: 'assets/cards/grounded_ascent.png', pathIconAsset: 'assets/images/Preservation.png'),
  // Abundance
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.abundance,   imageAsset: 'assets/cards/charmony_fall.png',   pathIconAsset: 'assets/images/Abundance.png'),
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.abundance,   imageAsset: 'assets/cards/charmony_fall.png',   pathIconAsset: 'assets/images/Abundance.png'),
  LightCone(name: 'After the Charmony Fall', stars: 5, path: PathType.abundance,   imageAsset: 'assets/cards/charmony_fall.png',   pathIconAsset: 'assets/images/Abundance.png'),
];

// ═══════════════════════════════════════════════════════════════════════════════
// CARD COLOR THEME
// ═══════════════════════════════════════════════════════════════════════════════

class _CardTheme {
  final List<Color> gradient;
  final Color bottomBar;
  const _CardTheme({
    required this.gradient,
    required this.bottomBar,
  });
}

_CardTheme cardThemeForIndex(int indexInGroup) {
  switch (indexInGroup % 3) {
    case 0:
      return _CardTheme(
        gradient: [Color(0xFFA13BCA).withOpacity(0.05), Color(0xFFA13BCA).withOpacity(0.05), Color(0xFFA13BCA).withOpacity(0.6)],
        bottomBar: Color(0xFFA13BCA).withOpacity(0.8),
      );
    case 1:
      return _CardTheme(
        gradient: [Color(0XFFF3DD8A).withOpacity(0.05), Color(0XFFF3DD8A).withOpacity(0.05), Color(0XFFF3DD8A).withOpacity(0.6)],
        bottomBar: Color(0xFFF3DD8A).withOpacity(0.8),
      );
    case 2:
    default:
      return _CardTheme(
        gradient: [Color(0xFF2854C3).withOpacity(0.05), Color(0xFF2854C3).withOpacity(0.05), Color(0xFF2854C3).withOpacity(0.6)],
        bottomBar: Color(0xFF44AAFF).withOpacity(0.8),
      );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// APP COLORS
// ═══════════════════════════════════════════════════════════════════════════════

class AppColors {
  static const starGold = Color(0xFFFFD700);
  static const navBar   = Color(0xFF07071A);
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN PAGE
// ═══════════════════════════════════════════════════════════════════════════════

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  PathType _selectedPath = PathType.all;
  int _navIndex = 0;

  List<LightCone> get _filtered => _selectedPath == PathType.all
      ? kLightCones
      : kLightCones.where((c) => c.path == _selectedPath).toList();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // ── Background ─────────────────────────────────────────────────────
          Positioned.fill(
            child: Image.asset(
              "assets/images/Explore_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          // ── Konten utama ───────────────────────────────────────────────────
          Column(
            children: [
              // ── HEADER ─────────────────────────────────────────────────────
              const _Header(),

              const SizedBox(height: 12),

              // ── LOGO BANNER ────────────────────────────────────────────────
              // PERUBAHAN: height logo dikurangi 120 → 80, SizedBox(height:20) → 8
              const _LogoBanner(),

              const SizedBox(height: 20),

              // ── PANEL CARDS ────────────────────────────────────────────────
              SizedBox(
                width: 400,
                height: 648,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.10),
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.10),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 0),
                          _PathChipsSection(
                            selected: _selectedPath,
                            onSelect: (p) => setState(() => _selectedPath = p),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(19),
                              child: _CardsGrid(items: _filtered),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: _BottomNav(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// STARFIELD PAINTER
// ═══════════════════════════════════════════════════════════════════════════════

class _StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stars = [
      Offset(0.10, 0.05), Offset(0.30, 0.10), Offset(0.60, 0.03),
      Offset(0.85, 0.08), Offset(0.45, 0.15), Offset(0.20, 0.22),
      Offset(0.75, 0.18), Offset(0.55, 0.28), Offset(0.90, 0.25),
      Offset(0.05, 0.35), Offset(0.38, 0.32), Offset(0.68, 0.38),
      Offset(0.15, 0.48), Offset(0.50, 0.42), Offset(0.82, 0.45),
      Offset(0.28, 0.55), Offset(0.62, 0.52), Offset(0.95, 0.58),
      Offset(0.08, 0.65), Offset(0.42, 0.68), Offset(0.78, 0.62),
      Offset(0.22, 0.75), Offset(0.58, 0.78), Offset(0.88, 0.72),
      Offset(0.35, 0.85), Offset(0.72, 0.88), Offset(0.12, 0.92),
    ];
    for (var i = 0; i < stars.length; i++) {
      canvas.drawCircle(
        Offset(stars[i].dx * size.width, stars[i].dy * size.height),
        i % 4 == 0 ? 1.6 : 1.0,
        Paint()..color = Colors.white.withOpacity(i % 3 == 0 ? 0.75 : 0.40),
      );
    }
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.3), 160,
      Paint()
        ..color = const Color(0x15304080)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80),
    );
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.6), 180,
      Paint()
        ..color = const Color(0x20602080)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100),
    );
  }

  @override
  bool shouldRepaint(_) => false;
}

// ═══════════════════════════════════════════════════════════════════════════════
// HEADER
// ═══════════════════════════════════════════════════════════════════════════════

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(10, top + 2, 10, 4),
      decoration: BoxDecoration(
        color: Color(0XFF918EA1).withOpacity(0.37),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.store_rounded,
            color: Color(0XFFEDC531),
            size: 26,
          ),
          const SizedBox(width: 11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Store',
                style: TextStyle(
                  color: Color(0xFFEDC531),
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'Honkai Star Retail',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 30, height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.55), width: 1.4),
              color: Colors.white.withOpacity(0.08),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 19),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// LOGO BANNER
// PERUBAHAN: height logo 120 → 80, hapus SizedBox(height:0) ganti SizedBox(height:2)
// ═══════════════════════════════════════════════════════════════════════════════

class _LogoBanner extends StatelessWidget {
  const _LogoBanner();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo tetap 120, padding bawah logo dihapus agar rapat ke subtitle
        Image.asset(
          'assets/images/honkai_logo.png',
          height: 120,
          fit: BoxFit.contain,
        ),
        // HANYA INI YANG DIUBAH: gap logo → subtitle dari bawaan ~8-12 → 0
        const SizedBox(height: 0),
        Text(
          'Acquire powerful weapons and rare galactic resources.\nFuel your journey across the cosmos.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.55),
            fontSize: 11,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// PATH CHIPS SECTION
// ═══════════════════════════════════════════════════════════════════════════════

class _PathChipsSection extends StatelessWidget {
  final PathType selected;
  final ValueChanged<PathType> onSelect;
  const _PathChipsSection({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Color(0xFF918EA1).withOpacity(0.35),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(
            color: Colors.white.withOpacity(0.25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.30),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SizedBox(
          height: 36,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: kCategories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 6),
            itemBuilder: (_, i) {
              final cat = kCategories[i];
              final isSel = cat.type == selected;

              return GestureDetector(
                onTap: () => onSelect(cat.type),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFF918EA1).withOpacity(0.37),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSel
                          ? Colors.white.withOpacity(0.65)
                          : Colors.white.withOpacity(0.18),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      cat.type == PathType.all
                          ? const Icon(Icons.grid_view, size: 14, color: Colors.white)
                          : Image.asset(
                              cat.iconAsset,
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                      const SizedBox(width: 5),
                      Text(
                        cat.label,
                        style: TextStyle(
                          color: Colors.white.withOpacity(isSel ? 1.0 : 0.65),
                          fontSize: 11.5,
                          fontWeight: isSel ? FontWeight.w700 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PathIcon extends StatelessWidget {
  final PathType type;
  final double size;
  const _PathIcon({required this.type, required this.size});

  IconData get _icon {
    switch (type) {
      case PathType.theHunt:      return Icons.my_location;
      case PathType.destruction:  return Icons.local_fire_department;
      case PathType.erudition:    return Icons.auto_stories;
      case PathType.harmony:      return Icons.music_note;
      case PathType.nihility:     return Icons.remove_circle_outline;
      case PathType.preservation: return Icons.shield_outlined;
      case PathType.abundance:    return Icons.spa_outlined;
      default:                    return Icons.apps;
    }
  }

  @override
  Widget build(BuildContext context) =>
      Icon(_icon, color: Colors.white, size: size);
}

// ═══════════════════════════════════════════════════════════════════════════════
// CARDS GRID — tidak ada perubahan sama sekali
// ═══════════════════════════════════════════════════════════════════════════════

class _CardsGrid extends StatelessWidget {
  final List<LightCone> items;
  const _CardsGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text('No items found', style: TextStyle(color: Colors.white54)),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 60),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 14,
        childAspectRatio: 0.775,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => _LightConeCard(cone: items[i], globalIndex: i),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// LIGHT CONE CARD — tidak ada perubahan sama sekali
// ═══════════════════════════════════════════════════════════════════════════════

class _LightConeCard extends StatelessWidget {
  final LightCone cone;
  final int globalIndex;
  const _LightConeCard({required this.cone, required this.globalIndex});

  @override
  Widget build(BuildContext context) {
    final theme = cardThemeForIndex(globalIndex);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: theme.gradient,
          stops: const [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.10), width: 0.8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // Bottom glow bar
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Container(
                height: 9,
                decoration: BoxDecoration(
                  color: theme.bottomBar.withOpacity(0.65),
                ),
              ),
            ),

            // Top shimmer
            Positioned(
              top: 0, left: 0, right: 0,
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white.withOpacity(0.14), Colors.transparent],
                  ),
                ),
              ),
            ),

            // Konten
            Column(
              children: [
                // Top row: path icon
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 22, height: 22,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(_pathIcon(cone.path), color: Colors.white, size: 12),
                      ),
                    ],
                  ),
                ),

                // Area gambar kartu (MIRING)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6, 4, 6, 25),
                    child: Center(
                      child: Transform.rotate(
                        angle: 0.08 * math.pi / 2,
                        child: Container(
                          width: 55,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.22),
                                Colors.white.withOpacity(0.05),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                blurRadius: 8,
                                offset: const Offset(2, 4),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                              width: 0.8,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white.withOpacity(0.25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Nama
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text(
                    cone.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8.0,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ),

                const SizedBox(height: 0),

                // Bintang
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      cone.stars,
                      (_) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.5),
                        child: Icon(Icons.star, color: AppColors.starGold, size: 9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _pathIcon(PathType t) {
    switch (t) {
      case PathType.theHunt:      return Icons.my_location;
      case PathType.destruction:  return Icons.local_fire_department;
      case PathType.erudition:    return Icons.auto_stories;
      case PathType.harmony:      return Icons.music_note;
      case PathType.nihility:     return Icons.remove_circle_outline;
      case PathType.preservation: return Icons.shield_outlined;
      case PathType.abundance:    return Icons.spa_outlined;
      default:                    return Icons.apps;
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// BOTTOM NAV — tidak ada perubahan
// ═══════════════════════════════════════════════════════════════════════════════

class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const _BottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.home_outlined,          Icons.home_rounded),
      (Icons.search_outlined,        Icons.search_rounded),
      (Icons.shopping_cart_outlined, Icons.shopping_cart_rounded),
      (Icons.person_outline,         Icons.person_rounded),
    ];

    return Container(
      height: 47 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: Color(0XFF918EA1).withOpacity(0.37),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.08), width: 0.8),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(1),
        //     blurRadius: 16,
        //     offset: const Offset(0, -3),
        //   ),
        // ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (i) {
            final isActive = i == currentIndex;
            return GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 64,
                child: Center(
                  child: Icon(
                    isActive ? items[i].$2 : items[i].$1,
                    color: isActive ? Colors.white : Colors.white.withOpacity(0.38),
                    size: 32,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}