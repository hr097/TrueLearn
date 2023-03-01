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
    public partial class admin : System.Web.UI.Page
    {
        static String constr = ConfigurationManager.ConnectionStrings["SqlClient"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter ad;
        SqlCommand cd;
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["Lid"] is string))
            {
                Response.Redirect("Login.aspx");
            }
            if (con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
            {
                con.Open();
                fillgrid();
            }
        }
        public void fillgrid()
        {
            ds.Clear();
            ad = new SqlDataAdapter("select id,email,password,qualification from Usertbl where usertype = 2",con);
            ad.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cd = new SqlCommand("delete from Usertbl where id = " + GridView1.Rows[e.RowIndex].Cells[1].Text,con);
            cd.ExecuteNonQuery();
            fillgrid();
        }
    }
}