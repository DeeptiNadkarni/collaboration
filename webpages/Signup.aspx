<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication1.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Microsoft BEE</title>
    <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body style ="background: url(https://i.ytimg.com/vi/RH26Ncrvwsw/maxresdefault.jpg); background-size:cover">
    <form id="form1" runat="server">
        <div>
            <img src="css/beeweb.png" title="Microsoft BEE" alt="Microsoft BEE logo"/>
            <h1>Sign Up</h1>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="label" style="margin-left:600px" Font-Size="X-Large" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="margin-left:197px" Font-Size="X-Large" CssClass="textbox" autocomplete="off"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" style="margin-left:20px" runat="server" ControlToValidate="TextBox1" ErrorMessage="Username Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <p></p>
        <div>
            <asp:Label ID="Label2" runat="server" CssClass="label" style="margin-left:600px" Font-Size="X-Large" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="margin-left:245px" Font-Size="X-Large" CssClass="textbox" autocomplete="off"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" style="margin-left:20px" runat="server" ControlToValidate="TextBox2" ErrorMessage="Email Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" style="margin-left:20px" runat="server" ControlToValidate="TextBox2" ErrorMessage="You must enter the valid email id " Font-Size="X-Large" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <p></p>
        <div>
            <asp:Label ID="Label3" runat="server" CssClass="label" style="margin-left:700px" Font-Size="X-Large" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" style="margin-left:208px" Font-Size="X-Large" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" style="margin-left:20px" runat="server" ControlToValidate="TextBox3" ErrorMessage="Password Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <p></p>
        <div>
            <asp:Label ID="Label4" runat="server" CssClass="label" style="margin-left:700px" Font-Size="X-Large" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" style="margin-left:115px" Font-Size="X-Large" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" style="margin-left:20px" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" style="margin-left:20px" ControlToCompare="TextBox3" ControlToValidate="TextBox4" ErrorMessage="Passwords not same" Font-Size="X-Large" ForeColor="Red"></asp:CompareValidator>
        </div>
        <p></p>
        <div>
            <asp:Label ID="Label5" runat="server" CssClass="label" style="margin-left:700px" Font-Size="X-Large" Text="Country where you work"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" style="margin-left:50px" Font-Size="X-Large" CssClass="textbox" autocomplete="off"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" style="margin-left:20px" runat="server" ControlToValidate="TextBox5" ErrorMessage="Country Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <p></p>
        <p></p>
        <p></p>
        <p></p>
        <div>
            <asp:Button ID="Button1" runat="server" CssClass="button1" style="margin-left:900px" Font-Size="X-Large" Text="Sign Up" OnClick="Button1_Click"/>
        </div>
    </form>
</body>
</html>
