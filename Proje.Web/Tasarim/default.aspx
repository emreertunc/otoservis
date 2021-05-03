<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Proje.Web.Tasarim._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <div id="divGuestUyari" class="alert alert-danger text-center" role="alert" runat="server"> <h4 class="alert-heading text-center">MİSAFİR GİRİŞİ YAPILDI</h4>SİSTEME MİSAFİR OLARAK GİRİŞ YAPTINIZ. LÜTFEN <a href="sign-in.aspx" class="alert-link font-italic">OTURUM AÇIN</a>  YA DA <a href="sign-up.aspx" class="alert-link font-italic">KAYDOLUN</a></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManagerDefaultPage" runat="server"></asp:ScriptManager>

    

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1" class=""></li>
          <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="assets/images/slider/slide5.jpg" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>Sürpriz masraflar yok</h1>
                <p>Tüm işlemler şeffaf şekilde anlık olarak web sitemizden takip edilebilir</p>
                <p><a class="btn btn-lg btn-primary" href="sign-up.aspx" role="button">HEMEN KAYIT OL</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="assets/images/slider/slide2.jpg" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>Aracınıza kendi aracımızmış gibi bakıyoruz.</h1>
                <p>Yalnızca en kaliteli yedek parçaları kullanıyoruz.</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Daha fazla bilgi</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="assets/images/slider/slide3.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1>Alanında uzman teknik elemanlar</h1>
                <p>Aracınız emin ellerde</p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4">
            <img class="rounded-circle" src="assets/images/slider/repair2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Alanında Uzman Ekip</h2>
            <p>Her şeyi A'dan Z'ye sizin için düşündük. Aracınız her daim emin ellerde olacak. Tüm süreçlerimizde müşterilerimize %100 memnuniyet garanti veriyoruz.</p>
            <p><a class="btn btn-secondary" href="sign-up.aspx" role="button">Hemen Kayıt olun »</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="assets/images/slider/repair4.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Sınıfının en iyisi ürünler</h2>
            <p>Tüm ürün ve parçalarımız uzmanlarımız tarafından seçilmiş A kalite ürünlerdir. Aklınızı kurcalayacak hiçbir durumla karşılaşmayacaksınız.</p>
             <p><a class="btn btn-secondary" href="sign-up.aspx" role="button">Hemen Kayıt olun »</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="assets/images/slider/repair5.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Tadını çıkarın</h2>
            <p>Aracınız sektörün en iyilerinin ellerinde bakımdan geçerken tek yapmanız gereken bekleme salonunda ikramlardan yararlanıp keyfinize bakmak</p>
            <p><a class="btn btn-secondary" href="sign-up.aspx" role="button">Hemen Kayıt olun »</a></p>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Alanında Uzman Ekip</h2>
            <p class="lead">Her şeyi A'dan Z'ye sizin için düşündük. Aracınız her daim emin ellerde olacak. Tüm süreçlerimizde müşterilerimize %100 memnuniyet garanti veriyoruz.</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" style="width: 500px; height: 500px;" src="assets/images/slider/repair500.jpg" data-holder-rendered="true">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">Sınıfının en iyisi ürünler</h2>
            <p class="lead">Tüm ürün ve parçalarımız uzmanlarımız tarafından seçilmiş A kalite ürünlerdir. Aklınızı kurcalayacak hiçbir durumla karşılaşmayacaksınız.</p>
          </div>
          <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" src="assets/images/slider/repair500-2.jpg" data-holder-rendered="true" style="width: 500px; height: 500px;">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Tadını çıkarın</h2>
            <p class="lead">Aracınız sektörün en iyilerinin ellerinde bakımdan geçerken tek yapmanız gereken bekleme salonunda ikramlardan yararlanıp keyfinize bakmak</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" src="assets/images/slider/repair500-3.jpg" data-holder-rendered="true" style="width: 500px; height: 500px;">
          </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

      </div>



</asp:Content>
