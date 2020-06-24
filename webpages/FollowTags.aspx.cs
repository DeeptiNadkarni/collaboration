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
    public partial class FollowTags : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //code to ask user to follow tags
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
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //store selected tags in database
            int count = 0;
            String url = "FollowTags.aspx?u=" + Request.QueryString["u"];
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected == true)
                    count++;
            }
            if (count != 5)
            {
                Response.Write("<script language='javascript'>alert('You have selected " + count + " tags, please select only 5 tags!');window.location.href='" + url + "';</script>");
            }
            else
            {
                SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected == true)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "insert into follow values(@userid, @tag)";
                        cmd.Parameters.AddWithValue("@userid", Request.QueryString["u"]);
                        cmd.Parameters.AddWithValue("@tag", CheckBoxList1.Items[i].Text);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                Response.Write("<script language='javascript'>alert('Tags added!');window.location.href='Login.aspx';</script>");
            }
        }
    }
}