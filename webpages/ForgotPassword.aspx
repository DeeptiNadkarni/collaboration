<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebApplication1.ForgotPassword" %>

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
            <h1>Change Password</h1>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="label" style="margin-left:800px" Font-Size="X-Large" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="margin-left:40px" Font-Size="X-Large" CssClass="textbox" autocomplete="off"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" style="margin-left:20px" runat="server" ControlToValidate="TextBox1" ErrorMessage="Email Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" style="margin-left:20px" runat="server" ControlToValidate="TextBox1" ErrorMessage="You must enter the valid email id " Font-Size="X-Large" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <p></p>
        <br />
        <div>
            <asp:Button ID="Button1" runat="server" CssClass="button" Font-Size="X-Large" Text="Next" OnClick="Button1_Click" />
        </div>
        <br />
        <br />
        <br />
        <br />
        <div>
            <asp:Label ID="Label2" runat="server" CssClass="label" style="margin-left:700px" Font-Size="X-Large" Text=" Enter new Password"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="margin-left:72px" Font-Size="X-Large" TextMode="Password" CssClass="textbox"></asp:TextBox>
        </div>
        <p></p>
        <div>
            <asp:Label ID="Label3" runat="server" CssClass="label" style="margin-left:700px" Font-Size="X-Large" Text="Confirm New Password"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" style="margin-left:38px" Font-Size="X-Large" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" style="margin-left:20px" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="Passwords don't match" Font-Size="X-Large" ForeColor="Red"></asp:CompareValidator>
        </div>
        <br />
        <br />
        <div>
            <asp:Button ID="Button2" runat="server" CssClass="button" Font-Size="X-Large" Text="Change" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
