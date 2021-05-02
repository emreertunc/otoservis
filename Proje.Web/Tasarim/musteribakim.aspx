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
                                                        <a href="/default.aspx">
                                                            <i class="icofont icofont-home"></i>
                                                        </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Bootstrap Table</a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Basic Table</a>
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
            <div class="col-md-12">
                <div class="table-responsive" style="overflow: visible;">


                    <asp:UpdatePanel ID="UpdatePanelMusteri" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="table table-bordered table-hover table-active" AllowPaging="True" OnPageIndexChanging="OnPaging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" ShowFooter="True" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="musteri ID">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("musteriID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="True" Visible="False"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("musteriID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="tc">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Eval("tckn") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("tckn") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ad soyad">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Eval("adSoyad") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("adSoyad") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="işlemler">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-outline-primary" CommandName="update">Güncelle</asp:LinkButton>
                                            &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-outline-info" CommandName="cancel">Vazgeç</asp:LinkButton>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-success" OnClick="LinkButton5_Click">Ekle</asp:LinkButton>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-primary" CommandName="edit">Düzenle</asp:LinkButton>
                                            &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-outline-danger" CommandName="delete">Sil</asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="LabelBilgi" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>
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

</asp:Content>
