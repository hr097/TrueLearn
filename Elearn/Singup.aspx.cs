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
    
    public partial class Singup : System.Web.UI.Page
    {
        static String constr = ConfigurationManager.ConnectionStrings["SqlClient"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
       
        SqlCommand cd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
            {
                con.Open();
            }
        }

        protected void submit_login_Click(object sender, EventArgs e)
        {
            cd = new SqlCommand("insert into Usertbl (email ,password ,qualification) values('" + email.Text + "','" + password.Text + "','" + qualifcation.Text + "')",con);
            int result = Convert.ToInt32(cd.ExecuteScalar());
            if(result != 0)
            {
                Session["Lid"] = result;
                Session["Ltype"] = 2;

                Response.Redirect("Home.aspx");
            }

            Response.Redirect("Home.aspx");
        }
    }
}