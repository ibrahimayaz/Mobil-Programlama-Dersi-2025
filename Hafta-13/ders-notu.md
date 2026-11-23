# 📋 Hafta 13 — Hızlı Başvuru ve Prompt Kartı (Koyu Mod, Animasyon, İkon & Splash)

> Bu dosya, [Hafta 13 Ana Ders Dokümanı](README.md) için hızlı kopyala-yapıştır özetidir.

## 1. Stitch Koyu Mod & Mikro Animasyon Prompt'u
```text
@tasarimlar/koyu_mod_stitch.png görseline uygun Koyu Mod ekle:
- Üst çubuğa Açık/Koyu tema geçiş anahtarı koy ve tercihi SharedPreferences ile sakla.
- Kart geçişlerinde yumuşak AnimatedContainer kullan.
```

## 2. Özel İkon & Splash Ekranı Prompt'u
```text
Android uygulama adını Türkçe proje adım yap, `assets/icon/app_icon.png` dosyasını `flutter_launcher_icons` ile ikon olarak ayarla ve 1.5 saniyelik yumuşak bir Splash ekranı ekle.
```

## 3. Bu Haftanın Mikro-Git Komutları (`restore` & `pull`)
```bash
git restore lib/screens/ana_sayfa.dart   # Bozulan dosyayı anında kurtar
git pull                                 # Buluttan güncel kodu çek
git add .
git commit -m "Hafta 13: Koyu Mod, animasyon, ikon ve Splash eklendi"
git push
```
