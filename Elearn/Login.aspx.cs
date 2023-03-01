using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Elearn
{
    public partial class Login : System.Web.UI.Page
    {
        static String constr = ConfigurationManager.ConnectionStrings["SqlClient"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter ad;
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
            {
                con.Open();
            }
        }

        protected void submit_login_Click(object sender, EventArgs e)
        {
            ad = new SqlDataAdapter("select * from Usertbl where email='" + email.Text + "' and password = '" + password.Text + "'", con);
            ad.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                
                Session["Lid"] = ds.Tables[0].Rows[0][0].ToString();
                Session["Ltype"] = ds.Tables[0].Rows[0][4].ToString(); 
                if(int.Parse(ds.Tables[0].Rows[0].ItemArray[4].ToString()) == 1)
                {
                    Label1.Text = "Admin Login Successfull";
                    Response.Redirect("admin.aspx");
                }
                else
                {
                    Label1.Text = "User Login Successfull";
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                Label1.Text = "Please enter valid credentials";
            }
        }
    }
}