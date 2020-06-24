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
    public partial class ChangeTags : System.Web.UI.Page
    {
        String[] temp = new string[5] { "", "", "", "", "" };
        protected void Page_Load(object sender, EventArgs e)
        {
            int i = 0;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            if (!Page.IsPostBack)
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from alltags", con);
                DataTable dtb = new DataTable();
                sqlDa.Fill(dtb);
                CheckBoxList1.DataTextField = "tag";
                CheckBoxList1.DataValueField = "tag";
                CheckBoxList1.DataSource = dtb;
                CheckBoxList1.DataBind();
                con.Close();
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select tag from follow where userid=@userid";
                cmd.Parameters.AddWithValue("@userid", Request.QueryString["u"]);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    temp[i] = dr["tag"].ToString();
                    i++;
                }
                i = 0;
                for (; i < 5; i++)
                {
                    if (i == 0)
                    {
                        Label1.Text += temp[i];
                    }
                    else
                    {
                        Label1.Text += ", " + temp[i];
                    }
                }
                dr.Close();
                con.Close();
                Label1.Text += ". Please check the ones that you want to follow now.";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String url;
            url = "ViewPosts.aspx?u=" + Request.QueryString["u"];
            Response.Redirect(url);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String url,url1;
            url = "ViewPosts.aspx?u=" + Request.QueryString["u"];
            url1="ChangeTags.aspx?u="+ Request.QueryString["u"];
            int count = 0;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from follow where userid=@userid";
            cmd.Parameters.AddWithValue("@userid", Request.QueryString["u"]);
            cmd.ExecuteNonQuery();
            con.Close();
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected == true)
                    count++;
            }
            if (count != 5)
            {
                Response.Write("<script language='javascript'>alert('You have selected " + count + " tags, please select only 5 tags!');window.location.href='" + url1 + "';</script>");
            }
            else
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected == true)
                    {
                        con.Open();
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.Connection = con;
                        cmd1.CommandType = CommandType.Text;
                        cmd1.CommandText = "insert into follow values(@userid, @tag)";
                        cmd1.Parameters.AddWithValue("@userid", Request.QueryString["u"]);
                        cmd1.Parameters.AddWithValue("@tag", CheckBoxList1.Items[i].Text);
                        cmd1.ExecuteNonQuery();
                        con.Close();
                    }
                }
                Response.Write("<script language='javascript'>alert('Tags added!');window.location.href='" + url + "';</script>");
            }

        }
    }
}