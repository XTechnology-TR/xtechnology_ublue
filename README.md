# xteknoloji_ublue

> **Uyarı**
> Startpoint yakın zamanda yeniden yazıldı ve bu sürüm "1.0" *yarı*kararlı sürüm olarak kabul ediliyor.
> Bu sürümle önceki sürüm arasında önemli değişiklikler var.
> Önceki (v0) sürümdeki değişiklikleri birleştiriyorsanız lütfen [ön bilgi blog yayınına](https://universal-blue.org/blog/2023/09/02/startingpoint-rewrite-heads-bakın) bilmeniz gerekenler/).
[![build-ublue](https://github.com/xteknoloji-tr/xteknoloji_ublue/actions/workflows/build.yml/badge.svg)](https://github.com/xteknoloji-tr/xteknoloji_ublue/eylemler/iş akışları/build.yml)

Bu, istediğiniz şekilde özelleştirilebilecek şekilde tasarlanmış [yerel bir kapsayıcı görüntüsü](https://fedoraproject.org/wiki/Changes/OstreeNativeContainerStable) oluşturmaya yönelik, sürekli güncellenen bir şablon deposudur. GitHub görselinizi sizin için oluşturacak ve ardından onu sizin için [ghcr.io](https://github.com/features/packages) üzerinde barındıracaktır. Daha sonra bilgisayarınıza bu görüntüden önyükleme yapmasını söylersiniz. GitHub sizin için 90 günlük görüntü yedeklemesi tutar, teşekkürler Microsoft!

Daha fazla bilgi için [uBlue ana sayfasına](https://universal-blue.org/) ve [ana uBlue deposuna](https://github.com/ublue-os/main/) göz atın.

## Başlarken

Bu şablonu temel alarak kendi deponuzu oluşturmaya yönelik hızlı kurulum talimatları için [Belgelerdeki Kendi Sayfanızı Oluşturun](https://universal-blue.org/tinker/make-your-own/) belgesine bakın.

Endişelenmeyin, sadece terminali ve git'i kullanmayla ilgili bazı temel bilgileri gerektirir.

Kurulumdan sonra, özel görüntünüzü tanımlamak için bu README'yi güncellemeniz önerilir.

> **Not**
> Bu deponun her yerinde, `xteknoloji-tr/xteknoloji_ublue' kısmını kendi deponuzun ayrıntılarıyla değiştirmeyi unutmayın. Otomatik depo kurulum araçlarından birini kullanmadığınız sürece, bu durumda önceki depo tanımlayıcısı zaten deponuzun ayrıntıları olmalıdır.

> **Uyarı**
> Başlamak için, yalnızca özelleştirmeleriniz için olan "canlı" adında bir dal oluşturmanız gerekir. Bu, GitHub iş akışının kapsayıcı kayıt defterinize dağıtacağı **tek**daldır. Orijinal "şablon" dalında herhangi bir değişiklik yapmayın. Dokunulmadan kalmalı. Bu dal yapısını kullanarak, kendi "yayınlanmış görüntü" dalınız, geliştirme dallarınız ve orijinal yukarı akış "şablon" dalı arasında net bir ayrım sağlarsınız. Yukarı akış "şablon" dalını periyodik olarak senkronize edin ve en son revizyona hızlı ileri sarın. Ardından, en son gelişmeleri zahmetsizce kendi deponuza dahil etmek için, herhangi bir karmaşık, manuel "birleştirme işlemine" ihtiyaç duymadan, "canlı" şubenizi güncellenmiş şablona yeniden temellendirin.

## Kişiselleştirme

Özelleştirmeye başlamanın en kolay yolu 'config/recipe.yml' dosyasına bakmak ve onu değiştirmektir. Yorumlar kullanılarak belgelenmiştir ve anlaşılması oldukça kolay olmalıdır.
Özel yapılandırma dosyaları eklemek istiyorsanız, bunları yalnızca OSTree'nin resmi "yapılandırma şablonu" dizini olan ve önyükleme sırasında `/etc/` dizinine uygulanacak olan `/usr/etc/` dizinine ekleyebilirsiniz. `config/files/usr` varsayılan olarak görüntünüzün `/usr` dizinine kopyalanır. Görüntünüzün köküne başka dizinler eklemeniz gerekiyorsa, bunu 'dosyalar' modülünü kullanarak yapabilirsiniz. OSTree tabanlı dağıtımların görüntü yapılarında `/var/` dizinine yazmak desteklenmez ve çalışmaz, çünkü bu yerel kullanıcı tarafından yönetilen bir dizindir!
Özelleştirme hakkında daha fazla bilgi için, bkz. [yapılandırma dizinindeki README'yi](config/README.md)

Özel görseller oluşturmaya ilişkin belgeler mevcuttur/iki ayrı yere yazılmalıdır:

-Özel görseller oluşturmaya ilişkin genel belgeler, en iyi uygulamalar, eğitimler vb. için [Web sitesindeki Tamirci Rehberi](https://universal-blue.org/tinker/make-your-own/).
-Şablonun giriş ve çıkışlarına özel belgeler (modül belgeleri gibi) ve özel görüntülerin nasıl oluşturulacağıyla ilgili bazı temel rehberlik için bu deponun içinde.

## Kurulum

> **Uyarı**> [Bu deneysel bir özelliktir](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable) ve üretimde kullanılmamalıdır, bir süre sanal makinede deneyin!

Mevcut bir Silverblue/Kinoite kurulumunu en son sürüme yeniden temellendirmek için:

-Doğru imzalama anahtarlarını ve ilkelerini yüklemek için öncelikle imzasız görüntüyü yeniden temellendirin:

 ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/xtechnology-tr/xtechnology_ublue:latest
  ```
  
-Yeniden yapılandırmayı tamamlamak için yeniden başlatın:
 ```
  systemctl reboot
  ```
-Daha sonra imzalı görseli şu şekilde yeniden düzenleyin:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/xtechnology-tr/xtechnology_ublue:latest
  ```
-Kurulumu tamamlamak için yeniden başlatın
 ```
  systemctl reboot
  ```

Bu depo aynı zamanda tarih etiketleri de oluşturur, dolayısıyla belirli bir günün yapısını yeniden oluşturmak istiyorsanız:

```
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/xtechnology-tr/xtechnology_ublue:20230403
```

Bu depo varsayılan olarak imzalamayı da destekler.

'En son' etiketi otomatik olarak en son yapıya işaret edecektir. Bu yapı yine de her zaman "recipe.yml"de belirtilen Fedora sürümünü kullanacaktır, böylece yanlışlıkla bir sonraki ana sürüme güncellenmezsiniz.

##ISO

Bu şablon, görüntünüzün ISO'sunu oluşturmak ve yayınlamak için basit bir Github Eylemi içerir.

Eylemi çalıştırmak için, deponuzun başlangıç ​​noktasına yapılan tüm referansları değiştirerek `boot_menu.yml` dosyasını düzenlemeniz yeterlidir. Bu, eylemi otomatik olarak tetiklemelidir.
Eylem, [izojeneratör](https://github.com/ublue-os/isogenerator) kullanır ve resmi Universal Blue ISO'ya benzer şekilde çalışır. Herhangi bir sorunla karşılaşırsanız öncelikle [kurulumla ilgili dokümantasyon sayfasını](https://universal-blue.org/installation/) kontrol etmelisiniz. ISO bir ağ yükleyicisidir ve her zaman görüntünüzün en son sürümünü çekmelidir.
Bu ISO sürümü eyleminin, [release-please](https://github.com/googleapis/release-please) gibi tam gelişmiş sürüm otomasyonunun yerine geçmediğini unutmayın.

## 'sadece'

[`just`](https://just.systems/) komut çalıştırıcısı, tüm `ublue-os/main`'den türetilmiş görüntülere dahildir.

Yalnızca yerel olarak başlamak için aşağıdaki içeriğe sahip bir "~/.justfile" dosyanızın olması ve "just" takma adının "just --unstable" (umblue'daki posix uyumlu kabuklarda varsayılan) olması gerekir.
```
!include /usr/share/ublue-os/just/main.just
!include /usr/share/ublue-os/just/nvidia.just
!include /usr/share/ublue-os/just/custom.just
```

Daha sonra mevcut tarifleri listelemek için "sadece" yazın.

`/usr/share/ublue-os/just/custom.just` dosyası, görüntünüze eklemek istediğiniz özel komutlar (tarifler) için tasarlanmıştır. Varsayılan olarak, [`ublue-os/bling`](https://github.com/ublue-os/bling) adresindeki justfiles dosyalarını içerir, eğer bunu devre dışı bırakmak istiyorsanız, sadece bling içeren satırı kaldırmanız gerekir. .Sadece.

Daha fazla bilgi için [Universal Blue belgelerindeki adil sayfaya](https://universal-blue.org/guide/just/) bakın.
