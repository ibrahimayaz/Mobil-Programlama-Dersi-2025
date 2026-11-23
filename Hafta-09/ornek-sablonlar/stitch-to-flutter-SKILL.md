---
name: stitch-to-flutter
description: Google Stitch ile oluşturulan mobil arayüz tasarımlarını GEMINI.md tasarım sistemine tam uyumlu, taşmasız ve %100 Türkçe Flutter ekranlarına dönüştürür.
---

# Stitch → Flutter Dönüştürme Yeteneği (Örnek Skill)

Bu dosyayı VS Code'daki projenin `.gemini/skills/stitch-to-flutter/SKILL.md` yoluna kopyalayabilirsin. Gemini Code Assist (Agent Mode) ve Gemini CLI bu yeteneği otomatik algılar.

## Uygulama Adımları
1. Kullanıcının paylaştığı veya `tasarimlar/` klasöründeki Google Stitch ekran görüntüsünü ve varsa renk/tasarım özetini incele.
2. Proje kökündeki `GEMINI.md` dosyasındaki renk paleti, köşe yarıçapı (`16.0`) ve klasör kurallarını oku.
3. Yeni ekranı `lib/screens/` altında anlamlı, Türkçe bir dosya adıyla oluştur (örn. `duyurular_sayfasi.dart`).
4. Küçük ekranlarda (360px genişlik) taşma olmaması için `SingleChildScrollView`, `Expanded` ve `TextOverflow.ellipsis` korumasını ekle.
5. Liste veya dinamik içerik varsa mutlaka şık bir "Boş Durum (Empty State)" görünümü ekle.
6. Kodu yazdıktan sonra hata analizi yap ve öğrenciye 3 sade Türkçe maddede özet sun.
