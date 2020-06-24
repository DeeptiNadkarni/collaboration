<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewanswerstoyourposts.aspx.cs" Inherits="WebApplication1.Viewanswerstoyourposts" EnableEventValidation="false"%>

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
            <h1>
                View answers to your posts
            </h1>
        </div>
        <br />
        <br />
        <br />
        <p>
            <asp:Label ID="Label1" runat="server" BorderStyle="None" CssClass="label" Text="Query"></asp:Label>
        </p>
            <asp:Label ID="Label2" runat="server" BorderStyle="None" CssClass="label" ></asp:Label>
            <asp:Label ID="Label3" runat="server" BorderStyle="None" CssClass="label"></asp:Label>
        <div id="div1" runat="server" style="overflow-y:auto; overflow-x:hidden; height:500px; width:1180px;">
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
        <asp:Label ID="Label4" runat="server" BorderStyle="None" CssClass="label" Text="No answers to this post yet!"></asp:Label>
            <br />
        <p>
            <asp:Button ID="Button1" runat="server" Font-Size="X-Large" CssClass="button" Text="Back" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
