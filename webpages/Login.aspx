<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Microsoft BEE</title>
    <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body style ="background: url(https://i.ytimg.com/vi/RH26Ncrvwsw/maxresdefault.jpg); background-size:cover">
    <form id="form1" runat="server">
        <div>
            <img src="css/beeweb1.png" title="Microsoft BEE" alt="Microsoft BEE logo"/>
            <h1>Login</h1>
            <p>
                <asp:Button ID="Button2" runat="server" CssClass="button1" style="margin-left:1550px" Text="About" CausesValidation="false" OnClick="Button2_Click"/>
            </p>
        </div>
        <p></p>
        <p></p>
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="label" style="margin-left:620px" Font-Size="X-Large" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="margin-left:50px" Font-Size="X-Large" CssClass="textbox" autocomplete="off"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" style="margin-left:20px" runat="server" ControlToValidate="TextBox1" ErrorMessage="Username Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <p></p>
        <div>
            <asp:Label ID="Label2" runat="server" CssClass="label" style="margin-left:620px" Font-Size="X-Large" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="margin-left:57px" Font-Size="X-Large" TextMode="Password" CssClass="textbox"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" style="margin-left:20px" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password Required" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <p></p>
        <div>
            <asp:Button ID="Button1" runat="server" CssClass="button" Font-Size="X-Large" Text="Login" OnClick="Button1_Click"/>
        </div>
        <div style="height: 39px; margin-top: 100px">
        <a class="link" href="Signup.aspx">New User? Click here</a>
        </div>
        <div style="height: 39px; margin-left:-25px ; margin-top: 10px">
        <a class="link" href="Forgotpassword.aspx">Forgot Password? Click here</a>
        </div>
    </form>
    </body>
</html>
