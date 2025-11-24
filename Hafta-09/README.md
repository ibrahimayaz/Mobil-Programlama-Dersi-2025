# Flutter'a Giriş

Bu doküman Flutter hakkında kapsamlı bir giriş sunar: Flutter nedir, hangi sorunları çözer, çevrimiçi ücretsiz ve ücretli araçlar/derleyiciler (editörler ve build hizmetleri) hangileridir, ve son olarak Flutter SDK kurulumu adım adım (özellikle Windows için detaylı). İçerik eğitim amaçlı hazırlanmıştır ve başlangıçtan orta seviyeye doğru ilerleyen fikirler içerir.

## Flutter nedir? Kısa tanım

Flutter, Google tarafından geliştirilen açık kaynaklı bir UI (kullanıcı arayüzü) yazılım geliştirme kitidir (SDK). Flutter ile tek bir kod tabanı kullanarak Android, iOS, web, Windows, macOS ve Linux için yerel benzeri (native-like) uygulamalar geliştirilebilir. Flutter uygulamaları Dart programlama dili ile yazılır. Flutter'ın farkı, widget tabanlı (UI öğeleri) bir yaklaşım kullanması ve kendi render motorunu (Skia) kullanarak tutarlı ve yüksek performanslı arayüzler üretmesidir.

### Neden Flutter?
- Tek kod tabanı ile çoklu platform hedefleme (mobil + web + masaüstü).
- Hızlı geliştirme: `Hot Reload` sayesinde kod değişikliklerini anında görme.
- Zengin widget seti ve özelleştirilebilir tasarım imkânları.
- Yüksek performans: Flutter doğrudan GPU üzerinde çizim yapar.

### Flutter mimarisi (kısaca)
- Dart dilinde yazılır.
- Framework: Widget ağacı (widget tree) — UI tamamen widget'lardan oluşur.
- Engine: Skia tabanlı render motoru; platformdan bağımsız çizim sağlar.
- Platform köprüsü: Platforma özgü API'lerle (kamera, konum, dosya sistemi vb.) iletişim için platform kanalları (platform channels) kullanılır.

## Özet: Flutter ile neler yapabilirsiniz?
- Mobil uygulamalar (Android, iOS)
- Web uygulamaları (Flutter Web)
- Masaüstü uygulamaları (Windows, macOS, Linux)
- Gömülü cihazlar (deneysel destek)

---

## Çevrimiçi araçlar, editörler ve derleyici/CI servisleri
Aşağıda Flutter geliştirme sürecinde kullanılabilecek bazı çevrimiçi araçlar, editörler ve build/CI hizmetleri listelenmiştir. "Ücretsiz"/"ücretli" ifadeleri genel kullanım modellerine dayanmaktadır; fiyatlandırma zaman içinde değişebilir — ayrıntı için hizmet sağlayıcının resmi sayfasına bakın.

### Ücretsiz / Açık kaynak çevrimiçi araçlar
- DartPad (https://dartpad.dev)
  - Google tarafından sağlanan resmi çevrimiçi editördür. DartPad, basit Flutter örneklerini çalıştırmak için kullanılabilir (özellikle Flutter Web örnekleri). Hızlı prototipleme ve kısa kod parçacıkları denemek için idealdir. Tam teşekküllü yerel derleme ve mobil cihaz emülasyonu sağlamaz.
- Replit (https://replit.com)
  - Replit üzerinde topluluk tarafından sağlanan Flutter şablonları mevcuttur; Flutter web projelerini çalıştırmak mümkündür. Ücretsiz bir katmanı vardır; sürekli kullanım ya da özel kaynaklar için ücretli planlar bulunur.
- Gitpod (https://gitpod.io)
  - Gitpod, bir repo için çevrimiçi geliştirme ortamı oluşturur (dev container). Flutter SDK kurulumu yapılmış bir container yapılandırması ile tarayıcı tabanlı geliştirme yapabilirsiniz. Gitpod üst düzeyde özelleştirilebilir ama kesintisiz kullanım için ücretli planları vardır; açık kaynak projeler için ücretsiz kullanım imkanı olabilir.
- Flutlab.io (https://flutlab.io)
- Flutlab.io (https://flutlab.io)
    - Flutlab.io, tarayıcı üzerinden Flutter projeleri oluşturup düzenleyebileceğiniz çevrimiçi bir IDE'dir. Kendi Flutter kodunuzu yazabilir, projeleri build edebilir ve web üzerinde anında önizleme yapabilirsiniz. Flutlab, temel özellikler için ücretsiz bir plan sunar; daha gelişmiş build seçenekleri, özel domain ve ek kaynaklar için ücretli planlar mevcuttur. Özellikle bilgisayara Flutter kurmadan hızlıca denemeler yapmak veya eğitim amaçlı projeler geliştirmek için uygundur. Proje dosyalarını dışa aktarabilir ve yerel geliştirme ortamınıza taşıyabilirsiniz. 

### Ücretsiz/Ücretli karışık veya ücretli araçlar
- FlutterFlow (https://flutterflow.io)
  - FlutterFlow, sürükle-bırak (drag-and-drop) bir görsel uygulama oluşturucusudur; tasarımcılar/ürün odaklı geliştirmeler için uygundur. Ücretsiz bir deneme/başlangıç planı olduğu gibi, gelişmiş özellikler ve doğrudan üretime deploy seçenekleri ücretlidir.
- Codemagic (https://codemagic.io)
  - Codemagic Flutter için popüler bir CI/CD (sürekli entegrasyon ve dağıtım) hizmetidir. GitHub/GitLab/Bitbucket ile entegre olur ve otomatik build, test, release süreçleri sağlar. Ücretsiz bir katmanı ve ücretli planları vardır.
- GitHub Codespaces
  - Codespaces ile özelleştirilmiş dev container'lar içinde Flutter kurulumu yaparak tarayıcı tabanlı geliştirme gerçekleştirilebilir. GitHub Codespaces ücretlidir ancak belirli kullanıcılar/organizasyonlar için kredi/ücretsiz kullanım olabilir.

### Notlar ve tavsiyeler
- Çevrimiçi editörler hızlı prototipleme için uygundur, ancak gerçek cihaz testi, emülatör kullanımı, paket/plug-in yükleme ve mağaza (Play Store / App Store) için genellikle yerel geliştirme ortamı gereklidir.
- CI/CD hizmetleri (Codemagic, GitHub Actions, Bitrise vb.) uygulamanızı otomatik olarak derlemek, test etmek ve mağazaya ya da beta dağıtım platformlarına göndermek için kritik öneme sahiptir.

---

## Flutter SDK kurulumu (detaylı) — Windows odaklı rehber
Aşağıda Windows üzerinde Flutter SDK kurulumu için adım adım yönergeler yer almaktadır. Eğer macOS veya Linux kullanıyorsanız da benzer adımlar uygulanır; ancak iOS geliştirme için macOS gereklidir.

### 1) Sistem önkoşulları
- Git: Flutter SDK'yı indirmek ve bazı araçları çalıştırmak için Git yüklü olmalıdır.
- Disk alanı: Flutter SDK, Android SDK, emülatörler için yeterli disk alanı sağlanmalıdır.
- Windows 10/11 önerilir.

Git yüklemek için: https://git-scm.com adresinden Windows installer indirip kurun.

### 2) Flutter SDK indirme
1. Flutter'ın resmi indirme sayfasına gidin: https://flutter.dev
2. "Get started" → "Windows" adımlarını takip edin.
3. İndirilen `.zip` dosyasını tercih ettiğiniz bir klasöre açın (örn. `C:\src\flutter` gibi; boşluk içermeyen bir yol tercih edin).

Örnek: `C:\src\flutter`

### 3) PATH değişkenine Flutter ekleme (PowerShell için örnek)
- Windows ortam değişkenlerine `C:\src\flutter\bin` yolunu ekleyin.
- PowerShell veya Komut İstemi'nde kalıcı olarak kullanmak için:

```powershell
# Bu komut yalnızca mevcut PowerShell oturumu için PATH ekler
$env:Path += ";C:\src\flutter\bin"

# Kalıcı ayar yapmak için Windows GUI'den "Environment Variables" bölümünü kullanın
```

> Not: Kalıcı olarak PATH eklemek için `System Properties > Advanced > Environment Variables` yolunu takip edip `Path`'e `C:\src\flutter\bin` ekleyin.

### 4) Flutter bağımlılıkları: Android Studio ve Android SDK
- Android uygulama geliştirmek için Android Studio kurun: https://developer.android.com/studio
- Android Studio içinden Android SDK ve Android Emulator bileşenlerini yükleyin.
- Android Studio'da `AVD Manager` ile bir sanal cihaz (emülatör) oluşturun.

Android Studio kurulumundan sonra, Android lisanslarını kabul etmek için PowerShell'de aşağıyı çalıştırın:

```powershell
flutter doctor --android-licenses
```

### 5) Visual Studio Code (tercih)
- VS Code, hafif ve popüler bir editördür. Flutter/Dart eklentilerini yükleyin:
  - `Dart` eklentisi
  - `Flutter` eklentisi

### 6) flutter doctor ile doğrulama
Tüm kurulum adımlarından sonra PowerShell'de proje dizininizden (veya genel shell'den) şu komutu çalıştırın:

```powershell
flutter doctor
```

`flutter doctor` size eksik bileşenleri, lisans kabul edilmemiş paketleri ve IDE/SDK durumunu gösterecektir. Örnek çıktı eksik bir bileşen bildirirse, ona göre gerekli yüklemeleri yapın.

### 7) İlk proje oluşturma ve çalıştırma
PowerShell içinde şu komutları kullanarak yeni bir Flutter projesi oluşturun ve çalıştırın:

```powershell
# Yeni proje oluşturma
flutter create benim_ilk_flutter_uygulamam
cd benim_ilk_flutter_uygulamam

# Emülatörü başlattıktan sonra
flutter run
```

Eğer emülatör ya da bağlı cihaz yoksa `flutter run` hata verebilir — önce bir Android emülatörü başlatın veya gerçek bir cihaz bağlayın (USB hata ayıklama etkin olmalı).

### 8) Sorun giderme
- Eğer `flutter doctor` Android toolchain veya lisanslarla ilgili uyarı veriyorsa, Android Studio içinden SDK Manager'ı açıp eksik paketleri yükleyin.
- PATH hataları için ortam değişkenlerini kontrol edin.
- Emülatör başlatma sorunları için AVD Manager'da yeni bir cihaz oluşturmayı deneyin.

---

## Kısa macOS / Linux notları
- macOS: iOS geliştirmek için Xcode gereklidir. Flutter web ve Android için de Android Studio kurun.
- Linux: Paket yöneticileriyle Git kurun, gerekli bağımlılıkları (libGL vb.) yükleyin. Desktop target için ek yapılandırma gerekebilir.

---

## İyi uygulamalar ve başlangıç tavsiyeleri
- Önce `flutter create` ile çıkan örnek uygulamayı inceleyin; `lib/main.dart` içindeki widget ağacını (widget tree) okuyun.
- `StatelessWidget` ve `StatefulWidget` farkını kavrayın: UI sabit ise Stateless, değişen UI için Stateful kullanılır.
- Hot Reload ve Hot Restart farklarını öğrenin. Hot Reload, kod değişikliğini anında yansıtır; Hot Restart ise uygulamanın durumunu sıfırlar.
- Paket kullanımı: `pub.dev` Flutter/Dart paket deposudur; ihtiyaç duyduğunuz özellikler için paket arayın.
- Versiyon kontrol: Kodunuzu Git ile saklayın; GitHub/GitLab/Bitbucket üzerinde yedekleyin ve CI/CD ile otomatik build ayarlayın.

---

## Son söz
Flutter, hızlı prototipleme ve çoklu platform hedefleme için güçlü bir araçtır. Öğrenmeye başlarken basit arayüzler, widget hiyerarşisi ve state yönetimi konularına odaklanın. Yerel cihazlarda test yapmadan uygulamayı mağazalara göndermeyin; her platformun (Android/iOS) kendine özgü kuralları ve gereksinimleri vardır. İlerledikçe `Provider`, `Riverpod`, `Bloc` gibi state yönetimi çözümlerini ve `Codemagic`/`GitHub Actions` gibi CI/CD araçlarını öğrenmek uygulamalarınızı üretime hazır hâle getirecektir.

Eğer isterseniz bu dosyayı genişletip örnek projeler, adım adım ekran görüntüleri veya Windows kurulumunda sık karşılaşılan hatalar ve çözümleri ile zenginleştirebilirim.
