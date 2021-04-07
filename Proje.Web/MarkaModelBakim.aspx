<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarkaModelBakim.aspx.cs" Inherits="Proje.Web.MarkaModelBakim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Araç Marka ve Model Listesi Bakım Ekranı</title>
    <script type="text/javascript" src="/Tasarim/assets/js/emrescrollable/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="/Tasarim/assets/js/emrescrollable/ScrollableGridPlugin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=GridView1.ClientID %>').Scrollable();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=GridView2.ClientID %>').Scrollable();
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:350px; width:1000px">
            <div style="float:left;width:500px;margin-left:50px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Aracın Markası">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("marka") %>' ReadOnly="True"></asp:TextBox>
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
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("model") %>'></asp:TextBox>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("model") %>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="İşlemler">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="update">Güncelle</asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel">Vazgeç</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">Ekle</asp:LinkButton>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Düzenle</asp:LinkButton>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete">Sil</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMarkaModels" TypeName="Proje.DataAccess.dbarac"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="getMarkaListe" TypeName="Proje.DataAccess.dbarac"></asp:ObjectDataSource>
            </div>
            <div style="float:right; margin-right:50px; width:300px">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"  ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" OnRowDeleting="GridView2_RowDeleting" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Aracın Markası">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("marka") %>'></asp:TextBox>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("marka") %>' Visible="False"></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("marka") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="İşlemler">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton8" runat="server" CommandName="update">Güncelle</asp:LinkButton>
                                &nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton9" runat="server" CommandName="Cancel">Vazgeç</asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButton10" runat="server" OnClick="LinkButton10_Click">Ekle</asp:LinkButton>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Edit">Düzenle</asp:LinkButton>
                                &nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton7" runat="server" CommandName="Delete">Sil</asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:Label ID="Label9" runat="server"></asp:Label>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetMarkas" TypeName="Proje.DataAccess.dbarac"></asp:ObjectDataSource>
            </div>

        </div>
    </form>
</body>
</html>
