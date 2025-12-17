# SAAT 5: İleri Seviye Widget'ler ve Animasyonlar

## 📌 Bu Saatin Hedefleri

- ✅ Navigation ile sayfa geçişi yapmak
- ✅ Animasyonlar oluşturmak
- ✅ PageView ile kaydırılabilir sayfalar
- ✅ TabBar ile sekmeli arayüz
- ✅ Galeri uygulaması yapmak

---

## 5.1 Navigation - Sayfa Geçişi

### Push - Yeni Sayfaya Gitme

```dart
// Sayfaya parametre göndermek
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(
      title: 'Detay Sayfası',
      message: 'Merhaba!',
    ),
  ),
);
```

### Pop - Geri Dönme

```dart
Navigator.pop(context);

// Veri döndürerek geri dön
Navigator.pop(context, 'Geri dönüş değeri');
```

### Detail Sayfası Örneği

```dart
class DetailPage extends StatelessWidget {
  final String title;
  final String message;

  const DetailPage({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 24),
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
```

---

## 5.2 Named Routes

Named routes, uygulamada merkezi bir yerde tüm rotaları tanımlamaya olanak tanır.

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

// Kullanım
Navigator.pushNamed(context, '/detail');
```

---

## 5.3 Animasyonlar

### Implicit Animation - AnimatedContainer

AnimatedContainer, özellikler değiştiğinde otomatik animasyon yapar.

```dart
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),  // Animasyon süresi
        width: expanded ? 250 : 150,
        height: expanded ? 250 : 150,
        decoration: BoxDecoration(
          color: expanded ? Colors.purple : Colors.blue,
          borderRadius: BorderRadius.circular(
            expanded ? 30 : 10,
          ),
          boxShadow: [
            BoxShadow(
              color: (expanded ? Colors.purple : Colors.blue)
                  .withOpacity(0.4),
              blurRadius: expanded ? 20 : 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            expanded ? 'Büyük' : 'Küçük',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
```

### Explicit Animation - AnimationController

AnimationController ile hassas kontrol sağlayabilirsiniz.

```dart
class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationExample> createState() =>
      _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _startAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ScaleTransition ile ölçek animasyonu
        ScaleTransition(
          scale: _animation,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(12),
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
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _startAnimation,
          child: const Text('Animasyonu Başlat'),
        ),
      ],
    );
  }
}
```

### Animasyon Türleri

```dart
// FadeTransition - Solma
FadeTransition(
  opacity: _animation,
  child: Container(),
)

// SlideTransition - Kaydırma
SlideTransition(
  position: Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(_controller),
  child: Container(),
)

// RotationTransition - Döndürme
RotationTransition(
  turns: _animation,
  child: Container(),
)

// SizeTransition - Boyut değişimi
SizeTransition(
  sizeFactor: _animation,
  child: Container(),
)
```

---

## 5.4 PageView - Kaydırılabilir Sayfalar

```dart
class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView')),
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
                  title: 'Sayfa 1',
                  icon: Icons.favorite,
                ),
                _buildPage(
                  color: Colors.green,
                  title: 'Sayfa 2',
                  icon: Icons.star,
                ),
                _buildPage(
                  color: Colors.purple,
                  title: 'Sayfa 3',
                  icon: Icons.lightbulb,
                ),
              ],
            ),
          ),

          // Sayfa göstergesi
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
                    color: currentPage == index
                        ? Colors.deepOrange
                        : Colors.grey,
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
    required String title,
    required IconData icon,
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
          ],
        ),
      ),
    );
  }
}
```

---

## 5.5 TabBar - Sekmeli Arayüz

```dart
class TabBarExample extends StatefulWidget {
  const TabBarExample({Key? key}) : super(key: key);

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
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
        title: const Text('TabBar'),
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
          // Tab 1
          _buildTabContent('Ana Sayfa', Icons.home, Colors.blue),

          // Tab 2
          _buildTabContent('Arama', Icons.search, Colors.green),

          // Tab 3
          _buildTabContent('Profil', Icons.person, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildTabContent(String title, IconData icon, Color color) {
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
        ],
      ),
    );
  }
}
```

---

## 5.6 Alıştırma 5: Galeri Uygulaması

### Görev

Aşağıdaki özelliklerle resim galerisi yapın:

1. **PageView** - Resimler arasında kaydırma
2. **Favoriler** - ❤️ ile favori ekleme/çıkarma
3. **TabBar** - İki sekme:
   - Tüm Resimler
   - Favorilerim
4. **Sayfa Göstergesi** - Hangi resimde olduğunu göster
5. **Navigation** - Resim detay sayfası

### Çözüm

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeri',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const GalleryApp(),
    );
  }
}

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
              );
            },
          ),

          // Favorilerim
          favorites.isEmpty
              ? const Center(child: Text('Favori resim yok'))
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

  const GalleryCard({
    Key? key,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
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
```

---

## 📚 Kaynaklar

- [Navigation & Routing](https://flutter.dev/docs/development/ui/navigation)
- [Animations](https://flutter.dev/docs/development/ui/animations)
- [PageView Widget](https://api.flutter.dev/flutter/widgets/PageView-class.html)

---

## ✅ Bu Saatin Özeti

- Navigation ile sayfa geçişi yaptım
- AnimatedContainer ile implicit animasyon
- AnimationController ile explicit animasyon
- PageView ile kaydırılabilir sayfalar
- TabBar ile sekmeli arayüz
- Galeri uygulaması geliştirdim

**Tebrikler! Saat 5 tamamlandı! 🎉**

---

## Sonraki Saat

**SAAT 6: Kapstone Proje - E-Ticaret Uygulaması**
- Tüm konseptlerin bir araya gelmesi
- Profesyonel uygulama geliştirme
- Deployment
