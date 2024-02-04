# Universal Blue'ya hoş geldiniz

Yardım etmeye zaman ayırdığınız için teşekkür ederiz!
Tüm katkılar takdir edilmektedir!
Lütfen bunu yaparken [Davranış Kurallarımıza](/CODE_OF_CONDUCT.md) bakın!

Bulduğunuz sorunları bildirmekten çekinmeyin; [tartışmalarda diğerlerine yardımcı olmak]() her zaman takdire şayandır.

# Katkı

Her türlü katkı teşvik edilir ve değerlenir. Farklı yardım yolları ve bu projenin bunları nasıl ele aldığıyla ilgili ayrıntılar için [İçindekiler Tablosu](#içindekiler) bölümüne bakın. Lütfen katkınızı yapmadan önce ilgili bölümü okuduğunuzdan emin olun. Bu, biz bakımcıların işini çok daha kolaylaştıracak ve katılan herkesin deneyimini kolaylaştıracak. Topluluk katkılarınızı sabırsızlıkla bekliyor.
> Projeyi beğendiyseniz ancak katkıda bulunacak zamanınız yoksa sorun değil. Projeyi desteklemenin ve takdirinizi göstermenin başka kolay yolları da var; bunlardan da çok memnun oluruz:
> -Projeye yıldız verin
> -Bunun hakkında tweet atın
> -Projenizin benioku dosyasında bu projeye bakın
> -Yerel buluşmalarda projeden bahsedin ve arkadaşlarınıza/meslektaşlarınıza söyleyin

## İçindekiler

-[Davranış Kuralları](#davraniskurallari)
-[Bir Sorum Var](#bir-sorum-var)
-[Katkıda bulunmak istiyorum](#katkıda-bulunmak-istiyorum)
-[Hata Bildiriliyor](#hata-bildiriliyor)
-[Gelen değişiklikler nasıl test edilir](#gelen-değişiklikler-nasıl-yapılır)
-[Yerel Olarak İnşa Etme](#yerel-olarak-inşa-etme)
-[Stil Kılavuzları](#stil-kılavuzları)
-[İleti İletileri](#taahhüt-mesajları)
-[Proje Ekibine Katılın](#proje-ekibine-katıl)

## Davranış kodu

Bu proje ve ona katılan herkes,
[CONTRIBUTING.md Davranış Kuralları](/CODE_OF_CONDUCT.md).
Katılarak bu kurallara uymanız bekleniyor. Lütfen kabul edilemez davranışları bildirin
jorge.castro@gmail.com adresine

## Bir sorum var
> Bir soru sormak istiyorsanız [tartışma forumunda](https://github.com/orgs/ublue-os/discussions) sorun.

## Katkıda Bulunmak İstiyorum

> ### Yasal Uyarı
> Bu projeye katkıda bulunurken içeriğin %100'ünü yazdığınızı, içerik üzerinde gerekli haklara sahip olduğunuzu ve katkıda bulunduğunuz içeriğin proje lisansı kapsamında sağlanabileceğini kabul etmelisiniz.

Genel olarak konuşursak, yapıların sağlıklı kalması ve kendimizin mutlu olması için [Tembel Konsensüs](http://lazyconcens.us/) geliştirme modelini izlemeye çalışıyoruz.
-Bir karara varmak için fikir birliğine varmak istiyorsanız geri bildirim için bir sorun yayınlayın ve saat dilimlerini, hafta sonlarını/tatilleri/çalışma saatlerini hesaba katmayı unutmayın.
   -İnsanların yapılarında fikir sahibi olmalarını istiyoruz, bu nedenle yukarıdan aşağıya bir organizasyondan ziyade gevşek bir depolar konfederasyonuyuz.
   -Kendi eşyalarınızı birleştirmemeye çalışın, inceleme isteyin. Yeterli incelemeciye sahip olduğumuz bir noktada şube korumasını etkinleştireceğiz.

### Hataları Bildirmek

#### Hata Raporu Göndermeden Önce

İyi bir hata raporu sorunu ayrıntılı olarak açıklamalıdır. Genel konuşma:

-En son sürümü kullandığınızdan emin olun.
-Bunların resmi olmayan yapılar olduğunu unutmayın; genellikle bir sorunu burada veya Fedora'da bildirmeden önce araştırmak akıllıca olacaktır!
-Hata hakkında bilgi toplayın:
  -'rpm-ostree durumu -v' genellikle yardımcı olur
-Resim ve Sürüm
-Muhtemelen girdiniz ve çıktınız
-Sorunu güvenilir bir şekilde yeniden oluşturabiliyor musunuz? Ayrıca bunu eski versiyonlarla da yeniden üretebilir misiniz?

### Gelen değişiklikler nasıl test edilir

İmaj modelinin güzel yanlarından biri, yapmak istediğimiz her değişiklik için tam bir işletim sistemi imajı oluşturabilmemizdir, bu da testi geçmişe göre çok daha kolay hale getirir. Bunu yeniden temellendirebilir, çalışıp çalışmadığını görebilir ve ardından geri dönebilirsiniz. Bu aynı zamanda test kullanıcılarının sayısını artırabileceğimiz anlamına da geliyor!
Önerilen değişikliklerin topluluk tarafından daha kapsamlı bir şekilde incelendiği ve test edildiği bir model oluşturmaya çalışıyoruz. İşte bunu nasıl yapacağınız. Takip ettiğiniz bir görselde açılan bir çekme isteği görürseniz, bunun sizin için nasıl çalıştığına dair bir inceleme bırakabilirsiniz. Her PR'ın altında şunun gibi bir şey göreceksiniz:

![image](https://user-images.githubusercontent.com/1264109/221305388-3860fc07-212c-4eb9-80d9-5d7a35a77f46.png)

"Yorumunuzu ekleyin"i tıkladığınızda şunu göreceksiniz:
![image](https://user-images.githubusercontent.com/1264109/221307636-5e312e48-821f-4206-848f-7fbc2c91cd78.png)

Endişelenmeyin, hiçbir şeyi berbat edemezsiniz, tüm birleştirme ve benzeri şeyler bakımcı tarafından yapılacaktır, bu, her şeyi bir forum başlığına tıkmaktan daha resmi bir şekilde bilgi toplamamıza olanak tanır. Görselleri ne kadar çok insan inceleyip test ederse, özellikle Sericea gibi yeni görseller için o kadar iyi durumda olacağız.
Bir noktada size görseli nasıl yeniden temellendireceğiniz ve diğer şeyler hakkında talimatlar bırakacak bir botumuz olacak, ancak bu arada talimatları manuel olarak bırakacağız.

İşte bir örnek: https://github.com/ublue-os/nvidia/pull/49

## Yerel Olarak Bina Oluşturmak

Gereken minimum araçlar git ve podman'ın etkinleştirildiği ve yapılandırıldığı çalışan bir makinedir.
Yerel olarak oluşturmak GitHub'da oluşturmaktan çok daha hızlıdır ve uzaktan kumandaya geçmeden önce hızlı hareket etmenin iyi bir yoludur.

### İstediğiniz repoyu klonlayın

    git klonu https://github.com/ublue-os/base.git

### Görüntüyü oluşturun
    
Öncelikle mevcut bir görüntüyü oluşturabildiğinizden emin olun:
    
    podman'ın yapısı. -bir şey
    
Ardından görüntünüzün oluşturulduğunu onaylayın:
    
    podman resmi ls
YAPILACAK: Kendi yerel kayıt defterinizi kurun ve gönderin
    
### Değişikliklerinizi yapın

Bu genellikle 'Konteyner Dosyası'nın düzenlenmesini içeriyordu. Kapsayıcılar oluşturmaya yönelik çoğu teknik burada geçerlidir; eğer kaplar konusunda yeniyseniz, aramalarınızda "Dockerfile" terimini kullanmak, bilgi ararken genellikle daha fazla sonuç gösterir.

Özelleştirme hakkında daha fazla bilgi için CoreOS'un [katmanlama örneklerine](https://github.com/coreos/layering-examples) göz atın.

### Sorunları Fedora'ya bildirme

Fedora için iyi bir ortak olmaya çalışıyoruz.

Bu proje, Fedora ve ostree'deki yeni özellikleri tüketiyor; bir sorunla karşılaşmak alışılmadık bir durum değil.
Sorunlar yukarı yönde bildirilmelidir ve bazı durumlarda test yapılmasına ve düzeltmelerin bulunmasına yardımcı olabiliriz.
Bulduğunuz sorunlardan bazıları diğer projelerdeki diğer bağımlılıkları içerebilir; bu durumlarda Fedora ekibi sorunu nereye bildireceğinizi size söyleyecektir.
Yukarı akış hata izleyicisi: [https://github.com/fedora-silverblue/issue-tracker/issues](https://github.com/fedora-silverblue/issue-tracker/issues)

## Stil kılavuzları
### Mesajları Kaydet

Değişiklik günlüklerini düzenli tutmak için [Geleneksel Taahhütleri](https://www.conventionalcommits.org/en/v1.0.0/) kullanıyoruz ve bunları bir botla uyguluyoruz:

''''
görev: Oyster derleme komut dosyasını ekleme
dokümanlar: şapka sallanmasını açıklayın
beceri: beta dizisi ekle
düzeltme: bozuk onay mesajını kaldır
refactor: 4d3d3d3 ve flarhgunnstow arasındaki mantığı paylaş
stil: sekmeleri boşluklara dönüştür
test: Tayne'in giysilerini muhafaza ettiğinden emin olun
''''

## Proje Ekibine Katılın

Bir şeyin bakımını yapmakla ilgileniyorsanız bize bildirin!

## İlişkilendirme
Bu kılavuz **contributing.md**'ye dayanmaktadır. [Kendinizinkini yapın](https://contributing.md/)!