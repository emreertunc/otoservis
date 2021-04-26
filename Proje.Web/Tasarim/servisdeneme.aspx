<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servisdeneme.aspx.cs" Inherits="Proje.Web.Tasarim.servisdeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:800px">
            <div style="float:left">
                <asp:Table ID="Table1" runat="server"
            Font-Size="X-Large" 
            Width="300" 
            Font-Names="Palatino"
            BackColor="DarkOrange"
            BorderColor="DarkRed"
            BorderWidth="2"
            ForeColor="Snow"
            CellPadding="5"
            CellSpacing="5">


                <asp:TableRow 
                ID="TableRow12" 
                runat="server" 
                BackColor="OrangeRed"
                >
                <asp:TableCell>Kayıtlı Araç</asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow1" 
                runat="server" 
                BackColor="OrangeRed"
                >
                <asp:TableCell><asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList> <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Seçim" /></asp:TableCell>
            </asp:TableRow>
                <asp:TableRow 
                ID="TableRow11" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell>-</asp:TableCell>
            </asp:TableRow>
                <asp:TableRow 
                ID="TableRow2" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox1" runat="server">Plaka</asp:TextBox></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow4" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox2" runat="server" ReadOnly="True">Marka</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" style="height: 25px">
            </asp:DropDownList></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow3" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox3" runat="server" ReadOnly="True">Model</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            </asp:DropDownList></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow7" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox4" runat="server" ReadOnly="True">Müşteri</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
            </asp:DropDownList></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow5" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox5" runat="server" ReadOnly="True">Model Yılı</asp:TextBox></asp:TableCell>
                <asp:TableCell><asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
            </asp:DropDownList></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow8" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox6" runat="server">Ruhsat No</asp:TextBox></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow6" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox7" runat="server">Şase No</asp:TextBox></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow9" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox8" runat="server">Motor No</asp:TextBox></asp:TableCell>
            </asp:TableRow>

                <asp:TableRow 
                ID="TableRow10" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Yeni Kayıt" /></asp:TableCell>
            </asp:TableRow>

                <asp:TableFooterRow 
                runat="server" 
                BackColor="White"
                >
                <asp:TableCell 
                    ColumnSpan="3" 
                    HorizontalAlign="Right"
                    Font-Italic="true"
                    >
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </asp:TableCell>
            </asp:TableFooterRow>
                </asp:Table>
            </div>
            



            <div style="float:right; margin-top:200px">

            <asp:Table ID="Table2" runat="server"
            Font-Size="X-Large" 
            Width="300" 
            Font-Names="Palatino"
            BackColor="DarkOrange"
            BorderColor="DarkRed"
            BorderWidth="2"
            ForeColor="Snow"
            CellPadding="5"
            CellSpacing="5">


                <asp:TableRow 
                ID="TableRow14" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox9" runat="server">TC No</asp:TextBox></asp:TableCell>
            </asp:TableRow>


                <asp:TableRow 
                ID="TableRow15" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:TextBox ID="TextBox10" runat="server">Ad Soyad</asp:TextBox></asp:TableCell>
            </asp:TableRow>
                <asp:TableRow 
                ID="TableRow16" 
                runat="server" 
                BackColor="DarkOrange"
                >
                <asp:TableCell><asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Müşteri Ekle" /></asp:TableCell>
            </asp:TableRow>
                    <asp:TableFooterRow 
                runat="server" 
                BackColor="White"
                >
                <asp:TableCell 
                    ColumnSpan="3" 
                    HorizontalAlign="Right"
                    Font-Italic="true"
                    >
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </asp:TableCell>
            </asp:TableFooterRow>
            </asp:Table>

            </div>

        </div>
    </form>
</body>
</html>
