<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="servisgiris.aspx.cs" Inherits="Proje.Web.Tasarim.servisgiris" %>
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
                                                        <h4>Servis Giriş Ekranı</h4>
                                                        <span>Bu ekranda servise giriş yapan aracın bilgilerini sisteme girebilir, yoksa yeni müşteri kaydı açabilirsiniz.</span>
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
            <div style="float:left;margin-left:300px">
                <asp:Table ID="Table1" runat="server" CssClass="table table-borderless table-dark">


                <asp:TableRow ID="TableRow12" runat="server">
                <asp:TableCell>Kayıtlı Araç</asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList> <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Seçim" />
                </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow11" runat="server">
                <asp:TableCell></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow13" runat="server">
                <asp:TableCell></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow17" runat="server">
                <asp:TableCell>Yeni Araç Kaydı</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow2" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox1" runat="server">Plaka</asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow4" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox2" runat="server" ReadOnly="True">Marka</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" style="height: 25px">
                </asp:DropDownList></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow3" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox3" runat="server" ReadOnly="True">Model</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                </asp:DropDownList></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow7" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox4" runat="server" ReadOnly="True">Müşteri</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                </asp:DropDownList></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow5" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox5" runat="server" ReadOnly="True">Model Yılı</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                </asp:DropDownList></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow8" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox6" runat="server">Ruhsat No</asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow6" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox7" runat="server">Şase No</asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow9" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox8" runat="server">Motor No</asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow10" runat="server">
                <asp:TableCell><asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Yeni Kayıt" /></asp:TableCell>
                </asp:TableRow>

                </asp:Table>
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>
            </div>
            



            <div style="float:right; margin-right:200px; margin-top:300px">

                <asp:Table ID="Table2" runat="server" CssClass="table table-dark">

                <asp:TableRow ID="TableRow18" runat="server">
                <asp:TableCell>Yeni Müşteri Girişi</asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="TableRow14" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox9" runat="server">TC No</asp:TextBox></asp:TableCell>
                </asp:TableRow>


                <asp:TableRow ID="TableRow15" runat="server">
                <asp:TableCell><asp:TextBox ID="TextBox10" runat="server">Ad Soyad</asp:TextBox></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow ID="TableRow16" runat="server">
                <asp:TableCell><asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Müşteri Ekle" /></asp:TableCell>
                </asp:TableRow>
                </asp:Table>

                <br />
                <asp:Label ID="Label2" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>

            </div>
        </div>
</asp:Content>
