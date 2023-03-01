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
    public partial class Category : System.Web.UI.Page
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
            ad = new SqlDataAdapter("select * from Category", con);
            ad.Fill(ds);
            GridView2.DataSource = ds.Tables[0];
            GridView2.DataBind();

        }
        protected void submit_login_Click(object sender, EventArgs e)
        {
            cd = new SqlCommand("insert into Category (name) values('" + cate.Text + "')", con);
            Convert.ToInt32(cd.ExecuteScalar());
            fillgrid();
            clear();
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cd = new SqlCommand("delete from Category where id = " + GridView2.Rows[e.RowIndex].Cells[2].Text, con);
            cd.ExecuteNonQuery();
            fillgrid();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            cate.Text = GridView2.Rows[e.RowIndex].Cells[3].Text;
            ViewState["Cateid"] = GridView2.Rows[e.RowIndex].Cells[2].Text;
        }
        public void clear()
        {
            cate.Text = "";
        }
        protected void updatecate_Click(object sender, EventArgs e)
        {
            cd = new SqlCommand("update Category set name = '"+cate.Text+"' where id = "+  ViewState["Cateid"].ToString(), con);
            cd.ExecuteNonQuery();
            fillgrid();
            ViewState.Remove("Cateid");
            clear();
        }
    }
}