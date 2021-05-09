﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servisislemdeneme.aspx.cs" Inherits="Proje.Web.Tasarim.servisislemdeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="assets/js/emredate/styles/jquery-ui.css" rel="stylesheet" />
    <script src="assets/js/emredate/scripts/jquery-1.11.3.min.js"></script>
    <script src="assets/js/emredate/scripts/jquery-ui.js"></script>
 <script>
     $(function () {
         $('#txtDatePicker').datepicker({
             dateFormat: 'dd-mm-yy',
             changeMonth: true,
             changeYear: true,
             yearRange: '1950:2100'
         });
     })
 </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="clearfix">
            <div id="divRedirect" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" CssClass="label label-danger" Text="İŞLEM YAPILACAK SERVİS KODUNU SEÇMEK ÜZERE SERVİS GİRİŞ EKRANINA YÖNLENDİRME İÇİN AŞAĞIDAKİ BUTONU KULLANINIZ" Font-Italic="False" Visible="False"></asp:Label>
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
                    <asp:TableCell>Servis Aktiflik Durumu</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow2" runat="server">
                    <asp:TableCell><asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txtDatePicker" runat="server" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <%--<asp:TableCell><asp:TextBox ID="txtAktif" runat="server" CssClass="form-control" ></asp:TextBox></asp:TableCell>--%>
                    <asp:TableCell><asp:DropDownList ID="ddlAktif" CssClass="txt_drpbx" runat="server">
   <asp:ListItem Text="Aktif" Value="True"></asp:ListItem>
   <asp:ListItem Text="Pasif" Value="False"></asp:ListItem>
 </asp:DropDownList></asp:TableCell>
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
                <asp:Button ID="ButtonTemizle" runat="server" Text="Temizle" OnClick="ButtonTemizle_Click" />
                <asp:GridView ID="GridViewParca" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="OnPaging">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Seç" />
                </Columns>
                    
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
                <br />
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="SERVİSİ KAPAT" />
                <br />
            </div>
            
        </div>
    </form>

     
</body>
</html>
