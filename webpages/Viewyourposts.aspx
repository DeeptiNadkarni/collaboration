<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewyourposts.aspx.cs" Inherits="WebApplication1.Viewyourposts" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Microsoft BEE</title>
    <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img src="css/beeweb.png" title="Microsoft BEE" alt="Microsoft BEE logo"/>
            <h1>View your posts</h1>
            <p>
                <asp:Button ID="Button1" runat="server" CssClass="button1" Text="Back" style="margin-left: 1650px;" OnClick="Button1_Click"/>
            </p>
            <p></p>
            <p></p>
        </div>
        <div id="div1" runat="server" style="overflow-y:auto; overflow-x:hidden; height:600px; width:1180px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="271px" style="margin-left: 450px; margin-top: 28px" Width="772px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDataBound="GridView2_RowDataBound" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="message" HeaderText="Query" HtmlEncode="false"/>
                        <asp:BoundField DataField="date" HeaderText="Posted On(UTC time)" />
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
        </div>
        <p></p>
        <p></p>
        <div>
            <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Size="X-Large" CssClass="label" Text="You haven't posted any queries yet!"></asp:Label>
        </div>
    </form>
</body>
</html>
