using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //fetch posts with tags that the user follows
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select message,name from post where postid in(select postid from tags where tag in(select tag from follow where userid="+Request.QueryString["u"]+"))", con);
            DataTable dtb = new DataTable();
            sqlDa.Fill(dtb);
            if(dtb.Rows.Count==0)
            {
                con.Close();
                Label1.Text = "There are no posts with tags that you follow as of now.We will update once we have the posts. Meanwhile below are some posts that might interest you!";
                con.Open();
                SqlDataAdapter sqlDa1 = new SqlDataAdapter("select message,name from post", con);
                DataTable dtb1 = new DataTable();
                sqlDa1.Fill(dtb1);
                GridView1.DataSource = dtb1;
                GridView1.DataBind();
                con.Close();
            }
            else
            {
                Label1.Text = "Here are the posts with tags that you follow!";
                GridView1.DataSource = dtb;
                GridView1.DataBind();
                con.Close();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //make the row of a gridview clickable
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //fetch data from selected row(selected post)
            String url;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select postid from post where name='" + GridView1.SelectedRow.Cells[1].Text + "' and message='" + GridView1.SelectedRow.Cells[0].Text+"'";
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            url = "Answerquery.aspx?p=" + dr["postid"].ToString()+"&u="+Request.QueryString["u"];
            con.Close();
            Response.Redirect(url);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Redirect to page that display's logged in user's posts
            String url;
            url="Viewyourposts.aspx?u="+ Request.QueryString["u"];
            Response.Redirect(url);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Redirect to page where user can post query
            String url;
            url = "Postquery.aspx?u=" + Request.QueryString["u"];
            Response.Redirect(url);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Redirect to Login page
            Response.Redirect("Login.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String url;
            url = "ChangeTags.aspx?u="+Request.QueryString["u"];
            Response.Redirect(url);
        }
    }
}