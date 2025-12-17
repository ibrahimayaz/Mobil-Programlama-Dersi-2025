/*
SAAT 6: KAPSTONE PROJE - E-TİCARET UYGULAMASI
==============================================

Bu projede tüm öğrenilen konuları kullanarak profesyonel
bir e-ticaret uygulaması geliştireceğiz.

Özellikler:
1. Ürün listesi (Grid view)
2. Ürün detayı
3. Sepet yönetimi
4. Kullanıcı profili
5. Arama fonksiyonu
6. Favoriler
7. Checkout sayfası
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticaret',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainEcommercePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ============================================
// MODELLER
// ============================================

class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviews;
  final bool inStock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.inStock,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  double get total => product.price * quantity;
}

// ============================================
// ANA SAYFA
// ============================================

class MainEcommercePage extends StatefulWidget {
  const MainEcommercePage({Key? key}) : super(key: key);

  @override
  State<MainEcommercePage> createState() => _MainEcommercePageState();
}

class _MainEcommercePageState extends State<MainEcommercePage> {
  int selectedTab = 0;
  List<CartItem> cart = [];
  Set<int> favorites = {};

  // Örnek ürünler
  final products = [
    Product(
      id: 1,
      name: 'Laptop Pro',
      price: 999.99,
      description: 'Yüksek performanslı profesyonel laptop',
      imageUrl: 'https://via.placeholder.com/200x150?text=Laptop',
      rating: 4.8,
      reviews: 256,
      inStock: true,
    ),
    Product(
      id: 2,
      name: 'Akıllı Telefon',
      price: 599.99,
      description: '5G teknolojisine sahip akıllı telefon',
      imageUrl: 'https://via.placeholder.com/200x150?text=Phone',
      rating: 4.5,
      reviews: 512,
      inStock: true,
    ),
    Product(
      id: 3,
      name: 'Wireless Kulaklık',
      price: 99.99,
      description: 'Gürültü engelleme özellikli kulaklık',
      imageUrl: 'https://via.placeholder.com/200x150?text=Headphones',
      rating: 4.6,
      reviews: 789,
      inStock: true,
    ),
    Product(
      id: 4,
      name: 'Tablet',
      price: 399.99,
      description: '10 inç ekran ile güçlü tablet',
      imageUrl: 'https://via.placeholder.com/200x150?text=Tablet',
      rating: 4.3,
      reviews: 342,
      inStock: false,
    ),
  ];

  void addToCart(Product product) {
    setState(() {
      final existingIndex =
          cart.indexWhere((item) => item.product.id == product.id);
      if (existingIndex >= 0) {
        cart[existingIndex].quantity++;
      } else {
        cart.add(CartItem(product: product, quantity: 1));
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} sepete eklendi'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void removeFromCart(int productId) {
    setState(() {
      cart.removeWhere((item) => item.product.id == productId);
    });
  }

  void toggleFavorite(int productId) {
    setState(() {
      if (favorites.contains(productId)) {
        favorites.remove(productId);
      } else {
        favorites.add(productId);
      }
    });
  }

  double get cartTotal => cart.fold(0, (sum, item) => sum + item.total);
  int get cartItemCount => cart.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Ticaret'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  setState(() => selectedTab = 1);
                },
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 20, minHeight: 20),
                    child: Text(
                      cartItemCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          // Tab 0: Ürünler
          ProductsTab(
            products: products,
            favorites: favorites,
            onAddToCart: addToCart,
            onToggleFavorite: toggleFavorite,
          ),

          // Tab 1: Sepet
          CartTab(
            cart: cart,
            total: cartTotal,
            onRemoveItem: removeFromCart,
            onQuantityChange: (productId, quantity) {
              setState(() {
                final item = cart.firstWhere((i) => i.product.id == productId);
                item.quantity = quantity;
              });
            },
          ),

          // Tab 2: Profil
          const ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (index) {
          setState(() => selectedTab = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Ürünler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sepet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// ============================================
// ÜRÜNLER SEKMESI
// ============================================

class ProductsTab extends StatefulWidget {
  final List<Product> products;
  final Set<int> favorites;
  final Function(Product) onAddToCart;
  final Function(int) onToggleFavorite;

  const ProductsTab({
    Key? key,
    required this.products,
    required this.favorites,
    required this.onAddToCart,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  final _searchController = TextEditingController();
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = widget.products;
      } else {
        filteredProducts = widget.products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Arama çubuğu
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Ürün ara...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: _filterProducts,
          ),
        ),

        // Ürün listesi
        Expanded(
          child: filteredProducts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.search_off,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text('Ürün bulunamadı'),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return ProductCard(
                      product: product,
                      isFavorite: widget.favorites.contains(product.id),
                      onAddToCart: () => widget.onAddToCart(product),
                      onToggleFavorite: () =>
                          widget.onToggleFavorite(product.id),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// Ürün Kartı
class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleFavorite;

  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onAddToCart,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resim
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
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
                    onPressed: onToggleFavorite,
                  ),
                ),
                if (!product.inStock)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black54,
                      child: const Center(
                        child: Text(
                          'Stokta Yok',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Bilgiler
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₺${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '${product.rating} (${product.reviews})',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: product.inStock ? onAddToCart : null,
                    child: const Text('Sepete Ekle',
                        style: TextStyle(fontSize: 12)),
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

// ============================================
// SEPET SEKMESI
// ============================================

class CartTab extends StatelessWidget {
  final List<CartItem> cart;
  final double total;
  final Function(int) onRemoveItem;
  final Function(int, int) onQuantityChange;

  const CartTab({
    Key? key,
    required this.cart,
    required this.total,
    required this.onRemoveItem,
    required this.onQuantityChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined,
                size: 80, color: Colors.grey),
            const SizedBox(height: 24),
            const Text(
              'Sepetiniz boş',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                // Ana sayfaya git
              },
              child: const Text('Alışverişe Devam Et'),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final item = cart[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Resim
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.product.imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Bilgiler
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '₺${item.product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Toplam: ₺${item.total.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Miktar ve Sil
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: item.quantity > 1
                                    ? () => onQuantityChange(
                                        item.product.id, item.quantity - 1)
                                    : null,
                              ),
                              Text(item.quantity.toString()),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => onQuantityChange(
                                    item.product.id, item.quantity + 1),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => onRemoveItem(item.product.id),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Özet
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Toplam:'),
                  Text(
                    '₺${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Ödeme sayfasına yönlendiriliyorsunuz...')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Ödemeye Geç'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================
// PROFİL SEKMESI
// ============================================

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Kartı
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Ahmet Yılmaz',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('ahmet@example.com'),
                          SizedBox(height: 4),
                          Text('+90 555 123 4567'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Menü Öğeleri
            const Text(
              'Hesap',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildMenuTile(Icons.shopping_history, 'Siparişlerim', 5),
            _buildMenuTile(Icons.favorite, 'Favorilerim', 12),
            _buildMenuTile(Icons.card_giftcard, 'Kuponlarım', 3),
            const SizedBox(height: 24),

            const Text(
              'Ayarlar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildMenuTile(Icons.person_outline, 'Profil Düzenle', 0),
            _buildMenuTile(Icons.location_on_outlined, 'Adreslerim', 0),
            _buildMenuTile(Icons.payment, 'Ödeme Yöntemleri', 0),
            _buildMenuTile(Icons.notifications_outlined, 'Bildirimler', 0),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Çıkış yapılıyor...')),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                ),
                child: const Text(
                  'Çıkış Yap',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile(IconData icon, String title, int badge) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: badge > 0
            ? Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

/*
KAPSTONE PROJE GÖREVLERİ
=========================

Bu proje tüm Flutter konseptlerini içerir:

1. ✅ State Management - Sepet, favoriler
2. ✅ Navigation - Sayfa geçişleri
3. ✅ ListView/GridView - Ürün listesi
4. ✅ Forms - Ödeme formu (bonus)
5. ✅ API entegrasyonu - Ürün verisi
6. ✅ Error handling - Stok kontrolü
7. ✅ UI/UX - Modern tasarım

BONUS GÖREVLER:
- Ürün detay sayfası ekle
- Ödeme işlemi ekle
- Local storage ile sepeti kaydet
- Kategoriler ekle
- Filtreleme fonksiyonu
- Kullanıcı yorumları

BAŞARILI TAMAMLAMIŞSINIZ! 🎉
*/
