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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "No-cache";
            TextBox1.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //on click of Login button, check if user exists in database
            String url;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from users where name=@name and password=@pwd";
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@pwd", TextBox2.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                url = "Viewposts.aspx?u=" + dr["userid"].ToString();
                Response.Write("<script language='javascript'>alert('Logged in!');window.location.href='"+url+"';</script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('User not found. Try again!');window.location.href='Login.aspx';</script>");
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Redirect to INformation page when clicked on about button
            Response.Redirect("Info.aspx");
        }
    }
}