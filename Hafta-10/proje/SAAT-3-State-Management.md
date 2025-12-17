# SAAT 3: State Management

## 📌 Bu Saatin Hedefleri

- ✅ State Management nedir anlamak
- ✅ Stateful Widget oluşturmak
- ✅ setState() kullanmak
- ✅ Form yönetimi
- ✅ İnteraktif uygulamalar geliştirmek

---

## 3.1 State Nedir?

**State**, uygulamanızın zamanla değişebilen verileridir.

### Örnek

```dart
// Sayaç uygulaması
int counter = 0;              // Bu bir state'tir

// Buton tıklandığında
counter++;                    // State değişti
// UI güncellenmelidir
```

### State Türleri

| Tür | Açıklama | Örnek |
|-----|----------|--------|
| **Ephemeral State** | Tek widget içinde kalır | TextField'in text değeri |
| **App State** | Tüm uygulama içinde paylaşılır | Kullanıcı oturumu, sepet |

---

## 3.2 Stateless vs Stateful Widget

### Stateless Widget - Durumu Olmayan

```dart
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Durumu yok');  // Her zaman aynı
  }
}
```

### Stateful Widget - Durumu Olan

```dart
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;                      // State

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $counter');   // Değişebilir
  }
}
```

---

## 3.3 setState() Fonksiyonu

`setState()` çağrıldığında, Flutter widget'i yeniden oluşturur (rebuild) ve UI güncellenir.

```dart
void increment() {
  setState(() {
    counter++;                          // State güncellenirse
  });                                   // Widget rebuild edilir
}
```

### setState() Sağlama Kuralları

```dart
// ✅ Doğru - setState() içinde state güncellemesi
setState(() {
  counter++;
});

// ✅ Doğru - setState() içinde hesaplama
setState(() {
  total = items.fold(0, (sum, item) => sum + item.price);
});

// ❌ Yanlış - Async işlem
setState(() async {
  data = await fetchData();   // Bunu yapma!
});

// ❌ Yanlış - setState() dışında güncelleme
counter++;                    // Bu UI güncellenmez
setState(() {});
```

---

## 3.4 Sayıçı Uygulaması

Pratik örnek: Basit bir sayıçı uygulaması.

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
      title: 'Sayıçı',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // State değişkenleri
  int counter = 0;
  String message = '';

  // Counter'ı artırma
  void increment() {
    setState(() {
      counter++;
      
      // Her 5'te bir mesaj göster
      if (counter % 5 == 0) {
        message = 'Harika! $counter sayısına ulaştın! 🎉';
      } else {
        message = '';
      }
    });
  }

  // Counter'ı azaltma
  void decrement() {
    setState(() {
      if (counter > 0) {
        counter--;
        message = '';
      }
    });
  }

  // Counter'ı sıfırlama
  void reset() {
    setState(() {
      counter = 0;
      message = 'Sayaç sıfırlandı!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayıçı Uygulaması'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sayaç',
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            
            Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 96,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),
            
            // Mesaj
            if (message.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 48),
            
            // Butonlar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Azalt
                FloatingActionButton(
                  onPressed: decrement,
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.remove, size: 32),
                ),
                const SizedBox(width: 24),
                
                // Sıfırla
                FloatingActionButton(
                  onPressed: reset,
                  backgroundColor: Colors.grey,
                  child: const Icon(Icons.refresh, size: 32),
                ),
                const SizedBox(width: 24),
                
                // Arttır
                FloatingActionButton(
                  onPressed: increment,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add, size: 32),
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

## 3.5 Form Yönetimi ve Validasyon

### Form Widget'i ile Girdi Yönetimi

```dart
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Form alanları
  String email = '';
  String password = '';
  bool agreeToTerms = false;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Şartları kabul etmelisiniz')),
        );
        return;
      }

      // Form geçerli
      _formKey.currentState!.save();
      
      // Verilerle işlem yap
      print('Email: $email');
      print('Password: $password');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hoş geldiniz $email!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giriş Yap')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email giriniz';
                    }
                    if (!value.contains('@')) {
                      return 'Geçerli email giriniz';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value ?? '';
                  },
                ),
                const SizedBox(height: 16),

                // Şifre
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Şifre giriniz';
                    }
                    if (value.length < 6) {
                      return 'En az 6 karakter olmalı';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value ?? '';
                  },
                ),
                const SizedBox(height: 16),

                // Checkbox
                CheckboxListTile(
                  title: const Text('Şartları ve Koşulları Kabul Ediyorum'),
                  value: agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      agreeToTerms = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Buton
                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Giriş Yap'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## 3.6 TextFormField Validasyonu

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Ad Soyad',
    border: OutlineInputBorder(),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan boş olamaz';
    }
    if (value.length < 3) {
      return 'En az 3 karakter olmalı';
    }
    return null;  // Geçerli
  },
)
```

### Validator Türleri

| Kontrol | Kod |
|---------|-----|
| Boş mu? | `if (value?.isEmpty ?? true)` |
| Uzunluk | `if (value!.length < 6)` |
| İçerik | `if (!value!.contains('@'))` |
| Sayı | `if (int.tryParse(value!) == null)` |

---

## 3.7 Alıştırma 3: İnteraktif Todo Uygulaması

### Görev

Aşağıdaki işlevselliğe sahip todo uygulaması yapın:

1. **Todo Ekleme** - TextField ve buton ile
2. **Todo Silme** - Sil butonu ile
3. **Tamamlandı İşaretleme** - Checkbox ile
4. **İstatistikler**:
   - Toplam todo sayısı
   - Tamamlanan sayısı
   - Bekleyen sayısı
5. **Tüm Todo'ları Temizle** - Buton ile

### İpuçları

- Stateful widget kullanın
- `List<Todo>` içinde veriler tutun
- `setState()` ile güncelleyin
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
      home: const TodoApp(),
    );
  }
}

class Todo {
  final int id;
  final String title;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final _controller = TextEditingController();
  List<Todo> todos = [];
  int nextId = 1;

  void addTodo(String title) {
    if (title.trim().isEmpty) return;

    setState(() {
      todos.add(Todo(
        id: nextId++,
        title: title,
        completed: false,
      ));
      _controller.clear();
    });
  }

  void deleteTodo(int id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  void toggleTodo(int id) {
    setState(() {
      final todo = todos.firstWhere((t) => t.id == id);
      todo.completed = !todo.completed;
    });
  }

  void clearAll() {
    setState(() {
      todos.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    int completed = todos.where((t) => t.completed).length;
    int pending = todos.length - completed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Uygulaması'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // İstatistikler
          Container(
            color: Colors.teal.shade50,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat('Toplam', todos.length, Colors.blue),
                _buildStat('Tamamlanan', completed, Colors.green),
                _buildStat('Bekleyen', pending, Colors.orange),
              ],
            ),
          ),

          // Giriş alanı
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Yeni todo ekle...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.add),
                    ),
                    onSubmitted: addTodo,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => addTodo(_controller.text),
                  child: const Text('Ekle'),
                ),
              ],
            ),
          ),

          // Todo listesi
          Expanded(
            child: todos.isEmpty
                ? const Center(
                    child: Text('Todo bulunmuyor'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: Checkbox(
                            value: todo.completed,
                            onChanged: (_) => toggleTodo(todo.id),
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
                            onPressed: () => deleteTodo(todo.id),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Temizle butonu
          if (todos.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: clearAll,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: const Text(
                    'Tüm Todo\'ları Sil',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
```

---

## 📚 Kaynaklar

- [Stateful Widget Documentation](https://flutter.dev/docs/development/ui/interactive)
- [Form Validation Guide](https://flutter.dev/docs/cookbook/forms)

---

## ✅ Bu Saatin Özeti

- State Management konseptini anladınız
- Stateful widget oluşturdunuz
- setState() kullanımını öğrendiniz
- Form validasyonu yaptınız
- İnteraktif uygulamalar geliştirdiniz

**Tebrikler! Saat 3 tamamlandı! 🎉**

---

## Sonraki Saat

**SAAT 4: API Entegrasyonu ve HTTP İstekleri**
- HTTP paketinin kurulumu
- GET ve POST istekleri
- JSON parsing
- FutureBuilder
