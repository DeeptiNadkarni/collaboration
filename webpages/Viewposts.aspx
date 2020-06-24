<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewposts.aspx.cs" Inherits="WebApplication1.WebForm2" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Microsoft BEE</title>
    <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <img src="css/beeweb.png" title="Microsoft BEE" alt="Microsoft BEE logo"/>
            <h1>
                View posts
            </h1>
            <p>
                <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-size="Large" style="margin-left: 40px;" CssClass="label" ></asp:Label>
            </p>
            <p>
                <asp:Button ID="Button1" runat="server" CssClass="button1" Text="View your posts" style="margin-left: 1050px;" OnClick="Button1_Click"/>
            </p>
            <p></p>
            <p></p>
            <p>
                <asp:Button ID="Button2" runat="server" CssClass="button1" Text="Post a query" style="margin-left:1250px;" OnClick="Button2_Click" />
            </p>
        </div>
        <div>
            <p></p>
            <p></p>
            <p>
                <asp:Button ID="Button3" runat="server" CssClass="button1" Text="Logout" style="margin-left:1650px;" OnClick="Button3_Click" />
            </p>
        </div>
        <div>
            <p></p>
            <p></p>
            <p>
                <asp:Button ID="Button4" runat="server" CssClass="button1" Text="Review Tags" title="Change Tags that you follow" style="margin-left:1450px;" OnClick="Button4_Click" />
            </p>
        </div>
        <div style="overflow-y:auto; overflow-x:hidden; height:1500px; width:1180px;">
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="271px" style="margin-left: 250px; margin-top: 28px" Width="752px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="message" HeaderText="Query" HtmlEncode="false" />
                        <asp:BoundField DataField="name" HeaderText="Posted by" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Height="55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </p>
        </div>
    </form>
</body>
</html>
