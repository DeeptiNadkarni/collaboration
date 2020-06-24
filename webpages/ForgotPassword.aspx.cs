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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Visible = false;
            TextBox2.Visible = false;
            Label3.Visible = false;
            TextBox3.Visible = false;
            Button2.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Check if user exists in database, if yes ask for new password
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select password from users where email=@email";
            cmd.Parameters.AddWithValue("@email", TextBox1.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                con.Close();
                Label2.Visible = true;
                TextBox2.Visible = true;
                Label3.Visible = true;
                TextBox3.Visible = true;
                Button2.Visible = true;
            }
            else
            {
                con.Close();
                Response.Write("<script language='javascript'>alert('User not found. Sign Up first!');window.location.href='Signup.aspx';</script>");    
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Update new password in database
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update users set password=@password where email=@email";
            cmd.Parameters.AddWithValue("@email", TextBox1.Text);
            cmd.Parameters.AddWithValue("@password", TextBox2.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script language='javascript'>alert('Password Changed!');window.location.href='Login.aspx';</script>");
        }
    }
}