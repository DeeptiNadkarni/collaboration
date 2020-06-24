using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Azure;
using System.Globalization;
using Azure.AI.TextAnalytics;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //Azure text analytics service details
        private static readonly AzureKeyCredential credentials = new AzureKeyCredential("8f520976b7da443a89886ddd42510002");
        private static readonly Uri endpoint = new Uri("https://analytic1.cognitiveservices.azure.com/");
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Visible = false;
            Button1.Visible = false;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select name from users where userid=" + Request.QueryString["u"];
            SqlDataReader dr = cmd1.ExecuteReader();
            if(dr.Read())
            {
                Label3.Text = dr["name"].ToString();
            }
            dr.Close();
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Redirect to previous page(feed page)
            String url;
            url = "Viewposts.aspx?u=" + Request.QueryString["u"];
            Response.Redirect(url);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //USe the Azure text analytic service to parse message entered by user and extract key phrases from it and suggest them as tags
            Label4.Visible = true;
            Button1.Visible = true;
            dt = new DataTable();
            DataColumn dc = new DataColumn("Suggested Tags");
            dt.Columns.Add(dc);
            DataRow dr1;
            CheckBoxList1.DataTextField = "Suggested Tags";
            if (txtHTMLContext.Text!="")
            {
                var client = new TextAnalyticsClient(endpoint, credentials);
                var response = client.ExtractKeyPhrases(txtHTMLContext.Text);
                
                foreach (string keyphrase in response.Value)
                {
                    dr1 = dt.NewRow();
                    dr1[0] = keyphrase;
                    dt.Rows.Add(dr1);
                    CheckBoxList1.DataSource = dt;
                    CheckBoxList1.DataBind();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Store post and it's tags in database
            String a;
            String url;
            SqlConnection con = new SqlConnection("server=QUIDDITCH;database=forum;integrated security=true;");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into post values(@userid,@name, @message, @date)";
            cmd.Parameters.AddWithValue("@userid", Request.QueryString["u"]);
            cmd.Parameters.AddWithValue("@name", Label3.Text);
            cmd.Parameters.AddWithValue("@message", txtHTMLContext.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.UtcNow);
            cmd.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd1= new SqlCommand();
            cmd1.Connection = con;
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select postid from post where userid=@userid and message=@message";
            cmd1.Parameters.AddWithValue("@userid", Request.QueryString["u"]);
            cmd1.Parameters.AddWithValue("@message", txtHTMLContext.Text);
            SqlDataReader dr = cmd1.ExecuteReader();
            dr.Read();
            a = dr["postid"].ToString();
            dr.Close();
            con.Close();
            for(int i=0; i<CheckBoxList1.Items.Count;i++)
            {
                if(CheckBoxList1.Items[i].Selected==true)
                {
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.Connection = con;
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "insert into tags values(@postid,@tag)";
                    cmd2.Parameters.AddWithValue("@postid", a);
                    cmd2.Parameters.AddWithValue("@tag", CheckBoxList1.Items[i].Text);
                    cmd2.ExecuteNonQuery();
                    con.Close();
                }
            }
            con.Open();
            //Notify(send email to users who follow tags that the newly posted query contains)
            SqlCommand cmd3 = new SqlCommand();
            cmd3.Connection = con;
            cmd3.CommandType = CommandType.Text;
            cmd3.CommandText ="select email from users where userid in(select userid from follow where tag in(select tag from tags where postid="+a+"))";
            SqlDataReader dr1 = cmd3.ExecuteReader();
            while(dr1.Read())
            {
                String to = dr1["email"].ToString();
                String from = "msbeeforcss@outlook.com";
                MailMessage message = new MailMessage(from, to);

                String mailbody = @" Greetings from Microsoft BEE!";
                mailbody += @" 
                            This mail is to notify you that a new post with a tag that you follow has been added to Microsoft BEE.";
                mailbody += @" 
                            The query is:";
                mailbody += txtHTMLContext.Text;
                mailbody += @"
                            Login to Microsoft BEE to answer the query";
                message.Subject = "Post Notification";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.live.com",587);
                System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential("msbeeforcss@outlook.com","shutterisland123");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                }
                catch(Exception ex)
                {
                    throw ex;
                }
            }
            dr1.Close();
            con.Close();
            url = "Viewposts.aspx?u=" + Request.QueryString["u"];
            Response.Write("<script language='javascript'>alert('Post added!');window.location.href='" + url + "';</script>");
        }
    }
}