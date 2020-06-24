<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FollowTags.aspx.cs" Inherits="WebApplication1.FollowTags" EnableEventValidation="false"%>

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
            <h1>Follow Tags</h1>
        </div>
        <p></p>
        <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Size="X-Large" CssClass="label" Text="Follow 5 tags:"></asp:Label>
        <div id="div1" runat="server" style="overflow-y:auto; overflow-x:hidden; height:650px;">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="chkboxlist" style="margin-left:150px" CellPadding="3" CellSpacing="15">
            </asp:CheckBoxList>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" Font-Size="X-Large" CssClass="button" Text="Done!" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
