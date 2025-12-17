/*
SAAT 3: STATE MANAGEMENT
========================
Bu bölümde:
- Stateful Widget
- setState() fonksiyonu
- State değişiklikleri
- İnteraktif uygulamalar
- Form yönetimi
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
      title: 'State Management',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const CounterApp(),
    );
  }
}

// ============================================
// UYGULAMA 1: SAYIÇI (COUNTER)
// ============================================

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // State değişkenleri
  int counter = 0;
  String message = '';
  List<int> history = [];

  // Counter'ı artırma
  void increment() {
    setState(() {
      counter++;
      history.add(counter);

      // Her 5'te bir tebrik mesajı
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
        history.add(counter);
        message = '';
      }
    });
  }

  // Counter'ı sıfırlama
  void reset() {
    setState(() {
      counter = 0;
      message = 'Sayaç sıfırlandı!';
      history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayıçı Uygulaması'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Başlık
              const Text(
                'Sayaç',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 24),

              // Büyük Sayı
              Text(
                counter.toString(),
                style: const TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
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
                  // Azalt Butonu
                  FloatingActionButton(
                    onPressed: decrement,
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.remove, size: 32),
                  ),
                  const SizedBox(width: 24),

                  // Sıfırla Butonu
                  FloatingActionButton(
                    onPressed: reset,
                    backgroundColor: Colors.grey,
                    child: const Icon(Icons.refresh, size: 32),
                  ),
                  const SizedBox(width: 24),

                  // Arttır Butonu
                  FloatingActionButton(
                    onPressed: increment,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.add, size: 32),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Geçmiş
              if (history.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Geçmiş',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        history.join(', '),
                        style: const TextStyle(fontSize: 12),
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
// UYGULAMA 2: FORM VE KULLANICI GİRİŞİ
// ============================================

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form değişkenleri
  String name = '';
  String email = '';
  String? selectedGender;
  bool agreeToTerms = false;
  String result = '';

  // Form gönderme
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Şartları kabul etmelisiniz')),
        );
        return;
      }

      _formKey.currentState!.save();

      // State'i güncelle
      setState(() {
        result = 'Hoş geldiniz $name!\n'
            'Email: $email\n'
            'Cinsiyet: $selectedGender';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hoş geldiniz $name!')),
      );
    }
  }

  // Form'u sıfırla
  void resetForm() {
    setState(() {
      _formKey.currentState!.reset();
      name = '';
      email = '';
      selectedGender = null;
      agreeToTerms = false;
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Formu'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ad Soyad
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ad Soyad',
                    hintText: 'Adınız ve soyadınız',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ad soyad giriniz';
                    }
                    if (value.length < 3) {
                      return 'En az 3 karakter olmalı';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value ?? '';
                  },
                ),
                const SizedBox(height: 16),

                // Email
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@email.com',
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

                // Cinsiyet Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Cinsiyet',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Cinsiyet seçiniz';
                    }
                    return null;
                  },
                  items: ['Erkek', 'Kadın', 'Diğer']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  onSaved: (value) {
                    selectedGender = value;
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

                // Butonlar
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Gönder'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: resetForm,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Temizle'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Sonuç
                if (result.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kayıt Başarılı!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          result,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================
// ALIŞTIRAMA 3: İNTERAKTİF TODO UYGULAMASI
// ============================================

/*
GÖREV: Aşağıdaki işlevselliğe sahip interactive todo uygulaması yapın:

1. Todo ekleme
2. Todo silme
3. Todo'yu tamamlandı işaretleme
4. Sayaçlar:
   - Toplam todo sayısı
   - Tamamlanan todo sayısı
   - Bekleyen todo sayısı
5. Tüm todo'ları temizle butonu

İPUCU: 
- Stateful widget kullanın
- List<TodoItem> içinde todos tutun
- setState() ile state güncellen
- ListTile widget'i ile todo gösterin
*/

class InteractiveTodoApp extends StatefulWidget {
  const InteractiveTodoApp({Key? key}) : super(key: key);

  @override
  State<InteractiveTodoApp> createState() => _InteractiveTodoAppState();
}

class _InteractiveTodoAppState extends State<InteractiveTodoApp> {
  final _controller = TextEditingController();
  List<InteractiveTodo> todos = [
    InteractiveTodo(id: 1, title: 'Flutter öğren', completed: false),
    InteractiveTodo(id: 2, title: 'Proje yap', completed: true),
  ];

  int nextId = 3;

  // Todo ekleme
  void addTodo(String title) {
    if (title.trim().isEmpty) return;

    setState(() {
      todos.add(
        InteractiveTodo(
          id: nextId++,
          title: title,
          completed: false,
        ),
      );
      _controller.clear();
    });
  }

  // Todo silme
  void deleteTodo(int id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  // Todo'yu tamamla/geri al
  void toggleTodo(int id) {
    setState(() {
      final todo = todos.firstWhere((t) => t.id == id);
      todo.completed = !todo.completed;
    });
  }

  // Tüm todo'ları sil
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
        elevation: 0,
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
            child: todos.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.task_alt,
                            size: 64, color: Colors.grey.shade300),
                        const SizedBox(height: 16),
                        Text(
                          'Todo bulunmuyor',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
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
                              fontSize: 16,
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

class InteractiveTodo {
  final int id;
  final String title;
  bool completed;

  InteractiveTodo({
    required this.id,
    required this.title,
    required this.completed,
  });
}
