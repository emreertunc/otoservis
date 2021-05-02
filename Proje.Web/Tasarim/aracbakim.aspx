<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="aracbakim.aspx.cs" Inherits="Proje.Web.Tasarim.icon_themify2" %>
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
                                                        <h4>Araç Marka ve Model Bakım Ekranı</h4>
                                                        <span>Bu ekranda araçların marka ve modellerini düzenleyebilir, yenilerini ekleyebilir ve silebilirsiniz.</span>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="clearfix">
        <asp:UpdatePanel ID="UpdatePanelArac" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="table-responsive" style="overflow: visible;">
                                <h3>Araç Marka Bakımı</h3>

                                <br />

                                <asp:GridView ID="GridView2" runat="server" Width="100%" CssClass="table table-bordered table-hover table-active" AllowPaging="True" OnPageIndexChanging="OnPaging2" AutoGenerateColumns="False" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" OnRowDeleting="GridView2_RowDeleting" ShowFooter="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Aracın Markası">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Eval("marka") %>'></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("marka") %>' Visible="False"></asp:Label>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("marka") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="İşlemler">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton8" runat="server" CssClass="btn btn-outline-primary" CommandName="update">Güncelle</asp:LinkButton>
                                                &nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton9" runat="server" CssClass="btn btn-outline-info" CommandName="Cancel">Vazgeç</asp:LinkButton>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:LinkButton ID="LinkButton10" runat="server" CssClass="btn btn-success" OnClick="LinkButton10_Click">Ekle</asp:LinkButton>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="btn btn-outline-primary" CommandName="Edit">Düzenle</asp:LinkButton>
                                                &nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton7" runat="server" CssClass="btn btn-outline-danger" CommandName="Delete" OnClientClick="return confirm('Bu markayı silmek markaya ait modelleri de silecektir. Silme işlemine devam etmek istediğinizden emin misiniz?');">Sil</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:Label ID="LabelBilgi" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetMarkas" TypeName="Proje.Business.dbarac2"></asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>

                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-6">
                            <div class="table-responsive" style="overflow: visible;">
                                <h3>Araç Model Bakımı</h3>

                                <br />

                                <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="table table-bordered table-hover table-active" AllowPaging="True" OnPageIndexChanging="OnPaging" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Aracın Markası">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Eval("marka") %>' ReadOnly="True"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("marka") %>' Visible="False"></asp:Label>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource3">
                                                </asp:DropDownList>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("marka") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Aracın Modeli">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Eval("model") %>'></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("model") %>' Visible="False"></asp:Label>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="İşlemler">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-outline-primary" CommandName="update">Güncelle</asp:LinkButton>
                                                &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-outline-info" CommandName="Cancel">Vazgeç</asp:LinkButton>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-success" OnClick="LinkButton5_Click">Ekle</asp:LinkButton>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-primary" CommandName="Edit">Düzenle</asp:LinkButton>
                                                &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-outline-danger" CommandName="Delete">Sil</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:Label ID="LabelBilgi2" runat="server" CssClass="alert alert-warning" Text="..."></asp:Label>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMarkaModels" TypeName="Proje.Business.dbarac2"></asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="getMarkaListe" TypeName="Proje.Business.dbarac2"></asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <%-- <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>


    <script type="text/javascript" src="assets/js/emrescrollable/ScrollableGridPlugin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=GridView1.ClientID %>').Scrollable();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=GridView2.ClientID %>').Scrollable();
        });
    </script>--%>
</asp:Content>
