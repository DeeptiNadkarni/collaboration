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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "No-cache";
            TextBox1.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Store user information in database on click of Sign Up button
            String url;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into users values(@name, @pwd, @email, @country)";
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@pwd", TextBox3.Text);
            cmd.Parameters.AddWithValue("@email", TextBox2.Text);
            cmd.Parameters.AddWithValue("@country", TextBox5.Text);
            cmd.ExecuteNonQuery();
            con.Close();

            //pass the userid to next page
            con.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select userid from users where name=@name and email=@email";
            cmd1.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@email", TextBox2.Text);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                url = "FollowTags.aspx?u=" + dr["userid"].ToString();
                Response.Write("<script language='javascript'>alert('Account created!');window.location.href='" + url + "';</script>");
            }
            con.Close();
        }
    }
}