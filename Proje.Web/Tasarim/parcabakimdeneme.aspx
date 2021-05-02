<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parcabakimdeneme.aspx.cs" Inherits="Proje.Web.Tasarim.parcabakimdeneme" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_OnTextChanged"></asp:TextBox>

        <asp:AutoCompleteExtender ID="extTxtSearch" runat="server" MinimumPrefixLength="1" ServiceMethod="getParcaAd"
            ServicePath="~/WebServiceParca.asmx" TargetControlID="txtSearch">
        </asp:AutoCompleteExtender>
        <asp:Button ID="ButtonTemizle" runat="server" Text="Temizle" OnClick="ButtonTemizle_Click" />

        <asp:UpdatePanel ID="UpdatePanelParcaBakim" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridViewParcaAll" runat="server" ShowFooter="True" AutoGenerateColumns="False" OnRowDeleting="GridViewKullanici_RowDeleting" OnRowCancelingEdit="GridViewKullanici_RowCancelingEdit" OnRowEditing="GridViewKullanici_RowEditing" OnRowUpdating="GridViewKullanici_RowUpdating" AllowPaging="True" OnPageIndexChanging="GridViewParcaAll_PageIndexChanging">
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
                                <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("stok") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="İşlemler">
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
            </ContentTemplate>
            <%--<Triggers>
                <asp:AsyncPostBackTrigger ControlID="LinkButtonGuncelle" EventName="Update" />
                <asp:AsyncPostBackTrigger ControlID="LinkButtonVazgec" EventName="cancel" />
                <asp:AsyncPostBackTrigger ControlID="LinkButtonEkle" EventName="LinkButtonEkle_Click" />
                <asp:AsyncPostBackTrigger ControlID="LinkButtonDuzenle" EventName="edit" />
                <asp:AsyncPostBackTrigger ControlID="LinkButtonSil" EventName="delete" />
            </Triggers>--%>
        </asp:UpdatePanel>

    </form>
</body>
</html>
