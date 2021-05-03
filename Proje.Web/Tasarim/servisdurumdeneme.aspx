<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servisdurumdeneme.aspx.cs" Inherits="Proje.Web.Tasarim.servisdurumdeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            <asp:GridView ID="GridViewServisler" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewServisler_SelectedIndexChanged"></asp:GridView>
        

            <asp:GridView ID="GridViewServisKalemler" runat="server"></asp:GridView>

            <asp:GridView ID="GridViewAktifServisler" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewAktifServisler_SelectedIndexChanged"></asp:GridView>
            
            <asp:GridView ID="GridViewAktifKalemler" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
