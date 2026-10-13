# mkerbas60.github.io — Yapılanlar ve Yapılacaklar Listesi

> **Son Güncelleme:** 2026-10-10 10:08
> **Durum:** Aktif Proje Takip Belgesi  
> **İlgili Depo:** `d:\Projects\web\site\mkerbas60.github.io` (GitHub Pages Yayını)
> **Ekosistem önceliği:** bkz. `D:\Projects\docs\yapilanlar_yapilacaklar.md` (konsolide durum) ve `D:\Projects\docs\oncelikli_gelistirme_plani.md` (öncelik sırası).  

---

## 1. Yapılanlar (Tamamlanan İyileştirme ve Düzeltmeler)

| No | Kategori | Açıklama | Kaynak / Kanıt | Tamamlanma Tarihi |
|:---|:---|:---|:---|:---|
| NAMING-20261010 | Dosya adlandırma | HTML, JSON ve Markdown dosya adları küçük harfli ASCII kebab-case standardına çekildi; sabit araç adları korundu ve ilgili yollar güncellendi. | platform/scripts/normalize-content-file-names.ps1; platform/scripts/repair-content-file-references.mjs; dosya adı denetimi | 2026-10-10 10:08 |
| PRIVACY-20261010 | Gizlilik politikası | Projeye ait HTML politikası Türkçe ve İngilizce bölümlerle güncellendi; yayımlanan, yerel ve eski URL kopyaları eşitlendi. Kaynak dosya adları uygulama bağlantıları için korundu. | privacy_policy.html; HTML bölüm sayımı (60 dosya) | 2026-10-10 09:35 |
| 1 | Yayın | GitHub Pages statik site yayını, JSON veri kaynakları ve `app_ads.txt` entegrasyonu sağlandı. | `docs/reports/2026_09_27_kapsamli_platform_incelemesi.md` | 2026-09-27 |
| 2 | Depo Hijyeni | Medya ve JSON dosyaları optimize edildi. | `docs/reports/2026_09_27_kapsamli_platform_incelemesi.md` | 2026-09-27 |

---

## 2. Yapılacaklar (Tespit Edilen Hatalar, Sorunlar ve İhtiyaçlar)

| ID | Öncelik | Şiddet | Alan | Açıklama / Tespit Edilen Hata | Öneri ve Çözüm Adımı | Doğrulama Yöntemi |
|:---|:---:|:---:|:---|:---|:---|:---|
| O-15 | P2 | Orta | Bütünlük | AI model listesi indirme sağlama toplamları (SHA-256) ve sürüm JSON'ları imzasız. | İndirme dosyalarına SHA-256 hash doğrulaması ekleyin. | Hash doğrulama testi. |
| O-29 | P2 | Düşük | Senkronizasyon | Sürüm JSON'larındaki oyun/uygulama sürümleri yayınlanan sürümlerle senkronize edilmeli. | CI/CD yayın akışında JSON sürümlerini otomatik güncelleyin. | JSON sürüm kontrolü. |
| O-16 | P3 | Düşük | Uyumluluk | Google Fonts harici yüklemesi (KVKK / GDPR uyarısı). | Fontları yerel barındırmaya (self-hosted) geçirin. | Network waterfall denetimi. |

---

## 3. Notlar ve Bağımlılıklar
- Mobil oyunların ve uygulamaların `app_ads.txt` doğrulaması bu site üzerinden yapılmaktadır.

> **MOB-UPDATE-SCHEMA-20261011 (Kısmi, 2026-10-11 02:56, Kesin):** erbas_foundation sürüm denetleyicisi snake_case ve camelCase ersion.json alanlarını okuyor; boş latestVersion yanıtını hata kabul ediyor. YKS güncelleme adresi yerel site ağacındaki /yks/version.json ile eşlendi; bu JSON'un Play bağlantısı Android pplicationId olan com.mkerbas.yks_sinav olarak düzeltildi. Canlı GitHub Pages yayını ve Flutter testleri doğrulanmadı.

> **MOB-ADS-UPDATE-20261011 (2026-10-11 03:24, Kesin — yerel kod):** 19 çalışır Flutter uygulamasında açılış reklamı ilk 3 açılışta kapalı, sonra 4/7/10... açılışlarında denenir. 8 yayımlı uygulamada verilen canlı AdMob birimleri korundu; diğer 11 uygulamada Google test birimleri kullanılır. Eksik 3 uygulamaya test reklam altyapısı, diğer uygulamalar/değerlendir menüsü ve elle güncelleme denetimi eklendi. Diğer 7 test uygulamasına Android açılış güncellemesi ve elle kontrol eklendi. ersion.json sürümleri 19/19 pubspec.yaml ile eşleşti; 8 AdMob birim listesi kodla eşleşti. Ortak frekans testleri 14/14 geçti; değişen Dart dosyalarında hedefli analizler temiz. Site JSON yayını ve mağaza/cihaz kabulü doğrulanmadı.

> **MOB-ADS-UPDATE-TEST-20261011 (2026-10-11 03:28, Kesin):** Ek listedeki 8 uygulamanın 56 AdMob kimliği ilgili proje dosyalarında bulundu (56/56). erbas_ad_core frekans testleri 14/14, erbas_foundation HTTP sürüm şeması testleri 3/3 geçti. 19 yerel ersion.json sürümü pubspec.yaml ile eşleşti; yeni JSON adreslerinin GitHub Pages yayını ve cihaz/Play kabulü açık.

> **MOB-VERSION-URL-20261011 (2026-10-11 03:30, Kesin):** KPSS uygulama sürüm adresi kpss/version.json biçimine düzeltildi; eski kpss-version.json kopyası silinmeden 1.0.1'e eşlendi. YKS sürüm adresi açıklaması yks/version.json ile eşlendi. İki ilgili Dart dosyası analizde hatasız; yerel JSON dosyaları ayrıştırıldı. Canlı yayın henüz doğrulanmadı.
