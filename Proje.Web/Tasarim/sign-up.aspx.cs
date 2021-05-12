using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proje.DataAccess;
using Proje.Business;

namespace Proje.Web.Tasarim
{
	public partial class sign_up : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				//GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
				//GridViewKullanici.DataBind();
			}
		}

        protected void ButtonKaydol_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtAdSoyad.Text != "" || txtPass.Text != "" || txtPass2.Text != "" || txtTCKN.Text != "" || txtTelNo.Text != "" || txtUserName.Text != "")
                {
					string kullaniciadi = txtUserName.Text;
					string parola = txtPass.Text;
					string parola2 = txtPass2.Text;
					string tckn = txtTCKN.Text;
					string adsoyad = txtAdSoyad.Text;
					string isegiristarihi = DateTime.Today.ToString();
					string telno = txtTelNo.Text;
					int bolumid = 2;
					int pozisyonid = 2;

					otoservisdbEntities db = new otoservisdbEntities();
					
					List<string> query1 = db.kullanicis.ToList()
						 .Where(x => x.kullaniciAdi == kullaniciadi)
						 .Select(x => x.kullaniciAdi).ToList();

					List<string> ifmusteriexists = db.musteris.ToList()
						.Where(x => x.tckn == tckn)
						.Select(x => x.tckn).ToList();



					List<string> ifkullaniciexists = db.kullanicis.ToList()
								.Where(x => x.tckn == tckn)
								.Select(x => x.tckn).ToList();

					List<string> ifkullaniciadexists = db.kullanicis.ToList()
									.Where(x => x.kullaniciAdi == kullaniciadi)
									.Select(x => x.kullaniciAdi).ToList();

					List<string> iftelexists = db.kullanicis.ToList()
							.Where(x => x.telno == telno)
							.Select(x => x.telno).ToList();




					if (adsoyad == "")
					{
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Ad Soyad boş bırakılamaz', '');", true);
					}

					else if (telno.Length != 10 || Regex.IsMatch(telno, @"^[a-zA-Z_]+$"))
					{
						//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Telefon numarası hatalı girildi')", true);
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Telefon numarası hatalı formatta girildi', '');", true);
					}

					else if (tckn.Length != 11)
                    {
						//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('TC Kimlik no hatalı girildi')", true);
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('TC Kimlik NO hatalı formatta girildi', '');", true);
						//Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showContentError('TC Kimlik no hatalı formatta girildi', '');", true);
					}
					
					else if (parola != parola2)
					{
						//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Parolalar eşleşmiyor!')", true);
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Parolalar eşleşmiyor!', '');", true);
					}
					else if (query1.Count != 0)
					{
						//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bu kullanıcı adı önceden alınmış!')", true);
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu kullanıcı adı önceden alınmış!', '');", true);
					}
					else if(checkboxKVKK.Checked != true)
                    {
						//ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Lütfen Kullanıcı Sözleşmesini onaylayınız.')", true);
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Lütfen Kullanıcı Sözleşmesini onaylayınız.', '');", true);
					}

					else if (ifkullaniciexists.Count != 0)
					{
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu TC Noya sahip bir müşteri mevcut', 'HATA');", true);
					}

					else if (ifkullaniciadexists.Count != 0)
					{
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu kullanıcı adı alınmış', 'HATA');", true);
					}

					else if (iftelexists.Count != 0)
					{
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu Telefon numarası sistemde mevcut', 'HATA');", true);
					}

					else if(ifmusteriexists.Count == 0)
                    {
						kullanicibilgi.AddKullanici(kullaniciadi, parola, tckn, adsoyad, isegiristarihi, bolumid, pozisyonid, telno);
						dbmusteri2.AddMusteri(tckn, adsoyad);
						Response.Redirect("sign-in.aspx");
					}
					else if(ifmusteriexists.Count != 0)
                    {
						kullanicibilgi.AddKullanici(kullaniciadi, parola, tckn, adsoyad, isegiristarihi, bolumid, pozisyonid, telno);
						Response.Redirect("sign-in.aspx");
                    }
                    else
                    {
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Beklenmedik bir hata oluştu', 'HATA');", true);
					}
				}
            }
			catch(Exception ex)
            {

            }
			
		}
    }
}


/*GİZLİLİK VE KİŞİSEL VERİLERİ KORUMA POLİTİKASI

ertuncteknik.com olarak kişisel verilerinizin güvenliği hususuna azami hassasiyet göstermekteyiz. Kişisel verileriniz 6698 sayılı Kişisel Verilerin Korunması Kanunu (“KVKK”)’na uygun olarak işlenmekte ve muhafaza edilmektedir. 

1. Kişisel Verilerinizin Ne Şekilde İşlenebileceği

6698 sayılı KVKK uyarınca, ertuncteknik.com ile paylaştığınız kişisel verileriniz, tamamen veya kısmen, otomatik olarak veyahut herhangi bir veri kayıt sisteminin parçası olmak kaydıyla otomatik olmayan yollarla elde edilerek, kaydedilerek, depolanarak, değiştirilerek, yeniden düzenlenerek, kısacası veriler üzerinde gerçekleştirilen her türlü işleme konu olarak tarafımızdan işlenebilecektir. KVKK kapsamında veriler üzerinde gerçekleştirilen her türlü işlem “kişisel verilerin işlenmesi” olarak kabul edilmektedir.

2. Kişisel Verilerinizin İşlenme Amaçları Ve Hukuki Sebepleri

Paylaştığınız kişisel veriler,

Müşterilerimize verdiğimiz hizmetlerin gereklerini, sözleşmenin ve teknolojinin gereklerine uygun şekilde yapabilmek, sunulan ürün ve hizmetlerimizi geliştirebilmek için;
Kamu güvenliğine ilişkin hususlarda ve hukuki uyuşmazlıklarda, talep halinde ve mevzuat gereği savcılıklara, mahkemelere ve ilgili kamu görevlilerine bilgi verebilmek için;
Üyelerimize geniş kapsamda çeşitli imkânlar sunabilmek veya bu imkânları sunabilecek kişi veya kurumlarla yasal çerçevede paylaşabilmek için;
Reklam tercihlerini analiz etmek için,
6698 sayılı KVKK ve ilgili ikincil düzenlemelere uygun olarak işlenecektir.

3. Kişisel Verilerinizin Aktarılabileceği Üçüncü Kişi Veya Kuruluşlar Hakkında Bilgilendirme

Yukarıda belirtilen amaçlarla, ertuncteknik.com ile paylaştığınız kişisel verilerinizin aktarılabileceği kişi / kuruluşlar; ana hissedarlarımız, hissedarlarımız, reklam verenler, doğrudan veya dolaylı yurt içi / yurt dışı iştiraklerimiz; başta ertuncteknik.com altyapısını kullanan üye firmalar ve bunlarla sınırlı olmamak üzere sunulan hizmet ile ilgili kişi ve kuruluşlar olmak üzere, faaliyetlerimizi yürütmek üzere ve/veya Veri İşleyen sıfatı ile hizmet aldığımız, iş birliği yaptığımız, program ortağı kuruluşları, yurtiçi / yurtdışı kuruluşlar ve diğer 3. kişiler ve kuruluşlardır.

Reklam amaçlı kullanılacak çerezlere ilişkin düzenlemelerimiz “ ertuncteknik.com Çerez Politikası” olup, şu anda okuduğunuz “Gizlilik ve Kişisel Verilerin Korunması Politikası”nın bir parçasını oluşturmaktadır. Çerez Politikamız hakkında bilgi edinmek için lütfen tıklayın. (Gereken çerez politikası örneğine belgenin en altında bulunan bağlantı ile ulaşabilirsiniz)

4. Kişisel Verilerinizin Toplanma Şekli

Kişisel verileriniz,

ertuncteknik.com internet sitesi ve mobil uygulamalarındaki formlar ile ad, soyad, adres, telefon, iş veya özel e-posta adresi gibi bilgiler ile; kullanıcı adı ve şifresi kullanılarak giriş yapılan sayfalardaki tercihleri, gerçekleştirilen işlemlerin IP kayıtları, tarayıcı tarafından toplanan çerez verileri ile gezinme süre ve detaylarını içeren veriler, konum verileri şeklinde;
ertuncteknik.com ile ticari ilişki kurmak, iş başvurusu yapmak, teklif vermek gibi amaçlarla, kartvizit, özgeçmiş (cv), teklif vermek ve sair yollarla kişisel verilerini paylaşan kişilerden alınan, fiziki veya sanal bir ortamda, yüz yüze ya da mesafeli, sözlü veya yazılı ya da elektronik ortamdan;
Ayrıca farklı kanallardan dolaylı yoldan elde edilen, web sitesi, blog, yarışma, anket, oyun, kampanya ve benzeri amaçlı kullanılan (mikro) web sitelerinden ve sosyal medyadan elde edilen veriler, e-bülten okuma veya tıklama hareketleri, kamuya açık veri tabanlarının sunduğu veriler, sosyal medya platformları (Facebook, Twitter, Google, Instagram, Snapchat vs) gibi sosyal paylaşım sitelerinden paylaşıma açık profil ve verilerden; işlenebilmekte ve toplanabilmektedir.
5. KVKK Yürürlüğe Girmeden Önce Elde Edilen Kişisel Verileriniz

ertuncteknik.com, KVKK’nun yürürlük tarihi olan 7 Nisan 2016 tarihinden önce yayım hayatına başlamadığı için bu tarihten önce depoladığımız bir kişisel veri bulunmamaktadır. (Eğer web siteniz bu tarihten önce de veri topluyorsa verilerin ne şekilde işlendiği ve muhafaza edildiği mutlaka belirtilmelidir.)

6. Kişisel Verilerinizin Aktarılması

Türkiye’de işlenerek veya Türkiye dışında işlenip muhafaza edilmek üzere, yukarıda sayılan yöntemlerden herhangi birisi ile toplanmış kişisel verileriniz KVKK kapsamında kalmak kaydıyla ve sözleşme amaçlarına uygun olarak yurtdışında bulunan (Kişisel Veriler Kurulu tarafından akredite edilen ve kişisel verilerin korunması hususunda yeterli korumanın bulunduğu ülkelere) hizmet aracılarına da aktarılabilecektir.

Kişisel Verileriniz;

Ürün ve hizmetlerin sunulması ve tanıtılması için işbirliği yapılan ve/veya hizmet alınan iş ortaklarımız,
Acil yardım çağrısı halinde konumunuzu tespit edecek olan yetkili mercilere,
Düzenleyici ve denetleyici kurumlar ile mahkeme ve icra müdürlükleri gibi sair resmi kurumlara, kişisel verilerinizi talep etmeye yetkili olan diğer kamu kurum veya kuruluşlarına,
ertuncteknik.com ile ticari ilişki içinde bulunan ve telefon numaranıza sahip tüzel kişilere,
Gerekli görüldüğü durumlarda aktarılabilecektir.

7. Kişisel Verilerin Saklanması Ve Korunması

ertuncteknik.com , kişisel verilerinizin barındığı sistemleri ve veri tabanlarını, KVKK’nun 12. Maddesi gereği kişisel verilerin hukuka aykırı olarak işlenmesini önlemekle, yetkisiz kişilerin erişimlerini engellemekle; muhafazalarını sağlamak amacıyla hash, şifreleme, işlem kaydı, erişim yönetimi gibi yazılımsal tedbirleri ve fiziksel güvenlik önlemleri almakla mükelleftir. Kişisel verilerin yasal olmayan yollarla başkaları tarafından elde edilmesinin öğrenilmesi halinde durum derhal, yasal düzenlemeye uygun ve yazılı olarak Kişisel Verileri Koruma Kurulu’na bildirilecektir.

8. Kişisel Verilerin Güncel Ve Doğru Tutulması

KVKK’nun 4. maddesi uyarınca ertuncteknik.com’un kişisel verilerinizi doğru ve güncel olarak tutma yükümlülüğü bulunmaktadır. Bu kapsamda ertuncteknik.com’un yürürlükteki mevzuattan doğan yükümlülüklerini yerine getirebilmesi için üyelerimizin doğru ve güncel verilerini paylaşması veya web sitesi / mobil uygulama üzerinden güncellemesi gerekmektedir.

9. 6698 Sayılı Kvkk Uyarınca Kişisel Veri Sahibinin Hakları

6698 sayılı KVKK 11.maddesi 07 Ekim 2016 tarihinde yürürlüğe girmiş olup ilgili madde gereğince, Kişisel Veri Sahibi’nin bu tarihten sonraki hakları aşağıdaki gibidir:

Kişisel Veri Sahibi, ertuncteknik.com’a (veri sorumlusu) başvurarak kendisiyle ilgili;
Kişisel veri işlenip işlenmediğini öğrenme,
Kişisel verileri işlenmişse buna ilişkin bilgi talep etme,
Kişisel verilerin işlenme amacını ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme,
Yurt içinde veya yurt dışında kişisel verilerin aktarıldığı üçüncü kişileri bilme,
Kişisel verilerin eksik veya yanlış işlenmiş olması hâlinde bunların düzeltilmesini isteme,
KVKK’nun 7. maddesinde öngörülen şartlar çerçevesinde kişisel verilerin silinmesini veya yok edilmesini isteme,
Kişisel verilerin düzeltilmesi, silinmesi, yok edilmesi halinde bu işlemlerin, kişisel verilerin aktarıldığı üçüncü kişilere de bildirilmesini isteme,
İşlenen verilerin münhasıran otomatik sistemler vasıtasıyla analiz edilmesi suretiyle kişinin kendisi aleyhine bir sonucun ortaya çıkmasına itiraz etme,
Kişisel verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara uğraması hâlinde zararın giderilmesini talep etme, haklarına sahiptir.
10. İletişim ve Başvuru Yöntemi

ertuncteknik.com tarafından atanacak Veri Sorumlusu Temsilcisi, yasal altyapı sağlandığında Veri Sorumluları Sicilinde ve bu belgenin bulunduğu internet adresinde ilan edilecektir.

Kişisel Veri Sahipleri, sorularını, görüşlerini veya taleplerini emre@ertunc.com e-posta adresine yöneltebilirler.

ertuncteknik.com iletilen taleplere, gerekçeli olmak ve 30 gün içinde cevap vermek kaydıyla olumlu/olumsuz yanıtını, yazılı veya dijital ortamdan verebilir. Taleplere ilişkin gerekli işlemlerin ücretsiz olması esastır. Ancak işlemlerin bir maliyet gerektirmesi halinde, ertuncteknik.com , ücret talebinde bulunma hakkını saklı tutar. Bu ücretler, Kişisel Verilerin Korunması Kurulu tarafından, Kişisel Verilerin korunması Kanunu’nun 13. maddesine göre belirlenen tarife üzerinden belirlenir.

Web sayfamızda, uygulamalarımızda ve diğer sair kanallarımızda kişisel verilerinizi paylaşarak Kişisel Veriler Politikamızı ve politikamızda yer alan işlenme, işlenme yöntemleri, verilerin aktarılması, satışı ve diğer ilgili hususlar hakkındaki şartları, Bir sosyal medya uygulaması olan ertuncteknik.com ile paylaşılan verilerin web sayfasında, uygulamalarda ve sosyal medya kanallarında kullanılmasını, bildirimlerde ve önerilerde bulunulmasını, üyelerin yararına olması şartıyla ticari anlamda üçüncü kişilerle paylaşılabileceğini ve yine bunun için kabulde bulunduğunuzu, yasal haklarınızı kullanmadan önce ertuncteknik.com’a başvuruda bulunacağınızı KVKK’da büyük öneme haiz, belirli bir konuya ilişkin, bilgilendirilmeye dayanan ve özgür iradeyle açıklanan rıza şeklinde tanımlanan açık bir rıza ile kabul ettiğinizi beyan etmiş olursunuz.

Bu sözleşme en son 01/05/2021. tarihinde güncellenmiştir.*/