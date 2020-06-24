using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace WebApplication1
{
    public partial class Viewyourposts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //fetch currently logged in user's posts
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select message,date from post where userid="+Request.QueryString["u"], con);
            DataTable dtb = new DataTable();
            sqlDa.Fill(dtb);
            if (dtb.Rows.Count > 0)
            {
                GridView1.DataSource = dtb;
                GridView1.DataBind();
                Label1.Visible = false;
            }
            else
            {
                div1.Visible = false;
                Label1.Visible = true;
            }
            con.Close();
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //make a row of a gridview clickable
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select";
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //fetch data from selected row(selected post)
            String url;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select postid from post where message='" + GridView1.SelectedRow.Cells[0].Text + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            url = "Viewanswerstoyourposts.aspx?p=" + dr["postid"].ToString() + "&u=" + Request.QueryString["u"];
            con.Close();
            Response.Redirect(url);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String url;
            url = "Viewposts.aspx?u=" + Request.QueryString["u"];
            Response.Redirect(url);
        }
    }
}