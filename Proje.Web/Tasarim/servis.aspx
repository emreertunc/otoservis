<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="servis.aspx.cs" Inherits="Proje.Web.Tasarim.servis" %>
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
                                                        <h4>Servis Ekranı</h4>
                                                        <span>Bu ekranda servisle ilgili tüm işlemleri gerçekleştirebilirsiniz.</span>
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
    <div class="clearfix">
            <div id="divRedirect" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" CssClass="label label-danger" Text="İŞLEM YAPILACAK SERVİS KODUNU SEÇMEK ÜZERE SERVİS GİRİŞ EKRANINA YÖNLENDİRME İÇİN AŞAĞIDAKİ BUTONU KULLANINIZ" Font-Italic="False" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Button ID="Button3" CssClass="btn btn-danger" runat="server" OnClick="Button3_Click" Text="SERVİS GİRİŞ EKRANI" Visible="False" />
            </div>

            <div id="divServisGuncelle" runat="server">
                <asp:Table ID="Table1" runat="server" CssClass="table table-borderless table-dark">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Servis Güncelleme</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow ID="TableRow1" runat="server">
                    <asp:TableCell>Servis ID</asp:TableCell>
                    <asp:TableCell>Araç ID</asp:TableCell>
                    <asp:TableCell>Servis Açıklaması</asp:TableCell>
                    <asp:TableCell>Servise Giriş Tarihi</asp:TableCell>
                    <asp:TableCell>Servisten Çıkış Tarihi</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow2" runat="server">
                    <asp:TableCell><asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txtDatePicker" runat="server" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableFooterRow>
                    <asp:TableCell>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" Text="Kaydı Güncelle" OnClick="Button1_Click" />
                    </asp:TableCell>
                </asp:TableFooterRow>
                </asp:Table>
            </div>
            

            <div id="divServisList" runat="server">
                <asp:Label ID="Label3" runat="server" Text="SERVİS KAYITLARI LİSTESİ"></asp:Label>
                <asp:GridView ID="GridViewServisList" runat="server" AutoGenerateDeleteButton="True" OnRowDeleting="GridViewServisList_RowDeleting" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewServisList_SelectedIndexChanged">
                </asp:GridView>
            </div>

            <div id="divParcaList" runat="server">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="OnTextChanged"></asp:TextBox>
                <asp:GridView ID="GridViewParca" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="OnPaging">
                </asp:GridView>
            </div>
            
            <div id="divParcaGiris" runat="server">
                <asp:Table ID="Table2" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Parça ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Parça Adı</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Adet</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Açıklama</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Servis Kalemi Ekle" OnClick="Button2_Click" /></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </div>
            
            <div id="divServisKalem" runat="server">
                <asp:GridView ID="GridViewSrKalem" runat="server" AutoGenerateDeleteButton="True" OnRowDeleted="GridViewSrKalem_RowDeleted" OnRowDeleting="GridViewSrKalem_RowDeleting" OnSelectedIndexChanged="GridViewSrKalem_SelectedIndexChanged">
            </asp:GridView>
            </div>
            
        </div>
</asp:Content>
