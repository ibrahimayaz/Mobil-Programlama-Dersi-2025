# Hafta-13 - Ağ İstekleri (HTTP) ve JSON İşleme

Konu: `http` paketi ile GET/POST, JSON parse etme (`dart:convert`), `FutureBuilder` ile asenkron veri gösterme.

Hedef: Bir API'den veri çekip liste halinde göstermek.

## Örnek 1 — Basit GET isteği

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchPosts() async {
  final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  return jsonDecode(res.body);
}
```

## Örnek 2 — `FutureBuilder` ile veri gösterme

```dart
FutureBuilder<List>(
  future: fetchPosts(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
    if (snapshot.hasError) return Text('Hata');
    final posts = snapshot.data!;
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, i) => ListTile(title: Text(posts[i]['title'])),
    );
  },
)
```

## Örnek 3 — POST isteği

```dart
Future<void> createPost(Map data) async {
  final res = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  print(res.statusCode);
}
```

## Örnek 4 — Model sınıfı ile parse

```dart
class Post {
  final int id;
  final String title;
  Post({required this.id, required this.title});
  factory Post.fromJson(Map<String, dynamic> json) => Post(id: json['id'], title: json['title']);
}

// Kullanım: Post.fromJson(jsonMap)
```

## Örnek 5 — Hata yönetimi ve zaman aşımı

```dart
try {
  final res = await http.get(Uri.parse('...')).timeout(Duration(seconds: 5));
} catch (e) {
  // timeout veya network hatası
}
```

---

Notlar:
- `http` paketinin asenkron yapısını anlamak önemlidir. UI bloklamamak için `Future`/`async` kullanın.
- Gerçek projelerde servis katmanı (repository) ve hata işleme stratejisi oluşturun.
