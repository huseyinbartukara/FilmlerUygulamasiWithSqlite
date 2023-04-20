# FilmlerUygulamasiWithSqlite

## Özet

Swift programlama dili kullanarak, kendimi geliştirmek amacıyla yapmış olduğum 3. projem. Bu proje stoaryboard kullanılarak geliştirildi. Temelde 3 adet 
viewController yapısından oluşuyor;

1. KategoriSayfa
2. FilmlerSayfa
3. FilmDetaySayfa

Anasayfa üzerinde tableview yapısı kullanılarak sqlite üzerinde kayıtlı olan Film verilerimizi gösteriyoruz. Burada isteğimize göre bir hücre yapısı 
oluşturduktan sonra bunun için ve sqlite yapısı için gerekli olan sınıf yapılarımızı oluşturup sayfa üzerine bağladık. Veritabanımız üzerinde 3 adet tablo
olduğu için 3 farklı tablo için 3 farklı sınıf yapısı oluşturduk. TableView protocollerini anasayfamıza extension yapısını kullanarak bağladıktan sonra 
hücreye tıklama özelliğini didRowSelect hazır fonksiyonu yardımı ile genel bir performsegue oluşturup FilmlerSayfa sayfasına geçişimizi sağladık. 
Oluşturduğumuz genel perform segue üzerinden aldığımız tıklanan hücrenin indeksini prepare fonksiyonu ile FilmSayfa sayfasına aktardık ve verilerimizi 
Filmler  sayfasında collection yapısını kullanarak yeniden gösterdik. Burada almış olduğumuz indeksi veritabanında yapmış olduğumuz karşılaştırma ile katogori tablosunda ki kategori_id ile filmler tablosunda ki kategori_id eşit mi karşılaştırmasını yapıp tıkladığımız kategoriye ait filmleri listelemiş olduk. FilmlerSayfa sayfasından almış olduğumuz tıklama indeksini yeniden FilmDetaySayfa sayfasına gönderdikten sonra ve veritabanı ile karşılaştırdıktan sonra ilgili filmin detay bilgilerini sayfamız da gösteriyoruz. Bu projem de 3 farklı tablo yapısında foregin-key kullandığım için birbiri ilgili tabloları nasıl kullanıcağımı öğrenmiş oldum.Uygulamanın sayfa yapılarını görebilmeniz için ilgili resimleri aşağıda görebilirsiniz.

<img src="https://i.hizliresim.com/hwira2s.png" alt="alt text" width="280" height="500"> <img src="https://i.hizliresim.com/s1qpqky.png" alt="alt text" width="280" height="500"> <img src="https://i.hizliresim.com/oq471xg.png" alt="alt text" width="280" height="500">  
