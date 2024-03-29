﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="parcabakim.aspx.cs" Inherits="Proje.Web.Tasarim.parcabakim" %>
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
                                                        <h4>Parça Bakım Ekranı</h4>
                                                        <span>Bu ekranda depodaki parçaların bilgilerini düzenleyebilir, yenilerini ekleyebilir ve kayıtları silebilirsiniz.</span>
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
                                                    <li class="breadcrumb-item"><a href="parcabakim.aspx">Parça Bakım Ekranı</a>
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
        <asp:UpdatePanel ID="UpdatePanelParcaBakim" runat="server">
            <ContentTemplate>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="card mb-3" style="background-color: lightgray">
                            <div class="card-header">
                                <h3>Parça Bakımı</h3>
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

                                    <div class="table-responsive">
                                        <asp:GridView ID="GridViewParcaAll" Width="100%" CssClass="table table-striped table-bordered table-hover" runat="server" ShowFooter="True" AutoGenerateColumns="False" OnRowDeleting="GridViewKullanici_RowDeleting" OnRowCancelingEdit="GridViewKullanici_RowCancelingEdit" OnRowEditing="GridViewKullanici_RowEditing" OnRowUpdating="GridViewKullanici_RowUpdating" AllowPaging="True" OnPageIndexChanging="GridViewParcaAll_PageIndexChanging">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Parça ID">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("parcaID") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="True" Visible="False"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("parcaID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Parça Kodu">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Eval("parcaKodu") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("parcaKodu") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Parça Adı">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Eval("parcaAdi") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("parcaAdi") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Alış Fiyatı">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" PlaceHolder="XX,YY gibi virgül ile girin" Text='<%# Eval("fiyatAlis") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" PlaceHolder="XX,YY gibi virgül ile girin" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("fiyatAlis") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Satış Fiyatı">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox8" runat="server" PlaceHolder="XX,YY gibi virgül ile girin" CssClass="form-control" Text='<%# Eval("fiyatSatis") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox9" runat="server" PlaceHolder="XX,YY gibi virgül ile girin" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("fiyatSatis") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Stok Adedi">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Text='<%# Eval("stok") %>' TextMode="Number"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox11" runat="server" PlaceHolder="Stok Adedi" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("stok") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="İşlemler">
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButtonGuncelle" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="update" OnClick="LinkButtonGuncelle_Click">Güncelle</asp:LinkButton>
                                                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonVazgec" runat="server" Style="padding: 2px 5px" CssClass="btn btn-outline-info" CommandName="cancel" OnClick="LinkButtonVazgec_Click">Vazgeç</asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:LinkButton ID="LinkButtonEkle" Style="padding: 3px 15px" runat="server" CssClass="btn btn-success" OnClick="LinkButtonEkle_Click">Ekle</asp:LinkButton>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButtonDuzenle" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="edit" OnClick="LinkButtonDuzenle_Click">Düzenle</asp:LinkButton>
                                                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButtonSil" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-danger" CommandName="delete" OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');" OnClick="LinkButtonVazgec_Click1">Sil</asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- <asp:Label ID="Label11" runat="server"></asp:Label>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
