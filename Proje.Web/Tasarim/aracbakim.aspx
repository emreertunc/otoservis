<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="aracbakim.aspx.cs" Inherits="Proje.Web.Tasarim.aracbakim" %>
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
                                                        <h4>Araç Bakım Ekranı</h4>
                                                        <span>Bu ekranda araç kayıtlarını düzenleyebilir, yenilerini ekleyebilir ve silebilirsiniz.</span>
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
                                                    <li class="breadcrumb-item"><a href="aracbakim.aspx">Araç Bakım Ekranı</a>
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

                            <asp:GridView ID="GridViewAracBilgi" runat="server" Width="100%" CssClass="table table-bordered table-hover table-active" AllowPaging="True" OnPageIndexChanging="OnPaging" ShowFooter="True" AutoGenerateColumns="False" OnRowDeleting="GridViewKullanici_RowDeleting" OnRowCancelingEdit="GridViewKullanici_RowCancelingEdit" OnRowEditing="GridViewKullanici_RowEditing" OnRowUpdating="GridViewKullanici_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="Araç ID">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("aracID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="True" Visible="False"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("aracID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Plaka">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Eval("plaka") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox3" PlaceHolder="Plaka" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("plaka") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Marka ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Eval("markaID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox5" PlaceHolder="Marka ID" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("markaID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Marka Adı">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxMarkaAd" ReadOnly="true" runat="server" CssClass="form-control" Text='<%# Eval("marka") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBoxMarkaAd2" ReadOnly="true" PlaceHolder="Boş Bırak" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelMarkaAd" runat="server" Text='<%# Eval("marka") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Model ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Text='<%# Eval("modelID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox7" PlaceHolder="Model ID" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("modelID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Model Adı">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxModelAd" ReadOnly="true" runat="server" CssClass="form-control" Text='<%# Eval("model") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBoxModelAd2" ReadOnly="true" PlaceHolder="Boş Bırak" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelModelAd" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Musteri ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Text='<%# Eval("musteriID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox9" PlaceHolder="Musteri ID" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("musteriID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Müşteri Adı">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxMusteriAd" ReadOnly="true" runat="server" CssClass="form-control" Text='<%# Eval("adSoyad") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBoxMusteriAd2" ReadOnly="true" PlaceHolder="Boş Bırak" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelMusteriAd" runat="server" Text='<%# Eval("adSoyad") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Model Yılı">
                                        <EditItemTemplate>
                                            <%--<asp:DropDownList ID="DropDownListYil2" CssClass="form-control" Text='<%# Eval("modelYil") %>' runat="server"></asp:DropDownList>--%>
                                            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Text='<%# Eval("modelYil") %>' TextMode="Number"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <%--<asp:DropDownList ID="DropDownListYil" CssClass="form-control" runat="server"></asp:DropDownList>--%>
                                            <asp:TextBox ID="TextBox11" runat="server" PlaceHolder="Model Yılı" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("modelYil") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Ruhsat No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Text='<%# Eval("ruhsatNo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox13" PlaceHolder="Ruhsat No" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ruhsatNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Şase No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control" Text='<%# Eval("saseNo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox15" PlaceHolder="Şase No" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("saseNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Motor No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control" Text='<%# Eval("motorNo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox17" PlaceHolder="Motor No" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("motorNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="İşlemler">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButtonGuncelle" style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="update" OnClick="LinkButtonGuncelle_Click">Güncelle</asp:LinkButton>
                                            &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonVazgec" runat="server" style="padding: 2px 5px" CssClass="btn btn-outline-info" CommandName="cancel" OnClick="LinkButtonVazgec_Click">Vazgeç</asp:LinkButton>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="LinkButtonEkle" Style="padding: 3px 15px" runat="server" CssClass="btn btn-success" OnClick="LinkButtonEkle_Click">Ekle</asp:LinkButton>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonDuzenle" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="edit" OnClick="LinkButtonDuzenle_Click">Düzenle</asp:LinkButton>
                                            &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonSil" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-danger" CommandName="delete" OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');"  OnClick="LinkButtonVazgec_Click1">Sil</asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>


                        </div>
                    </div>
                </div>

                <br />
                <br />

                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive" style="overflow: visible;">
                            <asp:Table runat="server">
                                <asp:TableHeaderRow>
                                    <asp:TableCell>
                                        <h4>Marka ve Model ID Tablosu</h4>
                                    </asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell>
                                        <h4>Müşteri ID Tablosu</h4>
                                    </asp:TableCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:GridView ID="GridViewIDList" runat="server" Width="100%" CssClass="table table-hover table-active" AllowPaging="True" OnPageIndexChanging="GridViewIDList_PageIndexChanging"></asp:GridView>
                                    </asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:GridView ID="GridViewMusteriID" runat="server" Width="100%" CssClass="table table-hover table-active" AllowPaging="True" OnPageIndexChanging="GridViewMusteriID_PageIndexChanging"></asp:GridView>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>




                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
