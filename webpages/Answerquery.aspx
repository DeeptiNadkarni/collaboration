<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Answerquery.aspx.cs" Inherits="WebApplication1.WebForm3" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Microsoft BEE</title>
    <script src="tinymce/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: 'textarea' , width:1500
        });
    </script>
    <link rel="stylesheet" href="css/StyleSheet1.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img src="css/beeweb.png" title="Microsoft BEE" alt="Microsoft BEE logo"/>
            <h1>
                View query
            </h1>
            <p>
                <asp:Button ID="Button2" runat="server" CssClass="button1" Text="Back" style="margin-left: 1550px;" OnClick="Button2_Click" />
            </p>
        </div>
        <br />
        <br />
        <br />
        <p>
            <asp:Label ID="Label1" runat="server" BorderStyle="None" CssClass="label" Text="Posted by"></asp:Label>
            <asp:Label ID="Label2" runat="server" BorderStyle="None" CssClass="label" style="margin-left: 100px"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" BorderStyle="None" CssClass="label" Text="Query"></asp:Label>
            <asp:Label ID="Label6" runat="server" BorderStyle="None" CssClass="label" ></asp:Label>
        </p>
            <asp:Label ID="Label4" runat="server" Font-size="Large" BorderStyle="None" CssClass="label"></asp:Label>
        <div id="div1" runat="server" style="overflow-y:auto; overflow-x:hidden; height:250px; width:1180px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="271px" style="margin-left: 370px; margin-top: 28px" Width="752px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="message" HeaderText="Answer" HtmlEncode="false"/>
                        <asp:BoundField DataField="name" HeaderText="Posted by" />
                        <asp:BoundField DataField="date" HeaderText="Posted on" />
                        <asp:TemplateField HeaderText="Upvote">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgb1" runat="server" ImageUrl="css/upvote.jpg" AlternateText="" ToolTip="Click to Upvote" CommandName="like" OnClick="Row_Selected"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Downvote">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgb2" runat="server" ImageUrl="css/downvote.png" AlternateText="" ToolTip="Click to Downvote" CommandName="dislike" OnClick="Row_Selected"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="upvotes" HeaderText="Number of Upvotes" />
                        <asp:BoundField DataField="downvotes" HeaderText="Number of Downvotes" />
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
            </div>
        <p></p>
        <asp:Label ID="Label8" runat="server" BorderStyle="None" CssClass="label" Text="No answers to this post yet!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" BorderStyle="None" CssClass="label" Text="Answer the query"></asp:Label>
            <p>
            <asp:Label ID="Label7" runat="server" BorderStyle="None" CssClass="label" Text="Name"></asp:Label>
            <asp:Label ID="Label9" runat="server" BorderStyle="None" style="margin-left:20px" CssClass="label" ></asp:Label>
            </p>
        <p>
            <asp:TextBox ID="txtHTMLContext" runat="server" TextMode="MultiLine" />
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Font-Size="X-Large" CssClass="button" Text="Post" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
