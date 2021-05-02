<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="user-settings.aspx.cs" Inherits="Proje.Web.Tasarim.user_settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont-font bg-c-orenge"></i>
                                                    <div class="d-inline">
                                                        <h4>Kullanıcı Ayar Ekranı</h4>
                                                        <span>Bu ekranda kullanıcı bilgilerinizi güncelleyebilirsiniz.</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                   <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <a href="index.html">
                                                            <i class="icofont icofont-home"></i>
                                                        </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Icons</a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#">Ico- Fonts</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Page-header end -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="clearfix">
        <div id="divUnauthorized" class="alert alert-danger text-center" role="alert" runat="server">
            <h4 class="alert-heading text-center">YETKİSİZ GİRİŞ YAPILDI</h4>
            10 saniye içinde servis giriş ekranına yönlendirileceksiniz. Yönlendirilme gerçekleşmezse<br />
                <a href="sign-in.aspx" class="alert-link font-italic">BURAYA TIKLAYARAK</a> devam edebilirsiniz.
        </div>


        <div id="divKullaniciGuncelleme" runat="server">
            <asp:UpdatePanel ID="UpdatePanelMusteri" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-9">
                            <div class="table-responsive" style="overflow: visible;">
                                <h3>KULLANICI AYAR MENÜSÜ</h3>
                                <asp:Table ID="TableUser" CssClass="table table-borderless table-dark" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="LabelAd" runat="server" Text=""></asp:Label></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label1" runat="server" CssClass="label label-primary" Text="Kullanıcı Adı:"></asp:Label></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label2" runat="server" CssClass="label label-primary" Text="Parola:"></asp:Label></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtParola" CssClass="form-control" runat="server"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label3" runat="server" CssClass="label label-primary" Text="TC Kimlik No:"></asp:Label></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtTCKN" CssClass="form-control" runat="server"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label4" runat="server" CssClass="label label-primary" Text="Ad Soyad:"></asp:Label></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtAdSoyad" CssClass="form-control" runat="server"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label5" runat="server" CssClass="label label-primary" Text="Telefon Numarası:"></asp:Label></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtTelno" CssClass="form-control" runat="server"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="Label6" runat="server" Text=""></asp:Label></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Button ID="btnGuncelle" CssClass="btn btn-primary" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click" /></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:Label ID="LabelBilgi" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>
</asp:Content>
