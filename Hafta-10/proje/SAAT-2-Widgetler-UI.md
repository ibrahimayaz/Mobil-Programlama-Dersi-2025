# SAAT 2: Widget'ler ve UI Tasarımı

## 📌 Bu Saatin Hedefleri

- ✅ Temel widget'leri derinlemesine öğrenmek
- ✅ Layout widget'lerini (Column, Row, Stack) kullanmak
- ✅ Card ve Container ile tasarım yapmak
- ✅ Ürün kartları oluşturmak
- ✅ ListView ve GridView kullanmak

---

## 2.1 Layout Widget'leri

### Column - Dikey Düzen

`Column`, widget'leri dikey (aşağıya doğru) düzenler.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,      // Dikey hizalama
  crossAxisAlignment: CrossAxisAlignment.start,      // Yatay hizalama
  children: [
    const Text('Birinci Öğe'),
    const SizedBox(height: 16),
    const Text('İkinci Öğe'),
    const SizedBox(height: 16),
    const Text('Üçüncü Öğe'),
  ],
)
```

#### MainAxisAlignment Seçenekleri

| Seçenek | Açıklama |
|---------|----------|
| `start` | Başlangıcına hizala |
| `center` | Ortala |
| `end` | Sonuna hizala |
| `spaceEvenly` | Eşit boşluk |
| `spaceBetween` | İlk ve son kenarda |
| `spaceAround` | Etrafında boşluk |

### Row - Yatay Düzen

`Row`, widget'leri yatay (sağa doğru) düzenler.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    const Icon(Icons.home),
    const Icon(Icons.search),
    const Icon(Icons.person),
  ],
)
```

### Stack - Katmanlı Düzen

`Stack`, widget'leri üst üste yerleştirir. `Positioned` ile konumlandırabilirsiniz.

```dart
Stack(
  children: [
    // Arka plan
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    ),
    
    // Öne getir
    Positioned(
      top: 10,
      right: 10,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: const Center(child: Text('Öne')),
      ),
    ),
  ],
)
```

---

## 2.2 Container - Kutu Tasarımı

`Container` widget'i, boyut, renk, gölge ve kenarlık eklemek için kullanılır.

```dart
Container(
  width: 200,
  height: 200,
  padding: const EdgeInsets.all(16),              // İç boşluk
  margin: const EdgeInsets.all(16),               // Dış boşluk
  
  decoration: BoxDecoration(
    color: Colors.blue,                            // Arka plan rengi
    
    // Köşe yuvarlama
    borderRadius: BorderRadius.circular(16),
    
    // Kenarlık
    border: Border.all(
      color: Colors.black,
      width: 2,
    ),
    
    // Gölge
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  ),
  
  child: const Center(child: Text('Container')),
)
```

---

## 2.3 Card Widget

`Card`, içeriği düzgün bir şekilde sunmak için gölge ve kenarlar ekler.

```dart
Card(
  elevation: 8,                                     // Gölge derinliği
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
        Text('Kartlar, içeriği düzgün sunmak için kullanılır.'),
      ],
    ),
  ),
)
```

---

## 2.4 ListTile Widget

`ListTile`, list öğelerini hızlı bir şekilde oluşturmak için ideal widget'tir.

```dart
ListTile(
  leading: const Icon(Icons.person),              // Sol taraf
  title: const Text('Ad Soyad'),                   // Başlık
  subtitle: const Text('email@example.com'),       // Alt başlık
  trailing: const Icon(Icons.arrow_forward_ios),   // Sağ taraf
  onTap: () {
    print('ListTile tıklandı!');
  },
)
```

---

## 2.5 Ürün Kartı Örneği

Gerçek hayattan bir örnek: E-ticaret uygulaması için ürün kartı.

```dart
class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final double rating;
  final String imageUrl;

  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              imageUrl,
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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                
                Text(
                  '₺${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Derecelendirme
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(rating.toString()),
                  ],
                ),
                const SizedBox(height: 12),
                
                // Buton
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sepete Ekle'),
                  ),
                )
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

## 2.6 ListView - Kaydırılabilir Liste

```dart
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text('Öğe ${index + 1}'),
        onTap: () {},
      ),
    );
  },
)
```

---

## 2.7 GridView - Izgara Düzeni

```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,                             // 2 sütun
    crossAxisSpacing: 12,                          // Sütun aralığı
    mainAxisSpacing: 12,                           // Satır aralığı
    childAspectRatio: 0.75,                        // En-boy oranı
  ),
  itemCount: 10,
  itemBuilder: (context, index) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blue,
          ),
          const SizedBox(height: 8),
          const Text('Ürün ${1}'),
        ],
      ),
    );
  },
)
```

---

## 2.8 Alıştırma 2: Todo Listesi UI'ı

### Görev

Aşağıdaki özelliklerle todo listesi UI'ı tasarlayın:

1. **Üst kısım**:
   - Başlık: "Yapılacaklar"
   - Metin giriş alanı
   - "Ekle" butonu

2. **Alt kısım**:
   - Todo öğelerinin listesi
   - Her öğe: checkbox, metin, sil butonu

### İpuçları

- `Column` ve `Row` kullanın
- `TextField` ile giriş alanı oluşturun
- `ListTile` ile todo gösterin
- `ListView.builder` ile dinamik liste

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
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = [
      {'title': 'Flutter öğren', 'completed': false},
      {'title': 'Dart pratiği yap', 'completed': true},
      {'title': 'Proje geliştir', 'completed': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yapılacaklar'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Arama ve ekle
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Yeni todo ekle...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Ekle'),
                ),
              ],
            ),
          ),

          // Todo listesi
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: todo['completed'] as bool,
                        onChanged: (value) {},
                      ),
                      title: Text(
                        todo['title'] as String,
                        style: TextStyle(
                          decoration: (todo['completed'] as bool)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      ),
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
```

---

## 2.9 Padding ve Margin

### Padding - İç Boşluk

Paddiing, widget'in içindeki boşluk.

```dart
Padding(
  padding: const EdgeInsets.all(16),               // Tüm taraf
  child: Container(),
)

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  ),
  child: Container(),
)
```

### Margin - Dış Boşluk

Margin, widget'in dışındaki boşluk (Container'da kullanılır).

```dart
Container(
  margin: const EdgeInsets.all(16),
  child: const Text('Metin'),
)
```

---

## 2.10 Responsive Tasarım

### MediaQuery ile Boyutu Almak

```dart
double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;

// Ortayıkçık boyutlandırma
double cardWidth = screenWidth > 600 ? 300 : 150;
```

### Flexible ve Expanded

```dart
// Flexible - Boş alan varsa kapla
Flexible(
  flex: 2,                                         // Oran
  child: Container(),
)

// Expanded - Kat'i olarak kapla
Expanded(
  flex: 1,
  child: Container(),
)
```

---

## 2.11 Sık Yapılan Tasarım Hataları

### ❌ Hata 1: Sonsuz Boyut

```dart
// Yanlış - ListView içinde Row/Column sonsuz boyut verir
ListView(
  children: [
    Row(
      children: [
        Expanded(child: Container()),
      ],
    ),
  ],
)

// Doğru
ListView(
  shrinkWrap: true,
  children: [
    Row(
      children: [
        Expanded(child: Container()),
      ],
    ),
  ],
)
```

### ❌ Hata 2: Overflow

```dart
// Yanlış - Text sınırı aşabilir
Row(
  children: [
    Text('Çok uzun metinler sorun oluşturur'),
  ],
)

// Doğru
Row(
  children: [
    Expanded(
      child: Text('Çok uzun metinler sorun oluşturur'),
    ),
  ],
)
```

---

## 📚 Kaynaklar

- [Flutter Widgets Catalog](https://flutter.dev/docs/development/ui/widgets)
- [Widget Tree Visualization](https://www.dartpad.dev)

---

## ✅ Bu Saatin Özeti

- Layout widget'lerini öğrendiniz (Column, Row, Stack)
- Container ve Card ile tasarım yaptınız
- Ürün kartları tasarımını uyguladınız
- ListView ve GridView kullandınız
- Responsive tasarım konseptlerini anladınız

**Tebrikler! Saat 2 tamamlandı! 🎉**

---

## Sonraki Saat

**SAAT 3: State Management**
- Stateful Widget'ler
- setState() Kullanımı
- İnteraktif Uygulamalar
