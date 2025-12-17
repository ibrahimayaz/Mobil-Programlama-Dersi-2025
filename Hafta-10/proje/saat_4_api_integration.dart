/*
SAAT 4: API ENTEGRASYONU VE HTTP İSTEKLERİ
============================================
Bu bölümde:
- HTTP paketini kullanma
- GET istekleri
- JSON parsing
- Model oluşturma
- FutureBuilder
- Error handling
*/

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
      title: 'API Entegrasyonu',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const PostsListPage(),
    );
  }
}

// ============================================
// MODEL: POST
// ============================================

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

  // Post'u JSON'a çevir
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

// ============================================
// UYGULAMA 1: PAYLAŞIMLAR LİSTESİ (GET)
// ============================================

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

  // API'den paylaşımları çek
  Future<List<Post>> fetchPosts() async {
    try {
      // HTTP GET isteği
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      // Status code kontrolü
      if (response.statusCode == 200) {
        // JSON'u parse et
        final List<dynamic> jsonData = jsonDecode(response.body);
        // List<Post>'a çevir
        return jsonData.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('Başarısız: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Hata: $e');
    }
  }

  // Veriyi yenile
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
          // Veri yükleniyor
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

          // Hata oluştu
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
                  Text(
                    'Hata: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: refreshData,
                    child: const Text('Yeniden Dene'),
                  ),
                ],
              ),
            );
          }

          // Veri başarıyla yüklendi
          if (snapshot.hasData) {
            final postsList = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                final post = postsList[index];
                return PostCard(post: post);
              },
            );
          }

          // Diğer durumlar
          return const Center(
            child: Text('Veri bulunamadı'),
          );
        },
      ),
    );
  }
}

// Post Kartı Widget'i
class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(post.id.toString()),
        ),
        title: Text(
          post.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          post.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailPage(post: post),
            ),
          );
        },
      ),
    );
  }
}

// Post Detay Sayfası
class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paylaşım Detayı'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ID
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('ID: ${post.id}'),
              ),
              const SizedBox(height: 16),

              // Başlık
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // İçerik
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  post.body,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // İstatistikler
              Row(
                children: [
                  Expanded(
                    child:
                        _buildStatCard('Kullanıcı ID', post.userId.toString()),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard('Paylaşım ID', post.id.toString()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// UYGULAMA 2: HAVA DURUMU (MOCK API)
// ============================================

class WeatherModel {
  final String city;
  final double temperature;
  final String condition;
  final int humidity;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['city'],
      temperature: json['temperature'],
      condition: json['condition'],
      humidity: json['humidity'],
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
  late Future<WeatherModel> weather;
  bool hasSearched = false;

  // Mock hava durumu veri
  Future<WeatherModel> fetchWeather(String city) async {
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
        'condition': 'Sunny',
        'humidity': 55,
      },
    };

    final data = mockData[city.toLowerCase()];
    if (data != null) {
      return WeatherModel.fromJson(data);
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
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                    ),
                    child: const Text('Ara'),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Sonuçlar
              if (hasSearched)
                FutureBuilder<WeatherModel>(
                  future: weather,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Yükleniyor...'),
                        ],
                      );
                    }

                    if (snapshot.hasError) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    }

                    if (snapshot.hasData) {
                      final w = snapshot.data!;
                      return Column(
                        children: [
                          // Şehir
                          Text(
                            w.city,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Sıcaklık
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.cloud_queue,
                                  size: 64,
                                  color: Colors.blue,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '${w.temperature.toStringAsFixed(1)}°C',
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  w.condition,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Nem
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.water_drop,
                                    color: Colors.blue),
                                const SizedBox(width: 12),
                                Text(
                                  'Nem: ${w.humidity}%',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                )
              else
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.cloud_off,
                        size: 64,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Bir şehir arayın',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================
// ALIŞTIRAMA 4: JSON PARSING
// ============================================

/*
GÖREV: Aşağıdaki uygulaması yapın:
1. API'den kullanıcı listesini çek
2. JSON'u parse et
3. User modelini oluştur
4. ListView'de göster
5. Detay sayfası ekle

API: https://jsonplaceholder.typicode.com/users

İPUCU:
- User modelini oluştur (name, email, phone)
- FutureBuilder kullan
- Error handling ekle
*/

class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
