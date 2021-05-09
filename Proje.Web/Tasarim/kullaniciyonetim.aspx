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
            <div class="col-md-12">
                <div class="table-responsive" style="overflow: visible;">
        <asp:GridView ID="GridViewKullanici" runat="server" Width="100%" CssClass="table table-bordered table-hover table-active" AllowPaging="True" OnPageIndexChanging="OnPaging" ShowFooter="True" AutoGenerateColumns="False" OnRowDeleting="GridViewKullanici_RowDeleting" OnRowCancelingEdit="GridViewKullanici_RowCancelingEdit" OnRowEditing="GridViewKullanici_RowEditing" OnRowUpdating="GridViewKullanici_RowUpdating" >
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
                        <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Text='<%# Eval("bolumID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox13" PlaceHolder="Bölüm ID" runat="server" CssClass="form-control"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("bolumID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Pozisyon ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control" Text='<%# Eval("pozisyonID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox15" PlaceHolder="Pozisyon ID" runat="server" CssClass="form-control"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("pozisyonID") %>'></asp:Label>
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
                        <asp:LinkButton ID="LinkButtonGuncelle" runat="server" CssClass="btn btn-outline-primary" CommandName="update" OnClick="LinkButtonGuncelle_Click">Güncelle</asp:LinkButton>
                                &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonVazgec" runat="server" CssClass="btn btn-outline-info" CommandName="cancel" OnClick="LinkButtonVazgec_Click">Vazgeç</asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButtonEkle" runat="server" CssClass="btn btn-success" OnClick="LinkButtonEkle_Click">Ekle</asp:LinkButton>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDuzenle" runat="server" CssClass="btn btn-outline-primary" CommandName="edit" OnClick="LinkButtonDuzenle_Click">Düzenle</asp:LinkButton>
                                &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonSil" runat="server" CssClass="btn btn-outline-danger" CommandName="delete" OnClick="LinkButtonVazgec_Click1">Sil</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label11" runat="server"></asp:Label>
            </div>
            </div>
          </div>
                            <br/>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="table-responsive" style="overflow: visible;">
                                <asp:Table ID="TableID" runat="server" Width="100%" CssClass="table table-borderless">
                                    <asp:TableRow ID="TableRow2" runat="server">
                                        <asp:TableCell><h4>Bölüm / Pozisyon ID</h4></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow1" runat="server">
                                        <asp:TableCell><asp:GridView ID="GridViewBolumID" runat="server"></asp:GridView></asp:TableCell>
                                        <asp:TableCell><asp:GridView ID="GridViewPozisyonID" runat="server"></asp:GridView></asp:TableCell>
                                    </asp:TableRow>

                                    </asp:Table>

                                            

                                            

                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
