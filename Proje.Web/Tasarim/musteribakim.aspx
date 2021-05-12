<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="musteribakim.aspx.cs" Inherits="Proje.Web.Tasarim.musteribakim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont-table bg-c-blue"></i>
                                                    <div class="d-inline">
                                                        <h4>Müşteri Bakım Ekranı</h4>
                                                        <span>Bu sayfadan yeni müşteri ekleyebilir, sistemde kayıtlı müşterilerin bilgilerini düzenleyebilir ya da kayıt silebilirsiniz.</span>
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
                                                    <li class="breadcrumb-item"><a href="musteribakim.aspx">Müşteri Bakım Ekranı</a>
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
        <div class="row">
            <div class="col-sm-12">
                <div class="card mb-3" style="background-color: lightgray">
                    <div class="card-header">
                        <h3>Araç Listesi</h3>
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


                                <asp:UpdatePanel ID="UpdatePanelMusteri" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" OnPageIndexChanging="OnPaging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" ShowFooter="True" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Müşteri ID">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("musteriID") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox3" PlaceHolder="Müşteri ID" runat="server" CssClass="form-control" ReadOnly="True" Visible="False"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("musteriID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TC Kimlik No">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Eval("tckn") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox4" PlaceHolder="TC Kimlik NO" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("tckn") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ad Soyad">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Eval("adSoyad") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="TextBox5" PlaceHolder="Ad Soyad" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("adSoyad") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="İşlemler">
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButton3" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="update">Güncelle</asp:LinkButton>
                                                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-info" CommandName="cancel">Vazgeç</asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:LinkButton ID="LinkButton5" Style="padding: 3px 15px" runat="server" CssClass="btn btn-success" OnClick="LinkButton5_Click">Ekle</asp:LinkButton>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" Style="padding: 2px 5px" runat="server" CssClass="btn btn-outline-primary" CommandName="edit">Düzenle</asp:LinkButton>
                                                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" Style="padding: 2px 5px" CssClass="btn btn-outline-danger" OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');" CommandName="delete">Sil</asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <%--<asp:Label ID="LabelBilgi" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>--%>
                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddMusteri" SelectMethod="GetMusteris" TypeName="Proje.Business.dbmusteri2" DeleteMethod="silMusteri" UpdateMethod="guncelleMusteri">
                                            <DeleteParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="tc" Type="String" />
                                                <asp:Parameter Name="ad" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                                <asp:Parameter Name="tc" Type="String" />
                                                <asp:Parameter Name="ad" Type="String" />
                                            </UpdateParameters>
                                        </asp:ObjectDataSource>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
