<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign-up.aspx.cs" Inherits="Proje.Web.Tasarim.sign_up" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Ertunç Teknik - Kayıt Sayfası</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font--><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>

<body class="fix-menu">
    <!-- Pre-loader start -->
    <div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
        </div>
    </div>
</div>
    <!-- Pre-loader end -->
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="signup-card card-block auth-body mr-auto ml-auto">
                        <form class="md-float-material" runat="server">
                            <div class="text-center">
                                <img src="assets/images/auth/car-repair-xs-color.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">Kolayca kayıt olun.</h3>
                                    </div>
                                </div>
                                <hr/>
                                <div id="divSingupUyari" class="alert alert-warning text-center" role="alert" runat="server">Bilgilerin doğru girilmesi servis kayıtlarınıza ulaşabilmeniz açısından önemlidir. Lütfen dikkatli giriş yapınız.</div>
                                <div class="input-group">
                                    <asp:TextBox ID="txtAdSoyad"  CssClass="form-control"  PlaceHolder="Adınız ve Soyadınız" runat="server"></asp:TextBox>
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <asp:TextBox ID="txtTelNo" CssClass="form-control" PlaceHolder="Tel No (533xxxxxxx şeklinde giriniz)" runat="server" TextMode="Phone"></asp:TextBox>
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <asp:TextBox ID="txtTCKN"  CssClass="form-control"  PlaceHolder="TC Kimlik Numaranız" runat="server"></asp:TextBox>
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <asp:TextBox ID="txtUserName"  CssClass="form-control"  PlaceHolder="Kullanıcı Adınız" runat="server"></asp:TextBox>
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <asp:TextBox ID="txtPass"  CssClass="form-control"  PlaceHolder="Parola" TextMode="Password" runat="server"></asp:TextBox>
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <asp:TextBox ID="txtPass2"  CssClass="form-control"  PlaceHolder="Parolayı Onaylayın" TextMode="Password" runat="server"></asp:TextBox>
                                    <span class="md-line"></span>
                                </div>
                                
                                <div class="row m-t-25 text-left" runat="server">
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input id="checkboxKVKK" type="checkbox" value="" runat="server">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Kişisel Verilerin Korunması Kanunu uyarınca <a data-toggle="modal" href="#ModalKVKK">KULLANICI SÖZLEŞMESİNİ</a> okudum ve kabul ediyorum.</span>
                                            </label>


                                        </div>
                                    </div>
                                    <%--<div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Send me the <a href="#!">Newsletter</a> weekly.</span>
                                            </label>
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <asp:Button ID="ButtonKaydol" runat="server" Text="Kaydol" CssClass="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" OnClick="ButtonKaydol_Click" />
                                        
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Ertunç Teknik Servise Hoşgeldiniz</p>
                                        <p class="text-inverse text-left"><b>Emre Ertunç</b></p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="assets/images/auth/car-repair-xs-color.png" alt="small-logo.png">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
	
<%--    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
    <!-- Warning Section Ends -->--%>
    <!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="assets/js/modernizr/css-scrollbars.js"></script>
    <script type="text/javascript" src="assets/js/common-pages.js"></script>

    
<!-- KVKK Modal -->
<div class="modal fade" id="ModalKVKK" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">KULLANICI GİZLİLİK SÖZLEŞMESİ</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <p class="text-justify"></p>
          <h4>GİZLİLİK VE KİŞİSEL VERİLERİ KORUMA POLİTİKASI</h4>
          <p class="text-justify">ertuncteknik.com olarak kişisel verilerinizin güvenliği hususuna azami hassasiyet göstermekteyiz. Kişisel verileriniz 6698 sayılı Kişisel Verilerin Korunması Kanunu (“KVKK”)’na uygun olarak işlenmekte ve muhafaza edilmektedir. 
</p>
          <h4>1. Kişisel Verilerinizin Ne Şekilde İşlenebileceği</h4>
          <p class="text-justify">6698 sayılı KVKK uyarınca, ertuncteknik.com ile paylaştığınız kişisel verileriniz, tamamen veya kısmen, otomatik olarak veyahut herhangi bir veri kayıt sisteminin parçası olmak kaydıyla otomatik olmayan yollarla elde edilerek, kaydedilerek, depolanarak, değiştirilerek, yeniden düzenlenerek, kısacası veriler üzerinde gerçekleştirilen her türlü işleme konu olarak tarafımızdan işlenebilecektir. KVKK kapsamında veriler üzerinde gerçekleştirilen her türlü işlem “kişisel verilerin işlenmesi” olarak kabul edilmektedir.</p>
          <h4>2. Kişisel Verilerinizin İşlenme Amaçları Ve Hukuki Sebepleri</h4>
          <p class="text-justify">Paylaştığınız kişisel veriler,

Müşterilerimize verdiğimiz hizmetlerin gereklerini, sözleşmenin ve teknolojinin gereklerine uygun şekilde yapabilmek, sunulan ürün ve hizmetlerimizi geliştirebilmek için;
Kamu güvenliğine ilişkin hususlarda ve hukuki uyuşmazlıklarda, talep halinde ve mevzuat gereği savcılıklara, mahkemelere ve ilgili kamu görevlilerine bilgi verebilmek için;
Üyelerimize geniş kapsamda çeşitli imkânlar sunabilmek veya bu imkânları sunabilecek kişi veya kurumlarla yasal çerçevede paylaşabilmek için;
Reklam tercihlerini analiz etmek için,
6698 sayılı KVKK ve ilgili ikincil düzenlemelere uygun olarak işlenecektir.</p>
          <h4>3. Kişisel Verilerinizin Aktarılabileceği Üçüncü Kişi Veya Kuruluşlar Hakkında Bilgilendirme</h4>
          <p class="text-justify">Yukarıda belirtilen amaçlarla, ertuncteknik.com ile paylaştığınız kişisel verilerinizin aktarılabileceği kişi / kuruluşlar; ana hissedarlarımız, hissedarlarımız, reklam verenler, doğrudan veya dolaylı yurt içi / yurt dışı iştiraklerimiz; başta ertuncteknik.com altyapısını kullanan üye firmalar ve bunlarla sınırlı olmamak üzere sunulan hizmet ile ilgili kişi ve kuruluşlar olmak üzere, faaliyetlerimizi yürütmek üzere ve/veya Veri İşleyen sıfatı ile hizmet aldığımız, iş birliği yaptığımız, program ortağı kuruluşları, yurtiçi / yurtdışı kuruluşlar ve diğer 3. kişiler ve kuruluşlardır.

Reklam amaçlı kullanılacak çerezlere ilişkin düzenlemelerimiz “ ertuncteknik.com Çerez Politikası” olup, şu anda okuduğunuz “Gizlilik ve Kişisel Verilerin Korunması Politikası”nın bir parçasını oluşturmaktadır. Çerez Politikamız hakkında bilgi edinmek için lütfen tıklayın. (Gereken çerez politikası örneğine belgenin en altında bulunan bağlantı ile ulaşabilirsiniz)
</p>
          <h4>4. Kişisel Verilerinizin Toplanma Şekli</h4>
          <p class="text-justify">Kişisel verileriniz,

ertuncteknik.com internet sitesi ve mobil uygulamalarındaki formlar ile ad, soyad, adres, telefon, iş veya özel e-posta adresi gibi bilgiler ile; kullanıcı adı ve şifresi kullanılarak giriş yapılan sayfalardaki tercihleri, gerçekleştirilen işlemlerin IP kayıtları, tarayıcı tarafından toplanan çerez verileri ile gezinme süre ve detaylarını içeren veriler, konum verileri şeklinde;
ertuncteknik.com ile ticari ilişki kurmak, iş başvurusu yapmak, teklif vermek gibi amaçlarla, kartvizit, özgeçmiş (cv), teklif vermek ve sair yollarla kişisel verilerini paylaşan kişilerden alınan, fiziki veya sanal bir ortamda, yüz yüze ya da mesafeli, sözlü veya yazılı ya da elektronik ortamdan;
Ayrıca farklı kanallardan dolaylı yoldan elde edilen, web sitesi, blog, yarışma, anket, oyun, kampanya ve benzeri amaçlı kullanılan (mikro) web sitelerinden ve sosyal medyadan elde edilen veriler, e-bülten okuma veya tıklama hareketleri, kamuya açık veri tabanlarının sunduğu veriler, sosyal medya platformları (Facebook, Twitter, Google, Instagram, Snapchat vs) gibi sosyal paylaşım sitelerinden paylaşıma açık profil ve verilerden; işlenebilmekte ve toplanabilmektedir.
</p>
          <h4>5. KVKK Yürürlüğe Girmeden Önce Elde Edilen Kişisel Verileriniz</h4>
          <p class="text-justify">ertuncteknik.com, KVKK’nun yürürlük tarihi olan 7 Nisan 2016 tarihinden önce yayım hayatına başlamadığı için bu tarihten önce depoladığımız bir kişisel veri bulunmamaktadır. (Eğer web siteniz bu tarihten önce de veri topluyorsa verilerin ne şekilde işlendiği ve muhafaza edildiği mutlaka belirtilmelidir.)
</p>
          <h4>6. Kişisel Verilerinizin Aktarılması</h4>
          <p class="text-justify">Türkiye’de işlenerek veya Türkiye dışında işlenip muhafaza edilmek üzere, yukarıda sayılan yöntemlerden herhangi birisi ile toplanmış kişisel verileriniz KVKK kapsamında kalmak kaydıyla ve sözleşme amaçlarına uygun olarak yurtdışında bulunan (Kişisel Veriler Kurulu tarafından akredite edilen ve kişisel verilerin korunması hususunda yeterli korumanın bulunduğu ülkelere) hizmet aracılarına da aktarılabilecektir.

Kişisel Verileriniz;

Ürün ve hizmetlerin sunulması ve tanıtılması için işbirliği yapılan ve/veya hizmet alınan iş ortaklarımız,
Acil yardım çağrısı halinde konumunuzu tespit edecek olan yetkili mercilere,
Düzenleyici ve denetleyici kurumlar ile mahkeme ve icra müdürlükleri gibi sair resmi kurumlara, kişisel verilerinizi talep etmeye yetkili olan diğer kamu kurum veya kuruluşlarına,
ertuncteknik.com ile ticari ilişki içinde bulunan ve telefon numaranıza sahip tüzel kişilere,
Gerekli görüldüğü durumlarda aktarılabilecektir.
</p>
          <h4>7. Kişisel Verilerin Saklanması Ve Korunması</h4>
          <p class="text-justify">ertuncteknik.com , kişisel verilerinizin barındığı sistemleri ve veri tabanlarını, KVKK’nun 12. Maddesi gereği kişisel verilerin hukuka aykırı olarak işlenmesini önlemekle, yetkisiz kişilerin erişimlerini engellemekle; muhafazalarını sağlamak amacıyla hash, şifreleme, işlem kaydı, erişim yönetimi gibi yazılımsal tedbirleri ve fiziksel güvenlik önlemleri almakla mükelleftir. Kişisel verilerin yasal olmayan yollarla başkaları tarafından elde edilmesinin öğrenilmesi halinde durum derhal, yasal düzenlemeye uygun ve yazılı olarak Kişisel Verileri Koruma Kurulu’na bildirilecektir.
</p>
          <h4>8. Kişisel Verilerin Güncel Ve Doğru Tutulması</h4>
          <p class="text-justify">KVKK’nun 4. maddesi uyarınca ertuncteknik.com’un kişisel verilerinizi doğru ve güncel olarak tutma yükümlülüğü bulunmaktadır. Bu kapsamda ertuncteknik.com’un yürürlükteki mevzuattan doğan yükümlülüklerini yerine getirebilmesi için üyelerimizin doğru ve güncel verilerini paylaşması veya web sitesi / mobil uygulama üzerinden güncellemesi gerekmektedir.
</p>
          <h4>9. 6698 Sayılı Kvkk Uyarınca Kişisel Veri Sahibinin Hakları</h4>
          <p class="text-justify">6698 sayılı KVKK 11.maddesi 07 Ekim 2016 tarihinde yürürlüğe girmiş olup ilgili madde gereğince, Kişisel Veri Sahibi’nin bu tarihten sonraki hakları aşağıdaki gibidir:

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
</p>
          <h4>10. İletişim ve Başvuru Yöntemi</h4>
          <p class="text-justify">ertuncteknik.com tarafından atanacak Veri Sorumlusu Temsilcisi, yasal altyapı sağlandığında Veri Sorumluları Sicilinde ve bu belgenin bulunduğu internet adresinde ilan edilecektir.

Kişisel Veri Sahipleri, sorularını, görüşlerini veya taleplerini emre@ertunc.com e-posta adresine yöneltebilirler.

ertuncteknik.com iletilen taleplere, gerekçeli olmak ve 30 gün içinde cevap vermek kaydıyla olumlu/olumsuz yanıtını, yazılı veya dijital ortamdan verebilir. Taleplere ilişkin gerekli işlemlerin ücretsiz olması esastır. Ancak işlemlerin bir maliyet gerektirmesi halinde, ertuncteknik.com , ücret talebinde bulunma hakkını saklı tutar. Bu ücretler, Kişisel Verilerin Korunması Kurulu tarafından, Kişisel Verilerin korunması Kanunu’nun 13. maddesine göre belirlenen tarife üzerinden belirlenir.

Web sayfamızda, uygulamalarımızda ve diğer sair kanallarımızda kişisel verilerinizi paylaşarak Kişisel Veriler Politikamızı ve politikamızda yer alan işlenme, işlenme yöntemleri, verilerin aktarılması, satışı ve diğer ilgili hususlar hakkındaki şartları, Bir sosyal medya uygulaması olan ertuncteknik.com ile paylaşılan verilerin web sayfasında, uygulamalarda ve sosyal medya kanallarında kullanılmasını, bildirimlerde ve önerilerde bulunulmasını, üyelerin yararına olması şartıyla ticari anlamda üçüncü kişilerle paylaşılabileceğini ve yine bunun için kabulde bulunduğunuzu, yasal haklarınızı kullanmadan önce ertuncteknik.com’a başvuruda bulunacağınızı KVKK’da büyük öneme haiz, belirli bir konuya ilişkin, bilgilendirilmeye dayanan ve özgür iradeyle açıklanan rıza şeklinde tanımlanan açık bir rıza ile kabul ettiğinizi beyan etmiş olursunuz.
</p>
          <p class="text-justify">Bu sözleşme en son 01/05/2021 tarihinde güncellenmiştir.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Geri Dön</button>
      </div>
    </div>
  </div>
</div>




<!-- SMS Modal -->
<div class="modal fade" id="ModalSMSAuth" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="labelModal">SMS DOĞRULAMA</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Giriş yap</button>
      </div>
    </div>
  </div>
</div>
</body>

</html>
