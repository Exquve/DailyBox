# DailyBox

DailyBox, günlük hayatınızı kolaylaştıran minimalist bir utility uygulamasıdır. Modern ve temiz bir arayüzle, günlük ihtiyaçlarınız için gerekli araçları bir araya getirir.

## 🌟 Özellikler

### 📝 Notlar
- Hızlı not alma
- Zaman damgası ve konum kaydetme
- Not düzenleme ve silme
- Minimalist not görünümü

### 💰 Bütçe Takibi
- Çoklu para birimi desteği (USD, EUR, TRY, GBP, vb.)
- Gelir ve gider takibi
- Açıklama ekleme
- Para birimi bazında özetler
- Otomatik bakiye hesaplama

### 📱 QR Kod
- QR kod oluşturma
- QR kod tarama (simülasyon)
- Metin, URL ve e-posta desteği
- Oluşturulan kodları kopyalama

### 🔗 Link Kısaltıcı
- is.gd API entegrasyonu
- Özel alias desteği
- Link geçmişi
- Tek tıkla kopyalama

### 🔄 Dosya Dönüştürücü
- Resim to PDF dönüştürme
- Çoklu resim seçimi
- Galeri ve dosya seçici desteği
- Gelecek özellikler için hazır altyapı

## 🎨 Tema Desteği

- **Açık Tema**: Minimalist beyaz tasarım
- **Koyu Tema**: Göz dostu koyu tasarım
- **Sistem Teması**: Otomatik tema seçimi
- Anlık tema değiştirme

## 📱 Platform Desteği

- Android
- iOS
- Web

## 🛠️ Teknik Özellikler

### Kullanılan Teknolojiler
- **Framework**: Flutter 3.x
- **State Management**: Provider
- **Veritabanı**: SQLite
- **HTTP İstekleri**: HTTP package
- **Konum Servisleri**: Geolocator
- **QR Kod**: qr_flutter
- **Dosya İşlemleri**: file_picker, path_provider
- **PDF Oluşturma**: pdf package

### Veri Saklama
- Tüm veriler yerel SQLite veritabanında saklanır
- Kullanıcı aktiviteleri zaman damgası ve konum bilgisi ile kaydedilir
- Güvenli ve hızlı veri erişimi

### İzinler
- **İnternet**: Link kısaltıcı API'si için
- **Konum**: Aktivite konumlarını kaydetmek için
- **Kamera**: QR kod tarama için
- **Depolama**: Dosya işlemleri için

## 🚀 Kurulum

1. Flutter SDK'nın yüklü olduğundan emin olun
2. Projeyi klonlayın
3. Bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```
4. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```

## 📁 Proje Yapısı

```
lib/
├── main.dart              # Ana uygulama dosyası
├── models/                # Veri modelleri
├── screens/               # Ekran widget'ları
├── services/              # İş mantığı servisleri
├── theme/                 # Tema konfigürasyonu
└── widgets/               # Yeniden kullanılabilir widget'lar
```

## 🔮 Gelecek Özellikler

- **Harita Entegrasyonu**: Aktivitelerin harita üzerinde görüntülenmesi
- **Daha Fazla Dosya Dönüştürücü**: Audio, video ve dokuman dönüştürme
- **Backup & Sync**: Bulut yedekleme
- **Widget'lar**: Ana ekran widget desteği
- **Kategoriler**: Not ve bütçe kategorileri
- **İstatistikler**: Kullanım analitikleri

## 🎯 Hedef Kitle

DailyBox, günlük yaşamda küçük ama önemli görevleri hızlı ve etkili bir şekilde yapmak isteyen herkes için tasarlanmıştır. Minimalist tasarımı sayesinde teknik bilgisi olmayan kullanıcılar bile kolayca kullanabilir.

## 📄 Lisans

Bu proje MIT lisansı altında dağıtılmaktadır.

---

**DailyBox** - Günlük yaşamınızı kolaylaştıran minimalist arkadaşınız 📦✨
