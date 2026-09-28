# mkerbas60.github.io — Yapılanlar ve Yapılacaklar Listesi

> **Son Güncelleme:** 2026-09-28  
> **Durum:** Aktif Proje Takip Belgesi  
> **İlgili Depo:** `d:\Projects\web\site\mkerbas60.github.io` (GitHub Pages Yayını)

---

## 1. Yapılanlar (Tamamlanan İyileştirme ve Düzeltmeler)

| No | Kategori | Açıklama | Kaynak / Kanıt | Tamamlanma Tarihi |
|:---|:---|:---|:---|:---|
| 1 | Yayın | GitHub Pages statik site yayını, JSON veri kaynakları ve `app-ads.txt` entegrasyonu sağlandı. | `docs/reports/2026-09-27-kapsamli-platform-incelemesi.md` | 2026-09-27 |
| 2 | Depo Hijyeni | Medya ve JSON dosyaları optimize edildi. | `docs/reports/2026-09-27-kapsamli-platform-incelemesi.md` | 2026-09-27 |

---

## 2. Yapılacaklar (Tespit Edilen Hatalar, Sorunlar ve İhtiyaçlar)

| ID | Öncelik | Şiddet | Alan | Açıklama / Tespit Edilen Hata | Öneri ve Çözüm Adımı | Doğrulama Yöntemi |
|:---|:---:|:---:|:---|:---|:---|:---|
| O-15 | P2 | Orta | Bütünlük | AI model listesi indirme sağlama toplamları (SHA-256) ve sürüm JSON'ları imzasız. | İndirme dosyalarına SHA-256 hash doğrulaması ekleyin. | Hash doğrulama testi. |
| O-29 | P2 | Düşük | Senkronizasyon | Sürüm JSON'larındaki oyun/uygulama sürümleri yayınlanan sürümlerle senkronize edilmeli. | CI/CD yayın akışında JSON sürümlerini otomatik güncelleyin. | JSON sürüm kontrolü. |
| O-16 | P3 | Düşük | Uyumluluk | Google Fonts harici yüklemesi (KVKK / GDPR uyarısı). | Fontları yerel barındırmaya (self-hosted) geçirin. | Network waterfall denetimi. |

---

## 3. Notlar ve Bağımlılıklar
- Mobil oyunların ve uygulamaların `app-ads.txt` doğrulaması bu site üzerinden yapılmaktadır.