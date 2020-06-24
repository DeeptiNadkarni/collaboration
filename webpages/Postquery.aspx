<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Postquery.aspx.cs" Inherits="WebApplication1.WebForm1" EnableEventValidation="false"%>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Microsoft BEE</title>
    <script src="tinymce/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: 'textarea' , width:1500
        });
    </script>
    <link rel="stylesheet" href="css/StyleSheet1.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img src="css/beeweb.png" title="Microsoft BEE" alt="Microsoft BEE logo"/>
            <h1>Post your query</h1>
            <p>
                <asp:Button ID="Button2" runat="server" CssClass="button1" Text="Back" style="margin-left: 1650px;" OnClick="Button2_Click" />
            </p>
        </div>
        <br />
        <br />
        <br />
        <p>
            <asp:Label ID="Label1" runat="server" BorderStyle="None" CssClass="label" Text="Username:"></asp:Label>
            <asp:Label ID="Label3" runat="server" BorderStyle="None" CssClass="label" style="margin-left:20px;"></asp:Label>
        </p>
        <asp:Label ID="Label2" runat="server" BorderStyle="None" CssClass="label" Text="Message"></asp:Label>
    <p>
        <asp:TextBox ID="txtHTMLContext" runat="server" TextMode="MultiLine" />
    </p>
        <p>
            <asp:Button ID="Button3" runat="server" CssClass="button1" Text="Check Tags" style="margin-left: 1350px;" OnClick="Button3_Click" />
        </p>
        <p></p>
        <br />
        <br />
        <br />
        <div>
        <p>
            <asp:Label ID="Label4" runat="server" BorderStyle="None" Font-Size="X-Large" CssClass="label" Text="Suggested Tags:" ></asp:Label>
        </p>
        <p> 
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="chkboxlist" CellPadding="3" CellSpacing="5"></asp:CheckBoxList>
        </p>
        </div>
        <br />
        <br />
        <div>
        <p>
            <asp:Button ID="Button1" runat="server" Font-Size="X-Large" CssClass="button" Text="Post" OnClick="Button1_Click" />
        </p>
        </div>
    </form>
    </body>
</html>
