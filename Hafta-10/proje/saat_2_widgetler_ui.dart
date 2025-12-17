/*
SAAT 2: WIDGET'LER VE UI TASARIMI
==================================
Bu bölümde:
- Temel widget'ler (Text, Button, Image)
- Layout widget'leri (Column, Row, Stack)
- Container ve dekorasyon
- ListTile ve Card
- Ürün kartı uygulaması
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
      title: 'Widget ve UI Tasarımı',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const WidgetExamplesScreen(),
    );
  }
}

// TEMEL WIDGET'LER GÖSTERIMI
class WidgetExamplesScreen extends StatelessWidget {
  const WidgetExamplesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget\'ler ve UI'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. TEXT WIDGET
          _buildSection(
            title: '1. Text Widget',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Basit Metin',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'Koyu Metin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Renkli Metin',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 2. CONTAINER WIDGET
          _buildSection(
            title: '2. Container Widget',
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                'Kutu (Container) Widget\'i',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 3. BUTTON WIDGET'LERİ
          _buildSection(
            title: '3. Button Widget\'leri',
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('OutlinedButton'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 4. ROW - YATAY DÜZEN
          _buildSection(
            title: '4. Row Widget (Yatay)',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red.shade300,
                    child: const Center(child: Text('Item 1')),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green.shade300,
                    child: const Center(child: Text('Item 2')),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.blue.shade300,
                    child: const Center(child: Text('Item 3')),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 5. CARD WIDGET
          _buildSection(
            title: '5. Card Widget',
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Card Widget',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kartlar, içeriği düzgün ve şık bir şekilde sunmak için '
                      'kullanılır. Gölge ve boşluk içerirler.',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: child,
        ),
      ],
    );
  }
}

// ============================================
// UYGULAMA 1: ÜRÜN KARTLARI LİSTESİ
// ============================================

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductModel(
        id: 1,
        title: 'Laptop',
        price: 999.99,
        rating: 4.5,
        imageUrl: 'https://via.placeholder.com/300x200?text=Laptop',
      ),
      ProductModel(
        id: 2,
        title: 'Akıllı Telefon',
        price: 599.99,
        rating: 4.8,
        imageUrl: 'https://via.placeholder.com/300x200?text=Phone',
      ),
      ProductModel(
        id: 3,
        title: 'Wireless Kulaklık',
        price: 99.99,
        rating: 4.2,
        imageUrl: 'https://via.placeholder.com/300x200?text=Headphones',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürünler'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

// Ürün Modeli
class ProductModel {
  final int id;
  final String title;
  final double price;
  final double rating;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}

// Ürün Kartı Widget'i
class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resim
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              product.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Bilgiler
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Başlık
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Fiyat
                Text(
                  '₺${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),

                // Derecelendirme
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber[600], size: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${product.rating}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Stokta',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Butonlar
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text('Sepete Ekle'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Icon(Icons.favorite_border),
                    ),
                  ],
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
// ALIŞTIRAMA 2: TODO LİSTESİ UI
// ============================================

/*
GÖREV: Aşağıdaki özelliklerle todo uygulaması UI'ı oluşturun:

1. AppBar başlığı "Yapılacaklar"
2. Metin giriş alanı + Ekle butonu
3. Todo öğelerinin listesi (her öğe):
   - Checkbox
   - Todo metni
   - Sil butonu

İPUCU: Column, Row, TextField, ListTile widget'lerini kullanın
*/

class TodoListUIScreen extends StatelessWidget {
  const TodoListUIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = [
      TodoItem(id: 1, title: 'Flutter öğren', completed: false),
      TodoItem(id: 2, title: 'Dart öğren', completed: true),
      TodoItem(id: 3, title: 'Proje yap', completed: false),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yapılacaklar'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Giriş alanı
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Yeni todo ekle...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.add),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 18,
                    ),
                  ),
                  child: const Text('Ekle'),
                ),
              ],
            ),
          ),

          // Todo listesi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (value) {},
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  final int id;
  final String title;
  final bool completed;

  TodoItem({
    required this.id,
    required this.title,
    required this.completed,
  });
}
