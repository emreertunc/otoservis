<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aracbakimdeneme.aspx.cs" Inherits="Proje.Web.Tasarim.aracbakimdeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="overflow-y: scroll; float:left;">
        <asp:GridView ID="GridViewAracBilgi" runat="server" Width="100%" CssClass="table table-bordered table-hover table-active" AllowPaging="True" OnPageIndexChanging="OnPaging" ShowFooter="True" AutoGenerateColumns="False" OnRowDeleting="GridViewKullanici_RowDeleting" OnRowCancelingEdit="GridViewKullanici_RowCancelingEdit" OnRowEditing="GridViewKullanici_RowEditing" OnRowUpdating="GridViewKullanici_RowUpdating" >
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

                <asp:TemplateField HeaderText="Model Yılı">
                    <EditItemTemplate>
                        <%--<asp:DropDownList ID="DropDownListYil2" CssClass="form-control" Text='<%# Eval("modelYil") %>' runat="server"></asp:DropDownList>--%>
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Text='<%# Eval("modelYil") %>' TextMode="Number"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <%--<asp:DropDownList ID="DropDownListYil" CssClass="form-control" runat="server"></asp:DropDownList>--%>
                        <asp:TextBox ID="TextBox11" runat="server" PlaceHolder="Model Yılı" CssClass="form-control" TextMode="Number" ></asp:TextBox>
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
            </div>
    </form>
</body>
</html>
