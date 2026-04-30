
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ═══════════════════════════════════════════════════════════════════════════════
// DATA MODEL
// ═══════════════════════════════════════════════════════════════════════════════

class GalacticItem {
  final String name;
  final int rarity;
  final String price;
  final String imageAsset;
  const GalacticItem({
    required this.name,
    required this.rarity,
    required this.price,
    required this.imageAsset,
  });
}

// ═══════════════════════════════════════════════════════════════════════════════
// MOCK DATA
// ═══════════════════════════════════════════════════════════════════════════════

const List<GalacticItem> kGalacticItems = [
  GalacticItem(name: 'Stellar Jade',          rarity: 5, price: '\$13', imageAsset: 'assets/galactic/stellar_jade.png'),
  GalacticItem(name: 'Oneiric Shard',         rarity: 5, price: '\$13', imageAsset: 'assets/galactic/oneiric_shard.png'),
  GalacticItem(name: 'Trailblaze EXP',        rarity: 4, price: '\$13', imageAsset: 'assets/galactic/trailblaze_exp.png'),
  GalacticItem(name: 'Credit',                rarity: 4, price: '\$13', imageAsset: 'assets/galactic/credit.png'),
  GalacticItem(name: 'Space Sealing Station', rarity: 5, price: '\$13', imageAsset: 'assets/galactic/space_sealing.png'),
  GalacticItem(name: 'Refined Aether',        rarity: 4, price: '\$13', imageAsset: 'assets/galactic/refined_aether.png'),
  GalacticItem(name: 'Lost Crystal',          rarity: 3, price: '\$13', imageAsset: 'assets/galactic/lost_crystal.png'),
];

// ═══════════════════════════════════════════════════════════════════════════════
// APP COLORS
// ═══════════════════════════════════════════════════════════════════════════════

class AppColors {
  static const starGold = Color(0xFFFFD700);
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN PAGE
// ═══════════════════════════════════════════════════════════════════════════════

class ExploreGalacticPage extends StatefulWidget {
  const ExploreGalacticPage({super.key});

  @override
  State<ExploreGalacticPage> createState() => _ExploreGalacticPageState();
}

class _ExploreGalacticPageState extends State<ExploreGalacticPage> {
  int _navIndex = 0;
  String _query = '';
  final TextEditingController _searchCtrl = TextEditingController();

  List<GalacticItem> get _filtered => _query.isEmpty
      ? kGalacticItems
      : kGalacticItems
          .where((item) => item.name.toLowerCase().contains(_query.toLowerCase()))
          .toList();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final safePadding = MediaQuery.of(context).padding.bottom;
    final bottomNavHeight = 47.0 + safePadding;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // ── Background ─────────────────────────────────────────────────────
          Positioned.fill(
            child: Image.asset(
              'assets/images/Explore_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              // ── HEADER ─────────────────────────────────────────────────────
              const _Header(),

              const SizedBox(height: 12),

              // ── LOGO — tanpa subtitle ──────────────────────────────────────
              const _LogoBanner(),

              const SizedBox(height: 16),

              // ── SEARCH BAR ─────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SearchBar(
                  controller: _searchCtrl,
                  onChanged: (v) => setState(() => _query = v),
                ),
              ),

              const SizedBox(height: 14),

              // ── CONTAINER TRANSPARAN — wadah scroll ───────────────────────
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, bottomNavHeight + 20),
                  child: _filtered.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search_off_rounded,
                                  color: Colors.white.withOpacity(0.35), size: 42),
                              const SizedBox(height: 10),
                              Text(
                                'No items found',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.45),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          itemCount: _filtered.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 33),
                          itemBuilder: (_, i) => _ItemCard(item: _filtered[i]),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),

      // ── BOTTOM NAV ─────────────────────────────────────────────────────────
      bottomNavigationBar: _BottomNav(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// SEARCH BAR
// ═══════════════════════════════════════════════════════════════════════════════

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const _SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Color(0XFF918EA1).withOpacity(0.37),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.20), width: 1),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.6),
        //     blurRadius: 10,
        //     spreadRadius:  -8,
        //     offset: const Offset(0, 10),
        //   ),
        // ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Search items...',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.40), fontSize: 13),
          suffixIcon: controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    controller.clear();
                    onChanged('');
                  },
                  child: Icon(Icons.close_rounded,
                      color: Colors.white.withOpacity(0.55), size: 18),
                )
              : Icon(Icons.search_rounded,
                  color: Colors.white.withOpacity(0.55), size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// ITEM CARD
// w = 384, h = 102, icon rounded square gradient ungu
// ═══════════════════════════════════════════════════════════════════════════════

class _ItemCard extends StatelessWidget {
  final GalacticItem item;
  const _ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 384,
      height: 102,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0XFF918EA1).withOpacity(0.37),
          border: Border.all(color: Colors.white.withOpacity(0.10), width: 0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
              // ── ICON BOX — rounded square gradient ungu ──────────────────
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: 72,
                  height: 78,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF6B4FA0),
                        Color(0xFF3A2060),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                      width: 0.8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  // ── Ketika asset siap, ganti child dengan:
                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(13),
                  //   child: Image.asset(item.imageAsset, fit: BoxFit.cover),
                  // ),
                  child: Center(
                    child: Icon(
                      _itemIcon(item.name),
                      color: Colors.white.withOpacity(0.88),
                      size: 32,
                    ),
                  ),
                ),
              ),

              // ── INFO ─────────────────────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 14, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Nama
                      Text(
                        item.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 6),

                      // Rarity
                      Row(
                        children: [
                          Text(
                            'Rarity : ',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.55),
                              fontSize: 11,
                            ),
                          ),
                          ...List.generate(
                            item.rarity,
                            (_) => const Padding(
                              padding: EdgeInsets.only(right: 1),
                              child: Icon(
                                Icons.star_rounded,
                                color: AppColors.starGold,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      // Harga
                      Text(
                        'Price : ${item.price}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _itemIcon(String name) {
    final n = name.toLowerCase();
    if (n.contains('jade'))    return Icons.diamond_outlined;
    if (n.contains('shard'))   return Icons.auto_awesome;
    if (n.contains('exp'))     return Icons.military_tech_outlined;
    if (n.contains('credit'))  return Icons.monetization_on_outlined;
    if (n.contains('station')) return Icons.satellite_alt_outlined;
    if (n.contains('aether'))  return Icons.bubble_chart_outlined;
    if (n.contains('crystal')) return Icons.hexagon_outlined;
    return Icons.stars_rounded;
  }
}


// ═══════════════════════════════════════════════════════════════════════════════
// HEADER — identik 1:1 ExploreLightCone
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
          bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.store_rounded, color: Color(0XFFEDC531), size: 26),
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
                style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 11),
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
// LOGO BANNER — hanya logo, tanpa subtitle
// ═══════════════════════════════════════════════════════════════════════════════

class _LogoBanner extends StatelessWidget {
  const _LogoBanner();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/honkai_logo.png',
      height: 120,
      fit: BoxFit.contain,
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// BOTTOM NAV — identik 1:1 ExploreLightCone
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.60),
            blurRadius: 16,
            offset: const Offset(0, -3),
          ),
        ],
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