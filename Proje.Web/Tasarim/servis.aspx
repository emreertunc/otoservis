<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="servis.aspx.cs" Inherits="Proje.Web.Tasarim.servis" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/js/emredate/styles/jquery-ui.css" rel="stylesheet" />
    <script src="assets/js/emredate/scripts/jquery-1.11.3.min.js"></script>
    <script src="assets/js/emredate/scripts/jquery-ui.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            $("[id$=txtDatePicker]").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
        })
    </script>

 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont-font bg-c-orenge"></i>
                                                    <div class="d-inline">
                                                        <br />
                                                        <h4>Servis Ekranı</h4>
                                                        <span>Bu ekranda servisle ilgili tüm işlemleri gerçekleştirebilirsiniz.</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                   <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <a href="default.aspx">
                                                            <i class="icofont icofont-home"></i>
                                                        </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="servis.aspx">Servis Ekranı</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Page-header end -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="clearfix">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div id="divRedirect" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <%--<br />
                <asp:Label ID="Label2" runat="server" CssClass="label label-danger" Text="İŞLEM YAPILACAK SERVİS KODUNU SEÇMEK ÜZERE SERVİS GİRİŞ EKRANINA YÖNLENDİRME İÇİN AŞAĞIDAKİ BUTONU KULLANINIZ" Font-Italic="False" Visible="False"></asp:Label>--%>
            <div id="divUnauthorized" class="alert alert-danger text-center" role="alert" runat="server">
                <h4 class="alert-heading text-center">SERVİS SEÇİLMEDEN GİRİŞ YAPILDI</h4>
                10 saniye içinde servis giriş ekranına yönlendirileceksiniz.<br />
                Yönlendirilme gerçekleşmezse 
                <a href="servisgiris.aspx" class="text-success alert-link font-italic">BURAYA TIKLAYARAK</a> devam edebilir veya
                <br />
                <a href="servisdurum.aspx" class="text-success alert-link font-italic">BURAYA TIKLAYARAK</a> aktif servislerin listesine ulaşabilirsiniz.
            </div>
            <%--<br />
                <br />
                <br />
                <asp:Button ID="Button3" CssClass="btn btn-danger" runat="server" OnClick="Button3_Click" Text="SERVİS GİRİŞ EKRANI" Visible="False" />--%>
        </div>

        <asp:UpdatePanel ID="UpdatePanelServis" runat="server">
            <ContentTemplate>
                <div id="divServisGuncelle" class="rounded" style="background-color: lightgray" runat="server">


                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card mb-3" style="background-color: lightgray">
                                <div class="card-header">
                                    <h3>Servis Bilgi Güncelleme Menüsü</h3>
                                    <span></span>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option" style="width: 35px;">
                                            <li class=""><i class="icofont icofont-simple-left"></i></li>
                                            <li><i class="icofont icofont-maximize full-card"></i></li>
                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                                            <li><i class="icofont icofont-error close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="card-body">
                                        <div class="table-responsive" style="overflow: visible;">

                                            <asp:Table ID="Table1" runat="server" Width="100%" CssClass="table table-borderless">
                                                <asp:TableRow ID="TableRow1" runat="server">
                                                    <asp:TableCell>Servis ID</asp:TableCell>
                                                    <asp:TableCell>Araç ID</asp:TableCell>
                                                    <asp:TableCell>Servis Açıklaması</asp:TableCell>
                                                    <asp:TableCell>Servise Giriş Tarihi</asp:TableCell>
                                                    <asp:TableCell>Servisten Çıkış Tarihi</asp:TableCell>
                                                    <asp:TableCell>Servis Aktiflik Durumu</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow ID="TableRow2" runat="server">
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="txtDatePicker" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:DropDownList ID="ddlAktif" CssClass="form-control" runat="server">
                                                            <asp:ListItem Text="Aktif" Value="True"></asp:ListItem>
                                                            <asp:ListItem Text="Pasif" Value="False"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </asp:TableCell>
                                                </asp:TableRow>

                                                <asp:TableFooterRow>
                                                    <asp:TableCell>
                                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" Text="Kaydı Güncelle" OnClick="Button1_Click" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                            <%--<asp:Label ID="LabelBilgi2" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>--%>
                                                    </asp:TableCell>
                                                </asp:TableFooterRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />

                <div id="divServisList" runat="server">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card mb-3" style="background-color: lightgray">
                                <div class="card-header">
                                    <h3>Servis Kayıtları Listesi</h3>
                                    <span></span>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option" style="width: 35px;">
                                            <li class=""><i class="icofont icofont-simple-left"></i></li>
                                            <li><i class="icofont icofont-maximize full-card"></i></li>
                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                                            <li><i class="icofont icofont-error close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="card-body">
                                        <div class="table-responsive" style="overflow: visible;">

                                            <asp:GridView ID="GridViewServisList" Width="100%" CssClass="table table-bordered table-striped table-hover" runat="server" OnRowDeleting="GridViewServisList_RowDeleting" OnSelectedIndexChanged="GridViewServisList_SelectedIndexChanged" OnRowDataBound="GridViewServisList_RowDataBound">
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True" SelectText="<i class='btn-success ti-view-list'></i> Seç" />
                                                    <asp:CommandField ShowDeleteButton="True" DeleteText="<i class='btn-danger ti-trash'></i> Sil" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />

                <div id="divParcaCard" runat="server" class="col-sm-12">
                    <div class="card mb-3" style="background-color: lightgray">
                        <div class="card-header">
                            <h3>Parça Arama & Servis Kalemi Ekleme</h3>
                            <span></span>
                            <div class="card-header-right">
                                <ul class="list-unstyled card-option" style="width: 35px;">
                                    <li class=""><i class="icofont icofont-simple-left"></i></li>
                                    <li><i class="icofont icofont-maximize full-card"></i></li>
                                    <li><i class="icofont icofont-minus minimize-card"></i></li>
                                    <li><i class="icofont icofont-refresh reload-card"></i></li>
                                    <li><i class="icofont icofont-error close-card"></i></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-block">
                            <div class="card-body">

                                <div id="divParca" runat="server">
                                    <div id="divParcaGiris" runat="server">
                                        <div class="row text-white bg-secondary rounded">
                                            <div class="col-md-12">
                                                <div class="table-responsive" style="overflow: visible;">

                                                    <asp:Table ID="Table2" Width="100%" CssClass="table table-borderless" runat="server">
                                                        <asp:TableHeaderRow>
                                                            <asp:TableHeaderCell>Parça ID</asp:TableHeaderCell>
                                                            <asp:TableHeaderCell>Parça Adı</asp:TableHeaderCell>
                                                            <asp:TableHeaderCell>Adet</asp:TableHeaderCell>
                                                            <asp:TableHeaderCell>Açıklama</asp:TableHeaderCell>
                                                        </asp:TableHeaderRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Servis Kalemi Ekle" OnClick="Button2_Click" />
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div id="divParcaList" runat="server">
                                        <div class="row text-white bg-secondary rounded">
                                            <div class="col-md-12">
                                                <div class="table-responsive" style="overflow: visible;">

                                                    <br />
                                                    <br />
                                                    <div class="col-2 d-inline-block">
                                                        <asp:Label ID="LabelBaslik" runat="server" Style="font-size: 20px;" Text="Parça ismiyle arama:"></asp:Label>
                                                    </div>
                                                    <div class="col-4 d-inline-block">
                                                        <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_OnTextChanged"></asp:TextBox>
                                                    </div>
                                                    <div class="col-1 d-inline-block">
                                                        <asp:Button ID="ButtonTemizle" CssClass="btn btn-warning" runat="server" Text="Aramayı Temizle" OnClick="ButtonTemizle_Click" />
                                                    </div>

                                                    <asp:AutoCompleteExtender ID="extTxtSearch" runat="server" MinimumPrefixLength="1" ServiceMethod="getParcaAd"
                                                        ServicePath="~/WebServiceParca.asmx" TargetControlID="txtSearch">
                                                    </asp:AutoCompleteExtender>

                                                    <br />
                                                    <br />

                                                    <asp:GridView ID="GridViewParca" Width="100%" CssClass="table table-striped table-bordered table-borderless table-hover" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="OnPaging" OnRowDataBound="GridViewParca_RowDataBound">
                                                        <Columns>
                                                            <asp:CommandField ShowSelectButton="True" SelectText="<i class='btn-success ti-view-list'></i> Seç" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <br />
                    <br />
                </div>

                <div id="divServisKalem" class="rounded" style="background-color: lightgray" runat="server">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card mb-3" style="background-color: lightgray">
                                <div class="card-header">
                                    <h3>Servis Kalemleri</h3>
                                    <span></span>
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option" style="width: 35px;">
                                            <li class=""><i class="icofont icofont-simple-left"></i></li>
                                            <li><i class="icofont icofont-maximize full-card"></i></li>
                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                                            <li><i class="icofont icofont-error close-card"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="card-body">
                                        <div class="table-responsive" style="overflow: visible;">

                                            <asp:GridView ID="GridViewSrKalem" Width="100%" CssClass="table table-striped table-bordered table-hover" runat="server" OnRowDeleted="GridViewSrKalem_RowDeleted" OnRowDeleting="GridViewSrKalem_RowDeleting" OnSelectedIndexChanged="GridViewSrKalem_SelectedIndexChanged" OnRowDataBound="GridViewSrKalem_RowDataBound">
                                                <Columns>
                                                    <asp:CommandField ShowDeleteButton="True" DeleteText="<i class='btn-danger ti-trash'></i> Sil" />
                                                </Columns>
                                            </asp:GridView>

                                            <br />
                                            <asp:Button ID="Button4" runat="server" CssClass="btn btn-danger" OnClick="Button4_Click" Text="SERVİSİ KAPAT" />
                                            <br />
                                            <%--<asp:Label ID="LabelBilgi" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
