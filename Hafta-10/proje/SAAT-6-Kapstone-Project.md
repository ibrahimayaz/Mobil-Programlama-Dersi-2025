# SAAT 6: Kapstone Proje - E-Ticaret Uygulaması

## 📌 Bu Saatin Hedefleri

- ✅ Tüm konseptleri bir araya getirmek
- ✅ State management ile veri yönetimi
- ✅ BottomNavigationBar ile sekme navigasyonu
- ✅ Sepet sistemini geliştirmek
- ✅ Profesyonel uygulama yapısı

---

## 6.1 Proje Mimarisi

### Models

```dart
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;
}

class User {
  final String name;
  final String email;
  final String phone;
  final String address;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
```

---

## 6.2 State Management

```dart
// Sepet durumunu yönetmek için StatefulWidget kullanıyoruz
class ShoppingCart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product) {
    // Aynı ürün zaten var mı kontrol et
    try {
      final existingItem = _items.firstWhere(
        (item) => item.product.id == product.id,
      );
      existingItem.quantity++;
    } catch (e) {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(int productId, int quantity) {
    final item = _items.firstWhere(
      (item) => item.product.id == productId,
    );
    item.quantity = quantity;
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get itemCount => _items.length;

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
```

---

## 6.3 Ana Uygulama

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticaret',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: const ECommerceApp(),
    );
  }
}

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({Key? key}) : super(key: key);

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  int currentIndex = 0;
  final cartItems = <CartItem>[];
  final favoriteIds = <int>{};

  // Örnek ürünler
  late List<Product> products;

  @override
  void initState() {
    super.initState();
    products = [
      Product(
        id: 1,
        name: 'Akıllı Telefon',
        description: 'Son teknoloji akıllı telefon',
        price: 999.99,
        imageUrl: 'https://via.placeholder.com/200?text=Telefon',
        rating: 4.5,
      ),
      Product(
        id: 2,
        name: 'Tablet',
        description: 'Portabl tablet cihazı',
        price: 599.99,
        imageUrl: 'https://via.placeholder.com/200?text=Tablet',
        rating: 4.0,
      ),
      Product(
        id: 3,
        name: 'Kulaklık',
        description: 'Kablosuz kulaklık',
        price: 199.99,
        imageUrl: 'https://via.placeholder.com/200?text=Kulaklık',
        rating: 4.8,
      ),
      Product(
        id: 4,
        name: 'Smartwatch',
        description: 'Akıllı saat',
        price: 299.99,
        imageUrl: 'https://via.placeholder.com/200?text=Smartwatch',
        rating: 4.3,
      ),
      Product(
        id: 5,
        name: 'Powerbank',
        description: 'Taşınabilir şarj cihazı',
        price: 49.99,
        imageUrl: 'https://via.placeholder.com/200?text=Powerbank',
        rating: 4.6,
      ),
    ];
  }

  void toggleFavorite(int productId) {
    setState(() {
      if (favoriteIds.contains(productId)) {
        favoriteIds.remove(productId);
      } else {
        favoriteIds.add(productId);
      }
    });
  }

  void addToCart(Product product) {
    setState(() {
      try {
        final existingItem = cartItems.firstWhere(
          (item) => item.product.id == product.id,
        );
        existingItem.quantity++;
      } catch (e) {
        cartItems.add(CartItem(product: product));
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} sepete eklendi')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Ticaret'),
        centerTitle: true,
        elevation: 0,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          // Ürünler Sekmesi
          ProductsTab(
            products: products,
            favoriteIds: favoriteIds,
            onFavoriteTap: toggleFavorite,
            onAddToCart: addToCart,
          ),

          // Sepet Sekmesi
          CartTab(
            cartItems: cartItems,
            onUpdateQuantity: (productId, quantity) {
              setState(() {
                final item = cartItems.firstWhere(
                  (item) => item.product.id == productId,
                );
                if (quantity > 0) {
                  item.quantity = quantity;
                } else {
                  cartItems.removeWhere(
                    (item) => item.product.id == productId,
                  );
                }
              });
            },
            onRemoveItem: (productId) {
              setState(() {
                cartItems.removeWhere(
                  (item) => item.product.id == productId,
                );
              });
            },
          ),

          // Profil Sekmesi
          const ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag),
            label: 'Ürünler',
            badge: products.length.toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: 'Sepet',
            badge: cartItems.length > 0 ? cartItems.length.toString() : null,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
```

---

## 6.4 Ürünler Sekmesi

```dart
class ProductsTab extends StatelessWidget {
  final List<Product> products;
  final Set<int> favoriteIds;
  final Function(int) onFavoriteTap;
  final Function(Product) onAddToCart;

  const ProductsTab({
    Key? key,
    required this.products,
    required this.favoriteIds,
    required this.onFavoriteTap,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        // Arama kutusu
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Ürün ara...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        // Ürün listesi
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
              isFavorite: favoriteIds.contains(product.id),
              onFavoriteTap: () => onFavoriteTap(product.id),
              onAddToCart: () => onAddToCart(product),
            );
          },
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddToCart;

  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resim
          Stack(
            children: [
              Image.network(
                product.imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: onFavoriteTap,
                    iconSize: 20,
                  ),
                ),
              ),
            ],
          ),

          // İçerik
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 12, color: Colors.amber),
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '\₺${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 32),
                  ),
                  child: const Text(
                    'Sepete Ekle',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 6.5 Sepet Sekmesi

```dart
class CartTab extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(int, int) onUpdateQuantity;
  final Function(int) onRemoveItem;

  const CartTab({
    Key? key,
    required this.cartItems,
    required this.onUpdateQuantity,
    required this.onRemoveItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Sepet boş',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    final totalPrice = cartItems.fold<double>(
      0,
      (sum, item) => sum + item.totalPrice,
    );

    return Column(
      children: [
        // Ürünler listesi
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Ürün resmi
                      Image.network(
                        cartItem.product.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),

                      // Ürün bilgileri
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\₺${cartItem.product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Miktar kontrolü
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (cartItem.quantity > 1) {
                                      onUpdateQuantity(
                                        cartItem.product.id,
                                        cartItem.quantity - 1,
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                  iconSize: 18,
                                ),
                                Text(cartItem.quantity.toString()),
                                IconButton(
                                  onPressed: () {
                                    onUpdateQuantity(
                                      cartItem.product.id,
                                      cartItem.quantity + 1,
                                    );
                                  },
                                  icon: const Icon(Icons.add),
                                  iconSize: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Silme düğmesi
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          onRemoveItem(cartItem.product.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Özet ve ödeme
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ara Toplam:'),
                  Text(
                    '\₺${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Kargo:'),
                  Text('\₺10.00'),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Toplam:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\₺${(totalPrice + 10).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ödeme işlemi başladı')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Ödemeyi Tamamla'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

---

## 6.6 Profil Sekmesi

```dart
class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = User(
      name: 'Ahmet Yılmaz',
      email: 'ahmet@example.com',
      phone: '+90 (555) 123 4567',
      address: 'İstanbul, Türkiye',
    );

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Profil kartı
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.deepOrange,
                  child: Text(
                    user.name[0],
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // İletişim bilgileri
        _buildInfoCard(
          title: 'Telefon',
          value: user.phone,
          icon: Icons.phone,
        ),
        _buildInfoCard(
          title: 'E-posta',
          value: user.email,
          icon: Icons.email,
        ),
        _buildInfoCard(
          title: 'Adres',
          value: user.address,
          icon: Icons.location_on,
        ),
        const SizedBox(height: 24),

        // Butonlar
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit),
          label: const Text('Profili Düzenle'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.logout),
          label: const Text('Çıkış Yap'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: Colors.deepOrange),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 6.7 Alıştırmalar

### Görev 1: Ürün Detay Sayfası

Aşağıdaki özellikleri ekleyin:

```dart
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          // Ürün resmi (büyük)
          Image.network(product.imageUrl),

          // Açıklama
          Text(product.description),

          // Yorum
          Text('Puanı: ${product.rating}'),

          // Satın Al butonu
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Sepete Ekle'),
          ),
        ],
      ),
    );
  }
}
```

**İpucu:** ProductCard'dan tıkladığında bu sayfaya git.

### Görev 2: Filtreleme Özelliği

Ürünleri fiyat aralığına göre filtreleyin:

```dart
class PriceFilter {
  double minPrice = 0;
  double maxPrice = 10000;

  bool matches(Product product) {
    return product.price >= minPrice && product.price <= maxPrice;
  }
}
```

### Görev 3: Arama Fonksiyonu

Ürünleri ada göre ara:

```dart
List<Product> searchProducts(String query, List<Product> products) {
  return products
      .where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
}
```

---

## 📊 Uygulama Mimarisi

```
ECommerceApp
├── ProductsTab
│   └── ProductCard × N
├── CartTab
│   └── CartItem × N
└── ProfileTab
    └── UserInfo
```

---

## 🚀 Deployment Hazırlığı

### APK Oluşturma (Android)

```bash
flutter build apk --release
```

### iOS IPA Oluşturma

```bash
flutter build ios --release
```

### Play Store'a Yükleme

1. Google Play Console'a kaydolun
2. Uygulamayı oluşturun
3. APK dosyasını yükleyin
4. Gönderimi tamamlayın

---

## 📚 Kaynaklar

- [State Management](https://flutter.dev/docs/development/data-and-backend/state-mgmt)
- [Shopping Cart Pattern](https://pub.dev/packages/provider)
- [Deployment Guide](https://flutter.dev/docs/deployment)

---

## ✅ Bu Saatin Özeti

- E-ticaret uygulaması geliştirdim
- BottomNavigationBar ile navigasyon
- Sepet sistemi geliştirdim
- State management uyguladım
- Profesyonel UI deseni oluşturdum

---

## 🎓 Kursu Tamamladınız!

**6 Saatlik Flutter Programlama Serisi başarıyla tamamlandı!**

### Öğrendikleriniz:
- ✅ Flutter temeleri ve kurulumu
- ✅ Widget'ler ve UI tasarımı
- ✅ State management
- ✅ API entegrasyonu
- ✅ İleri seviye widget'ler ve animasyonlar
- ✅ Profesyonel uygulama geliştirme

### Sonraki Adımlar:

1. **Kendi Projelerinizi Yapın** - Öğrendiklerinizi uygulayın
2. **API Öğrenin** - Firebase, Django, Node.js
3. **Veritabanı Öğrenin** - SQLite, Firestore
4. **Paket Yönetimi Öğrenin** - pub.dev paketlerini kullanın
5. **Topluluk Katılın** - Flutter subreddits, Discord sunucuları

### Faydalı Kaynaklar:

- 📖 [Official Flutter Docs](https://flutter.dev/docs)
- 🎓 [Udemy Flutter Kursu](https://www.udemy.com/course/flutter)
- 💬 [Flutter Subreddit](https://reddit.com/r/Flutter)
- 🐙 [GitHub Örnekleri](https://github.com/flutter/samples)

---

## İletişim ve Destek

Sorularınız olursa:
- 📧 Email: support@fluttercourse.com
- 💬 Discord: Flutter Community
- 🌐 Web: www.fluttercourse.com

**Başarılar! 🚀**
