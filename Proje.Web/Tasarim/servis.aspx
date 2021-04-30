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
                <h3>SERVİS BİLGİSİ GÜNCELLEME MENÜSÜ</h3>

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
                <h3>SERVİS KAYITLARI LİSTESİ</h3>

                <asp:GridView ID="GridViewServisList" runat="server" AutoGenerateDeleteButton="True" OnRowDeleting="GridViewServisList_RowDeleting" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewServisList_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
            </div>

        <div>
            <h3>PARÇA SEÇİM İŞLEMLERİ</h3>
            <div id="divParcaList" runat="server">
                <h4>ARAMAK İSTEDİĞİNİZ PARÇANIN İSMİNİ GİRİP ENTER TUŞUNA BASINIZ</h4>
                <asp:Table ID="Table3" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="OnTextChanged"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><asp:GridView ID="GridViewParca" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="OnPaging" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                
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
        </div>

            
            
            <div id="divServisKalem" runat="server">
                <asp:GridView ID="GridViewSrKalem" runat="server" AutoGenerateDeleteButton="True" OnRowDeleted="GridViewSrKalem_RowDeleted" OnRowDeleting="GridViewSrKalem_RowDeleting" OnSelectedIndexChanged="GridViewSrKalem_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            </div>
            
        </div>
</asp:Content>
