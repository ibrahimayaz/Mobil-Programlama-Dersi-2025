# SAAT 4: API Entegrasyonu ve HTTP İstekleri

## 📌 Bu Saatin Hedefleri

- ✅ HTTP paketini öğrenmek
- ✅ API'den veri çekmek (GET)
- ✅ JSON parsing yapmak
- ✅ Model sınıfları oluşturmak
- ✅ FutureBuilder kullanmak
- ✅ Hata yönetimi yapmak

---

## 4.1 HTTP Paketi Kurulumu

### pubspec.yaml'ye Bağımlılık Ekle

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5
```

### Terminal'de Paketi Yükle

```bash
flutter pub get
# veya
flutter pub upgrade
```

---

## 4.2 Temel HTTP İsteği

### GET İsteği

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData() async {
  try {
    // HTTP GET isteği
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );

    // Status code kontrolü
    if (response.statusCode == 200) {
      // JSON'u parse et
      final json = jsonDecode(response.body);
      print('Başlık: ${json['title']}');
    } else {
      print('Hata: ${response.statusCode}');
    }
  } catch (e) {
    print('İstek hatası: $e');
  }
}
```

---

## 4.3 Model Sınıfı Oluşturma

API'den gelen JSON verilerini yönetmek için model sınıfı oluşturmalısınız.

### JSON Örneği

```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident",
  "body": "quia et suscipit..."
}
```

### Model Sınıfı

```dart
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // JSON'dan Post oluştur
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Post'u JSON'a çevir (API'ye gönderirken)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
```

---

## 4.4 Veri Çekme Fonksiyonu

```dart
Future<List<Post>> fetchPosts() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      // JSON array'i parse et
      final List<dynamic> jsonData = jsonDecode(response.body);
      
      // List<Post>'a çevir
      return jsonData.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('API hatası: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('İstek hatası: $e');
  }
}
```

---

## 4.5 FutureBuilder Widget'i

`FutureBuilder`, asenkron işlemin sonucunu göstermek için kullanılır.

```dart
FutureBuilder<List<Post>>(
  future: fetchPosts(),
  builder: (context, snapshot) {
    // Yükleniyor
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Hata oluştu
    if (snapshot.hasError) {
      return Center(
        child: Text('Hata: ${snapshot.error}'),
      );
    }

    // Veri başarıyla yüklendi
    if (snapshot.hasData) {
      final posts = snapshot.data!;
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
          );
        },
      );
    }

    // Başka durumlar
    return const Center(child: Text('Veri bulunamadı'));
  },
)
```

### FutureBuilder State'leri

| State | Açıklama |
|-------|----------|
| `ConnectionState.waiting` | Veri yükleniyor |
| `ConnectionState.done` | İşlem tamamlandı |
| `snapshot.hasData` | Veri var mı? |
| `snapshot.hasError` | Hata var mı? |
| `snapshot.error` | Hata mesajı |

---

## 4.6 Paylaşımlar Listesi - Tam Örnek

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Örneği',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const PostsListPage(),
    );
  }
}

// Post Modeli
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// Paylaşımlar Sayfası
class PostsListPage extends StatefulWidget {
  const PostsListPage({Key? key}) : super(key: key);

  @override
  State<PostsListPage> createState() => _PostsListPageState();
}

class _PostsListPageState extends State<PostsListPage> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('API Hatası');
      }
    } catch (e) {
      throw Exception('Hata: $e');
    }
  }

  void refreshData() {
    setState(() {
      posts = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paylaşımlar'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refreshData,
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Yükleniyor...'),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text('Hata: ${snapshot.error}'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: refreshData,
                    child: const Text('Yeniden Dene'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            final postsList = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                final post = postsList[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(post.id.toString()),
                    ),
                    title: Text(
                      post.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Detay sayfasına git
                    },
                  ),
                );
              },
            );
          }

          return const Center(child: Text('Veri bulunamadı'));
        },
      ),
    );
  }
}
```

---

## 4.7 POST İsteği Gönderme

```dart
Future<void> createPost() async {
  try {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': 'Yeni Paylaşım',
        'body': 'Bu yeni bir paylaşımdır',
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {
      print('Başarıyla oluşturuldu');
      final json = jsonDecode(response.body);
      print('ID: ${json['id']}');
    } else {
      throw Exception('POST hatası');
    }
  } catch (e) {
    print('Hata: $e');
  }
}
```

---

## 4.8 PUT İsteği (Güncelleme)

```dart
Future<void> updatePost(int id) async {
  try {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': id,
        'title': 'Güncellenmiş Başlık',
        'body': 'Güncellenmiş içerik',
        'userId': 1,
      }),
    );

    if (response.statusCode == 200) {
      print('Başarıyla güncellendi');
    }
  } catch (e) {
    print('Hata: $e');
  }
}
```

---

## 4.9 DELETE İsteği (Silme)

```dart
Future<void> deletePost(int id) async {
  try {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    );

    if (response.statusCode == 200) {
      print('Başarıyla silindi');
    }
  } catch (e) {
    print('Hata: $e');
  }
}
```

---

## 4.10 Hata Yönetimi

```dart
Future<List<Post>> fetchPostsWithErrorHandling() async {
  try {
    // Timeout ayarla
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    ).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((post) => Post.fromJson(post)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Kaynak bulunamadı');
    } else if (response.statusCode == 500) {
      throw Exception('Server hatası');
    } else {
      throw Exception('HTTP ${response.statusCode}');
    }
  } on SocketException {
    throw Exception('İnternet bağlantısı yok');
  } on TimeoutException {
    throw Exception('İstek zaman aşımına uğradı');
  } catch (e) {
    throw Exception('Beklenmedik hata: $e');
  }
}
```

---

## 4.11 Alıştırma 4: Hava Durumu Uygulaması

### Görev

OpenWeatherMap API'den hava durumu bilgisi çeken uygulama yapın:

1. **Arama**: Şehir adı girin
2. **Sıcaklık**: Sıcaklık gösterin
3. **Durum**: Hava durumu gösterin
4. **Nem**: Nem yüzdesini gösterin
5. **Hata**: API hatalarını kontrol edin

### İpuçları

- Mock API veya JSONPlaceholder kullanabilirsiniz
- FutureBuilder ile sonuç gösterin
- Validasyon ekleyin
- Error handling yapın

### Basit Çözüm (Mock API)

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
      title: 'Hava Durumu',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _cityController = TextEditingController();
  late Future<Map<String, dynamic>> weather;
  bool hasSearched = false;

  // Mock hava durumu veri
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    await Future.delayed(const Duration(seconds: 1));

    final mockData = {
      'istanbul': {
        'city': 'İstanbul',
        'temperature': 22.5,
        'condition': 'Bulutlu',
        'humidity': 65,
      },
      'ankara': {
        'city': 'Ankara',
        'temperature': 18.3,
        'condition': 'Açık',
        'humidity': 45,
      },
      'izmir': {
        'city': 'İzmir',
        'temperature': 24.1,
        'condition': 'Güneşli',
        'humidity': 55,
      },
    };

    final data = mockData[city.toLowerCase()];
    if (data != null) {
      return data;
    } else {
      throw Exception('Şehir bulunamadı');
    }
  }

  void searchWeather() {
    if (_cityController.text.isEmpty) return;

    setState(() {
      weather = fetchWeather(_cityController.text);
      hasSearched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hava Durumu'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Arama alanı
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        hintText: 'Şehir adı girin...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.location_city),
                      ),
                      onSubmitted: (_) => searchWeather(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: searchWeather,
                    child: const Text('Ara'),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Sonuçlar
              if (hasSearched)
                FutureBuilder<Map<String, dynamic>>(
                  future: weather,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text(
                        'Hata: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      );
                    }

                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          Text(
                            data['city'],
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            '${data['temperature']}°C',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            data['condition'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Nem: ${data['humidity']}%',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                )
              else
                const Text('Bir şehir arayın'),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 📚 Kaynaklar

- [HTTP Package Documentation](https://pub.dev/packages/http)
- [JSONPlaceholder - API Testi](https://jsonplaceholder.typicode.com)
- [Dart JSON Serialization](https://dart.dev/guides/libraries/library-tour#dartconvert)

---

## ✅ Bu Saatin Özeti

- HTTP paketini kurdum ve kullandım
- GET, POST, PUT, DELETE istekleri yaptım
- JSON parsing yaptım
- Model sınıfları oluşturadum
- FutureBuilder kullanımını öğrendim
- Hata yönetimi yaptım

**Tebrikler! Saat 4 tamamlandı! 🎉**

---

## Sonraki Saat

**SAAT 5: İleri Seviye Widget'ler ve Animasyonlar**
- Navigation (Push/Pop)
- Animasyonlar
- PageView ve TabBar
