# 📋 Hafta 14 — Hızlı Başvuru ve Final Kontrol Kartı (APK & GitHub Release)

> Bu dosya, [Hafta 14 Ana Ders Dokümanı](README.md) için hızlı kopyala-yapıştır özetidir.

## 1. Test & Android APK Derleme (VS Code Terminal)
```bash
flutter clean
flutter pub get
flutter test
flutter build apk --release
# Çıktı: build/app/outputs/flutter-apk/app-release.apk
```

## 2. Resmi Sürüm Etiketi (`v1.0.0`) ve GitHub Release
```bash
git add .
git commit -m "Hafta 14: Portfolyo README ve final sürüm tamamlandı"
git push
git tag v1.0.0
git push --tags
```
Ardından GitHub → **Releases** → **Draft a new release** → `v1.0.0` seç → `app-release.apk` dosyasını yükle → **Publish release**!

## 3. 5 Dakikalık Final Sunumu Akışı
1. **Problem & Fikir** (45 sn)
2. **Google Stitch + `GEMINI.md` & `.gemini/skills/` Süreci** (1 dk)
3. **Gerçek Telefonda Canlı Demo** (2 dk)
4. **AI Debugging & `flutter test` Deneyimi** (45 sn)
5. **GitHub Vitrini & `v1.0.0` APK Release** (30 sn)
