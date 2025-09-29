# Mobil Programlama Dersi 2025 (Dart & Flutter)

Bu repository 14 haftalık bir Mobil Programlama (Dart & Flutter) dersi içindir. Aşağıda ilk 7 haftanın tamamlanmış içerik özetleri ve dosya bağlantıları güncellenmiştir. İlerleyen haftalarda Flutter ağırlığı artacaktır.

## 🎯 Genel Hedefler
- Dart dilinin temellerini güvenle kullanabilmek
- Veri yapıları (List, Set, Map) ve algoritmik düşünmeyi pekiştirmek
- Temiz, optimize, tekrar kullanılabilir kod yazma alışkanlığı kazanmak
- 7. haftaya kadar sağlam Dart temelini hazırlamak ve 8. haftadan itibaren Flutter bileşenlerine geçmek

## 🗂 Haftalara Göre Durum (1–7)
| Hafta | Konu Odak Alanı | İçerik / Öne Çıkanlar | Klasör |
|-------|-----------------|-----------------------|--------|
| 1 | Giriş, Temel Sözdizimi | Değişkenler, tipler, basit I/O | `Hafta-01/` |
| 2 | Kontrol Akışı | if/else, switch, karşılaştırmalar, basit problemlere uygulama | `Hafta-02/` |
| 3 | Fonksiyonlar | Parametre, geri dönüş, expression body, küçük yardımcı fonksiyonlar | `Hafta-03/` |
| 4 | Koleksiyon Girişi | List temelleri, iterable mantığı, for-in, temel algoritmalar | `Hafta-04/` |
| 5 | List Gelişmiş + Set/Map’e Giriş | Liste işlemleri, filtreleme, reduce/fold kavramları | `Hafta-05/` |
| 6 | Set & Map Yoğun Pratik | Benzersiz veri, frekans analizi, birleşim/kesişim, Map filtreleme | `Hafta-06/` |
| 7 | Genel Tekrar + 25 Soru | Performanslı paternler, mini algoritmalar, soru-cevap blokları | `Hafta-07/` |

> Not: 6. haftanın içeriği orijinal taslaktaki “OOP” yerine veri yapıları pratikleri ile güçlendirildi. OOP konuları 8–9’a kaydırılabilir veya ayrı ek dokümanda sunulabilir.

## 📚 İlk 7 Haftadan Öne Çıkan Dosyalar
Aşağıdaki haftalar için özellikle oluşturulmuş içerikler:

### Hafta 06
- [Alıştırmalar](Hafta-06/alistirmalar.md): Set ve Map ile temel problemler
- [Ödev](Hafta-06/odev.md): Map filtreleme, frekans, ortalama, etiket sistemi
- Örnek Kodlar (`Hafta-06/ornek-kodlar/`):
  - set_benzersiz_isimler.dart
  - set_kontrol.dart
  - map_ogrenci.dart
  - map_harf_frekans.dart
  - map_not_ortalama.dart

### Hafta 07
- [Genel Tekrar Notu](Hafta-07/ders-notu.md): Özet paternler (frekans, filtre, ortalama, en büyük)
- [25 Soru ve Çözüm](Hafta-07/sorular-ve-cevaplar.md): Ortalama, palindrome, fibonacci, tekrar analizleri vb.

## 🧪 Kod Tarzı ve Optimizasyon İlkeleri
| İlke | Açıklama | Örnek |
|------|----------|-------|
| Tek geçiş | Gereksiz ikinci döngü fazlalığını azalt | Set ile tekrar tespiti |
| Null güvenliği | `??`, `??=` tercih et | `m[k] = (m[k] ?? 0) + 1` |
| İfade (expression) fonksiyonlar | Okunabilirliği artırır | `int kare(x) => x * x;` |
| Koleksiyon if / for | Daha temiz filtreleme | `[for (final s in l) if (s>0) s]` |
| Map comprehension | Filtreli yeni Map üret | `{for (final e in m.entries) if (e.value>80) e.key: e.value}` |
| Tek sorumluluk | Fonksiyonları dar tut | Frekans fonksiyonu sadece sayım yapar |

## 🔄 8. Haftadan Sonra Planlanan (Önizleme)
| Hafta | Planlanan İçerik |
|-------|------------------|
| 8 | Flutter Temelleri: Widget yapısı, MaterialApp, Scaffold |
| 9 | Stateful vs Stateless, State Yönetimine Giriş |
| 10 | Navigasyon ve Route Yapıları |
| 11 | HTTP / JSON, async/await, future yapıları |
| 12 | Lokal Depolama (SQLite / shared_prefs) |
| 13 | Proje Yapılandırma, Yayına Hazırlık |
| 14 | Final Proje Sunumları |

> Gerekirse 8–9 arasına OOP (class, constructor, inheritance, encapsulation) Dart saf anlatımı eklenebilir.

## 🚀 Hızlı Başlangıç
```bash
git clone https://github.com/ibrahimayaz/Mobil-Programlama-Dersi-2025.git
cd Mobil-Programlama-Dersi-2025
flutter pub get
flutter run
```

## ✅ Öğrenciler İçin Tavsiyeler
- Örnekleri değiştirip aynı problemi 2 farklı yolla çözmeyi deneyin.
- 25 soruluk seti zaman tutarak çözün (hedef < 45 dk).
- Kendi frekans / filtre fonksiyonlarınızı yazıp kıyaslayın.
- Kod tekrarını azaltmak için ortak fonksiyonları ayıklayın.

## 💡 Katkı
Pull request ile ek soru, farklı çözüm veya performans analizi ekleyebilirsiniz.

## 📝 Lisans
Eğitim amaçlı kullanıma açıktır.

---
Hazır: İlk 7 hafta Dart temelinizi güçlendirdi. Sonraki aşama: Flutter ile görsel dünyaya geçiş! İyi çalışmalar. 💪