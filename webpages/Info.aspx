<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="WebApplication1.Info" %>

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
            <h1>Microsoft BEE</h1>
        </div>
        <br />
        <br />
        <br />
        <div>
            <h2>
                Microsoft BEE is Q&A forum for Microsft CSS employees.
                The forum aims to improve collaboration among CSS employees.
            </h2>
            <p></p>
            <h3>
                -Ask questions when you need help!
            </h3>
            <h3>
                -Answer questions to help fellow CSS employees
            </h3>
            <h3>
                -Follow tags and get notified when a new post with the tag is posted
            </h3>
            <p></p>
            <h3>
                Why wait? Signup/Login now!!
            </h3>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" CssClass="button" Font-Size="X-Large" Text="Back" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
