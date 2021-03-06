<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="servisgiris.aspx.cs" Inherits="Proje.Web.Tasarim.servisgiris" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                                                        <a href="default.aspx">
                                                            <i class="icofont icofont-home"></i>
                                                        </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="servisgiris.aspx">Servis Giriş Ekranı</a>
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
        <asp:UpdatePanel ID="UpdatePanelServisKayit" runat="server">
            <ContentTemplate>



                <script type="text/javascript">
                    function DoPostBack(obj) {
                        __doPostBack(obj.id, 'OtherInformation');
                    }
                </script>


                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />


                <div class="row">
                    <div class="col-sm-4" runat="server">
                        <div class="card mb-3" style="background-color: lightgray">
                            <div class="card-header">
                                <h3>Kayıtlı Araç Seçimi</h3>
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
                                    <div class="d-inline-block">
                                        <asp:Label ID="LabelKayitliPlaka" Style="font-size: 20px;" runat="server" Text="Plaka:"></asp:Label>
                                        &nbsp;
                                &nbsp;
                                &nbsp;
                                    </div>
                                    <div class="d-inline-block">
                                        <asp:DropDownList ID="DropDownList1" Style="margin-bottom: 10px; margin-top: 20px" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="d-inline-block">
                                        <asp:Button ID="Button1" Style="padding: 5px 15px; margin-bottom: 5px;" runat="server" class="btn btn-outline-primary" OnClick="Button1_Click" Text="SEÇ" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />

                <div class="row">
                    <div class="col-sm-4" runat="server">
                        <div class="card mb-3" style="background-color: lightgray">
                            <div class="card-header">
                                <h3>Yeni Araç Kaydı</h3>
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
                                    <div id="divTable1" runat="server" class="table-responsive" style="overflow: visible;">
                                        <asp:Table ID="Table1" runat="server" CssClass="table table-borderless" Width="100%">


                                            <%--<asp:TableRow ID="TableRow12" runat="server">
                                    <asp:TableCell>Kayıtlı Araç</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                        </asp:DropDownList>&nbsp;&nbsp;
                                        <asp:Button ID="Button1" runat="server" class="btn btn-outline-primary" OnClick="Button1_Click" Text="Seçim" /></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow1" runat="server">
                                    <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow11" runat="server">
                                    <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow13" runat="server">
                                    <asp:TableCell></asp:TableCell>
                                </asp:TableRow>--%>
                                            <asp:TableRow ID="TableRow2" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="Plaka"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="TableRow4" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="True" Placeholder="Marka"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow3" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="True" Placeholder="Model"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow7" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="True" Placeholder="Müşteri"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <select id="Select1" name="testSelect" class="form-control" runat="server" onchange="DoPostBack(this);" onserverchange="DropDownList4_SelectedIndexChanged"></select>
                                                    <%--<asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged"></asp:DropDownList>--%>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow5" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ReadOnly="True" Placeholder="Model Yılı"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="DropDownList5" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged"></asp:DropDownList>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow8" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Placeholder="Ruhsat No"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow6" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Placeholder="Şase No"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow9" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Placeholder="Motor No"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow10" runat="server">
                                                <asp:TableCell>
                                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-outline-primary" OnClick="Button2_Click" Text="Yeni Araç Kaydı" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow11" runat="server">
                                                <asp:TableCell>
                                                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-outline-primary" Text="Yeni Servis Kaydı Oluştur" OnClick="Button4_Click" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="TableRowDeleteButton" runat="server">
                                                <asp:TableCell>
                                                    <asp:Button ID="ButtonDelete" runat="server" CssClass="btn btn-outline-danger" Text="Alanları Temizle" OnClick="ButtonDelete_Click" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                        </asp:Table>
                                        <%--<asp:Label ID="Label1" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <br />
                <br />
                <br />

                <div class="row">
                    <div class="col-sm-4" runat="server">
                        <div class="card mb-3" style="background-color: lightgray">
                            <div class="card-header">
                                <h3>Yeni Müşteri Girişi</h3>
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


                                        <asp:Table ID="Table2" runat="server" CssClass="table table-borderless" Width="100%">

                                            <asp:TableRow ID="TableRow14" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Placeholder="TC No"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>


                                            <asp:TableRow ID="TableRow15" runat="server">
                                                <asp:TableCell>
                                                    <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Placeholder="Ad Soyad"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow ID="TableRow16" runat="server">
                                                <asp:TableCell>
                                                    <asp:Button ID="Button3" runat="server" class="btn btn-outline-primary" OnClick="Button3_Click" Text="Müşteri Ekle" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>

                                        <br />
                                        <%--<asp:Label ID="Label2" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>--%>
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
