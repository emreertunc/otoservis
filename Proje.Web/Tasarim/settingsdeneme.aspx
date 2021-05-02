<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settingsdeneme.aspx.cs" Inherits="Proje.Web.Tasarim.settingsdeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Table ID="TableUser" runat="server">
            <asp:TableRow>
                <asp:TableCell><asp:Label ID="LabelAd" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell> <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="txtParola" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="txtTCKN" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="txtAdSoyad" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell><asp:TextBox ID="txtTelno" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    </form>
</body>
</html>
