# KampüsCep — Proje Kuralları (Örnek GEMINI.md Şablonu)

Bu dosyayı VS Code'daki kendi Flutter projenin en ana klasörüne `GEMINI.md` adıyla kopyalayıp kendi uygulama adına ve Stitch renk kodlarına göre güncelleyebilirsin.

## 1. Uygulama Kimliği
- **Uygulama Adı:** KampüsCep (Üniversite Öğrenci Asistanı)
- **Hedef Kitle:** Mobil uygulama geliştirme dersi öğrencileri
- **Dil Kuralı:** Tüm ekran başlıkları, butonlar, hata mesajları, boş durum metinleri ve örnek veriler **%100 Türkçe** olmalıdır.

## 2. Görsel Tasarım Sistemi (Google Stitch Referansı)
- **Tasarım Dili:** Material 3 (`useMaterial3: true`)
- **Ana Renk (Primary):** Indigo (`#4F46E5`)
- **Vurgu Rengi (Accent):** Zümrüt Yeşili (`#10B981`)
- **Hata / Uyarı Rengi:** Gül Kırmızısı (`#F43F5E`)
- **Açık Tema Arka Plan:** `#F8FAFC`
- **Koyu Tema Arka Plan:** `#0F172A`, Kart Yüzeyi: `#1E293B`
- **Köşe Yarıçapı:** Kartlarda `16.0`, butonlarda `12.0`
- **Kenar Boşluğu:** Ekran genelinde `16.0`

## 3. Mimari ve Kod Standartları
- Ekran dosyaları `lib/screens/` klasöründe tutulur.
- Ortak kullanılan kart/buton bileşenleri `lib/widgets/` klasörüne ayrılır.
- API ve yerel depolama işlemleri `lib/services/` klasöründe yer alır.
- Uzun metinlerde `Expanded` ve `TextOverflow.ellipsis` kullanılarak küçük telefon ekranlarında taşma (overflow) engellenir.
- Veri beklenen her ekranda: **Yükleniyor**, **Boş Durum** ve **Hata / Tekrar Dene** durumları mutlaka eklenir.
- Değişiklik sonunda öğrenciye ne yapıldığı 3 kısa Türkçe madde ile açıklanır.
