<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="servisdurum.aspx.cs" Inherits="Proje.Web.Tasarim.servisdurum" %>
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
                                                        <h4>Servis Bilgi Ekranı</h4>
                                                        <span>Bu ekranda aldığınız servislerle ilgili tüm işlemleri görüntüleyebilirsiniz.</span>
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
                                                    <li class="breadcrumb-item"><a href="servisdurum.aspx">Servis Durum Ekranı</a>
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
        <asp:UpdatePanel ID="UpdatePanelServis" runat="server">
            <ContentTemplate>
                <div class="row" runat="server">
                    <div class="col-md-12">
                        <div class="table-responsive" style="overflow: visible;">






                            <asp:Label ID="Label1" CssClass="alert alert-primary" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:GridView ID="GridViewServisler" Width="100%"
                                CssClass="table table-bordered table-borderless table-hover"
                                runat="server" OnSelectedIndexChanged="GridViewServisler_SelectedIndexChanged" OnRowDataBound="GridViewServisler_RowDataBound">
                                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="<i class='btn-success ti-view-list'></i> Seç" />
                </Columns>

                            </asp:GridView>
                            <br />
                            <asp:Label ID="Label2" CssClass="alert alert-primary" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:GridView ID="GridViewServisKalemler" Width="100%" CssClass="table table-bordered table-borderless table-hover" runat="server" OnRowDataBound="GridViewServisKalemler_RowDataBound"></asp:GridView>
                            <br />


                            <asp:GridView ID="GridViewAktifServisler" Width="100%" CssClass="table table-bordered table-borderless table-hover" runat="server" OnSelectedIndexChanged="GridViewAktifServisler_SelectedIndexChanged" OnRowEditing="GridViewAktifServisler_RowEditing" OnRowDataBound="GridViewAktifServisler_RowDataBound">
                                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="<i class='btn-success ti-view-list'></i> SEÇ" />
                </Columns>
                    <Columns>
                    <asp:CommandField ShowEditButton="True" EditText="<i class='btn-success ti-shift-right'></i> Servis Kaydına Git" />
                </Columns>
                            </asp:GridView>
                            <br />
                            <br />
                            <asp:Label ID="Label3" CssClass="alert alert-primary" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:GridView ID="GridViewAktifKalemler" Width="100%" CssClass="table table-bordered table-borderless table-hover" runat="server" OnRowDataBound="GridViewAktifKalemler_RowDataBound"></asp:GridView>

                        </div>
                    </div>
                </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
