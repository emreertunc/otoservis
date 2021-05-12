<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="kullaniciyonetim.aspx.cs" Inherits="Proje.Web.Tasarim.kullaniciyonetim" %>
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
                                                        <h4>Kullanıcı Bakım Ekranı</h4>
                                                        <span>Bu ekranda kullanıcı kayıtlarını düzenleyebilir, yenilerini ekleyebilir ve silebilirsiniz.</span>
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
                                                    <li class="breadcrumb-item"><a href="kullaniciyonetim.aspx">Kullanıcı Bakım Ekranı</a>
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
        <asp:UpdatePanel ID="UpdatePanelMusteri" runat="server">
            <ContentTemplate>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card mb-3" style="background-color: lightgray">
                            <div class="card-header">
                                <h3>Kullanıcı Listesi</h3>
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
                                        <asp:GridView ID="GridViewKullanici" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" OnPageIndexChanging="OnPaging" ShowFooter="True" AutoGenerateColumns="False" OnRowDeleting="GridViewKullanici_RowDeleting" OnRowCancelingEdit="GridViewKullanici_RowCancelingEdit" OnRowEditing="GridViewKullanici_RowEditing" OnRowUpdating="GridViewKullanici_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Kullanıcı ID">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("kullaniciID") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="True" Visible="False"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("kullaniciID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Kullanıcı Adı">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Eval("kullaniciAdi") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox3" PlaceHolder="Kullanıcı Adı" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("kullaniciAdi") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Parola">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Eval("parola") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox5" PlaceHolder="Parola" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("parola") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="TC Kimlik No">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Text='<%# Eval("tckn") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox7" PlaceHolder="TC Kimlik No" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("tckn") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Ad Soyad">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Text='<%# Eval("adSoyad") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox9" PlaceHolder="Ad Soyad" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("adSoyad") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="İşe Giriş Tarihi">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Text='<%# Eval("iseGirisTarihi") %>' TextMode="Date"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("iseGirisTarihi") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Bölüm ID">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("bolumID") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox13" PlaceHolder="Bölüm ID" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("bolumID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Bölüm Adı">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBoxBolum" ReadOnly="true" runat="server" CssClass="form-control" Text='<%# Eval("bolum") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBoxBolum2" ReadOnly="true" PlaceHolder="Boş bırak" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelBolum" runat="server" Text='<%# Eval("bolum") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Pozisyon ID">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("pozisyonID") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox15" PlaceHolder="Pozisyon ID" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("pozisyonID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Pozisyon Adı">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBoxPoz" ReadOnly="true" runat="server" CssClass="form-control" Text='<%# Eval("pozisyon") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBoxPoz" ReadOnly="true" PlaceHolder="Boş bırak" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelPoz" runat="server" Text='<%# Eval("pozisyon") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Telefon Numarası">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control" Text='<%# Eval("telno") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox17" PlaceHolder="Telefon Numarası" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("telno") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="işlemler">
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButtonGuncelle" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="update" OnClick="LinkButtonGuncelle_Click">Güncelle</asp:LinkButton>
                                                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonVazgec" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-info" CommandName="cancel" OnClick="LinkButtonVazgec_Click">Vazgeç</asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:LinkButton ID="LinkButtonEkle" Style="padding: 3px 15px" runat="server" CssClass="btn btn-success" OnClick="LinkButtonEkle_Click">Ekle</asp:LinkButton>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButtonDuzenle" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="edit" OnClick="LinkButtonDuzenle_Click">Düzenle</asp:LinkButton>
                                                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonSil" runat="server" Style="padding: 2px 5px" CssClass="btn btn-outline-danger" CommandName="delete" OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');" OnClick="LinkButtonVazgec_Click1">Sil</asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:Label ID="Label11" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                </div>
                            <br />
                <br />
                <div class="row">
                    <div class="col-sm-4">
                        <div class="card mb-3" style="background-color: lightgray">
                            <div class="card-header">
                                <h3>Bölüm ve Pozisyon ID Tablosu</h3>
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
                                        <asp:Table ID="TableID" runat="server" Width="100%" CssClass="table table-borderless">
                                            <asp:TableRow ID="TableRow1" runat="server">
                                                <asp:TableCell>
                                                    <asp:GridView ID="GridViewBolumID" runat="server"></asp:GridView>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:GridView ID="GridViewPozisyonID" runat="server"></asp:GridView>
                                                </asp:TableCell>
                                            </asp:TableRow>

                                        </asp:Table>




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
