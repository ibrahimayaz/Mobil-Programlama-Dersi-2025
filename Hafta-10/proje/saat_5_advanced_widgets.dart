/*
SAAT 5: İLERİ SEVİYE WIDGET'LER VE ANIMASYONLAR
=================================================
Bu bölümde:
- Navigation (Push/Pop)
- Named Routes
- Implicit Animasyonlar (AnimatedContainer)
- Explicit Animasyonlar (AnimationController)
- PageView
- TabBar
- CustomPaint
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İleri Widget\'ler ve Animasyonlar',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      // Named Routes
      routes: {
        '/': (context) => const MainPage(),
        '/detail': (context) => const DetailPage(),
        '/animations': (context) => const AnimationsPage(),
        '/pageview': (context) => const PageViewDemo(),
        '/tabs': (context) => const TabBarDemo(),
      },
    );
  }
}

// ============================================
// NAVIGATION DEMO
// ============================================

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İleri Widget\'ler Örnekleri'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Navigation
          _buildMenuCard(
            icon: Icons.navigation,
            title: 'Navigation',
            subtitle: 'Sayfalar arası geçiş',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    title: 'Detail Sayfası',
                    message: 'Push ile gelindi!',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),

          // 2. Named Routes
          _buildMenuCard(
            icon: Icons.route,
            title: 'Named Routes',
            subtitle: 'İsimli rotalar ile geçiş',
            onTap: () {
              Navigator.pushNamed(context, '/detail');
            },
          ),
          const SizedBox(height: 12),

          // 3. Animasyonlar
          _buildMenuCard(
            icon: Icons.animation,
            title: 'Animasyonlar',
            subtitle: 'Implicit ve Explicit animasyonlar',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnimationsPage()),
              );
            },
          ),
          const SizedBox(height: 12),

          // 4. PageView
          _buildMenuCard(
            icon: Icons.pages,
            title: 'PageView',
            subtitle: 'Kaydırılabilir sayfalar',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageViewDemo()),
              );
            },
          ),
          const SizedBox(height: 12),

          // 5. TabBar
          _buildMenuCard(
            icon: Icons.tab,
            title: 'TabBar',
            subtitle: 'Sekmeli arayüz',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TabBarDemo()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, size: 32, color: Colors.deepOrange),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

// ============================================
// DETAIL SAYFASI
// ============================================

class DetailPage extends StatelessWidget {
  final String title;
  final String message;

  const DetailPage({
    Key? key,
    this.title = 'Detail Sayfası',
    this.message = 'Hoş geldiniz!',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 24),
            Text(
              message,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// ANIMASYONLAR DEMO
// ============================================

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with TickerProviderStateMixin {
  // Implicit Animation
  bool _expanded = false;

  // Explicit Animation
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Explicit Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasyonlar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. IMPLICIT ANIMATION - AnimatedContainer
              _buildSectionTitle('1. Implicit Animation (AnimatedContainer)'),
              const SizedBox(height: 12),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: _expanded ? 250 : 150,
                    height: _expanded ? 250 : 150,
                    decoration: BoxDecoration(
                      color: _expanded ? Colors.purple : Colors.blue,
                      borderRadius: BorderRadius.circular(
                        _expanded ? 30 : 10,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: (_expanded ? Colors.purple : Colors.blue)
                              .withOpacity(0.4),
                          blurRadius: _expanded ? 20 : 5,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _expanded ? 'Büyük' : 'Küçük',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Dokunarak animasyon yapın',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 48),

              // 2. EXPLICIT ANIMATION - AnimationController
              _buildSectionTitle('2. Explicit Animation (AnimationController)'),
              const SizedBox(height: 12),
              Center(
                child: ScaleTransition(
                  scale: _animation,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.star,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _startAnimation,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Animasyonu Başlat'),
              ),
              const SizedBox(height: 48),

              // 3. ANIMATED PADDING
              _buildSectionTitle('3. AnimatedPadding'),
              const SizedBox(height: 12),
              AnimatedPadding(
                padding: _expanded
                    ? const EdgeInsets.all(24)
                    : const EdgeInsets.all(0),
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: const Text(
                    'AnimatedPadding: Padding animasyon ile değişir',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // 4. FADE TRANSITION
              _buildSectionTitle('4. FadeTransition'),
              const SizedBox(height: 12),
              Center(
                child: FadeTransition(
                  opacity: _animation,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Fade',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ============================================
// PAGEVIEW DEMO
// ============================================

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // PageView
          Expanded(
            child: PageView(
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                _buildPage(
                  color: Colors.blue,
                  icon: Icons.favorite,
                  title: 'Sayfa 1',
                  description: 'PageView ile kaydırılabilir sayfalar',
                ),
                _buildPage(
                  color: Colors.green,
                  icon: Icons.star,
                  title: 'Sayfa 2',
                  description: 'Dokunarak kaydırabilirsiniz',
                ),
                _buildPage(
                  color: Colors.purple,
                  icon: Icons.lightbulb,
                  title: 'Sayfa 3',
                  description: 'Son sayfaya ulaştınız',
                ),
              ],
            ),
          ),

          // Sayfa Göstergesi
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: currentPage == index ? 30 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color:
                        currentPage == index ? Colors.deepOrange : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required Color color,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.white),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// TABBAR DEMO
// ============================================

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Demo'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Ana Sayfa'),
            Tab(icon: Icon(Icons.search), text: 'Arama'),
            Tab(icon: Icon(Icons.person), text: 'Profil'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Ana Sayfa
          _buildTabContent(
            icon: Icons.home,
            title: 'Ana Sayfa',
            color: Colors.blue,
          ),

          // Tab 2: Arama
          _buildTabContent(
            icon: Icons.search,
            title: 'Arama',
            color: Colors.green,
          ),

          // Tab 3: Profil
          _buildTabContent(
            icon: Icons.person,
            title: 'Profil',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: color),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title sekmesine hoş geldiniz!')),
              );
            },
            child: const Text('Selamla'),
          ),
        ],
      ),
    );
  }
}

// ============================================
// ALIŞTIRAMA 5: GALERI UYGULAMASI
// ============================================

/*
GÖREV: Aşağıdaki özelliklerle resim galerisi yapın:

1. PageView ile resimler arasında kaydırma
2. Resim detay sayfası (navigation ile)
3. Favorilere ekleme/çıkarma
4. TabBar ile sekmeler:
   - Tüm Resimler
   - Favorilerim
5. Resim göstergesi (sayfa numaraları)

İPUCU:
- List<String> imageUrls tutun
- PageController kullanın
- Navigation push/pop kullanın
- State'de favorites Set tutun
*/

class GalleryApp extends StatefulWidget {
  const GalleryApp({Key? key}) : super(key: key);

  @override
  State<GalleryApp> createState() => _GalleryAppState();
}

class _GalleryAppState extends State<GalleryApp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Set<int> favorites = {};

  final images = [
    'https://via.placeholder.com/400x300?text=Resim+1',
    'https://via.placeholder.com/400x300?text=Resim+2',
    'https://via.placeholder.com/400x300?text=Resim+3',
    'https://via.placeholder.com/400x300?text=Resim+4',
    'https://via.placeholder.com/400x300?text=Resim+5',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleFavorite(int index) {
    setState(() {
      if (favorites.contains(index)) {
        favorites.remove(index);
      } else {
        favorites.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.image), text: 'Tüm Resimler'),
            Tab(icon: Icon(Icons.favorite), text: 'Favorilerim'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tüm Resimler
          GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GalleryCard(
                imageUrl: images[index],
                isFavorite: favorites.contains(index),
                onFavoriteTap: () => toggleFavorite(index),
                onImageTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryDetailPage(
                        imageUrl: images[index],
                        index: index,
                        isFavorite: favorites.contains(index),
                        onFavoriteTap: () => toggleFavorite(index),
                      ),
                    ),
                  );
                },
              );
            },
          ),

          // Favorilerim
          favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.favorite_border,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text('Favori resim yok'),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final favoriteIndex = favorites.elementAt(index);
                    return GalleryCard(
                      imageUrl: images[favoriteIndex],
                      isFavorite: true,
                      onFavoriteTap: () => toggleFavorite(favoriteIndex),
                      onImageTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryDetailPage(
                              imageUrl: images[favoriteIndex],
                              index: favoriteIndex,
                              isFavorite: true,
                              onFavoriteTap: () =>
                                  toggleFavorite(favoriteIndex),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onImageTap;

  const GalleryCard({
    Key? key,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onImageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          GestureDetector(
            onTap: onImageTap,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
              ),
              onPressed: onFavoriteTap,
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryDetailPage extends StatelessWidget {
  final String imageUrl;
  final int index;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const GalleryDetailPage({
    Key? key,
    required this.imageUrl,
    required this.index,
    required this.isFavorite,
    required this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resim Detayı'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 32,
                  ),
                  onPressed: onFavoriteTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
