<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signindeneme.aspx.cs" Inherits="Proje.Web.Tasarim.signindeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
        <div>
            <asp:TextBox ID="txt_Password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" Text="login" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
