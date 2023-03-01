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
    public partial class OwnEnrolleds : System.Web.UI.Page
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
                countOrders();
                countFees();
            }

        }
        public void countFees()
        {
            ds.Clear();
            int uid = int.Parse(Session["Lid"].ToString());
            ad = new SqlDataAdapter("select sum(C.fees) from Course_tbl C , Enrollment  where course_id = C.id and user_id=" + uid, con);
            ad.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                Label2.Text = ds.Tables[0].Rows[0]["Column1"].ToString();

            }
            else
            {
                Label2.Text = "0";
            }

        }
        public void loadEnrolls(int qty)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:hello(" + qty + ")", true);
        }
        void countOrders()
        {
            ds.Clear();
            int uid = int.Parse(Session["Lid"].ToString());
            ad = new SqlDataAdapter("select * from Enrollment where user_id = " + uid, con);
            ad.Fill(ds);
            int qty = ds.Tables[0].Rows.Count;
            loadEnrolls(qty);
        }
        public void fillgrid()
        {
            int uid = int.Parse(Session["Lid"].ToString());
            ds.Clear();
            ad = new SqlDataAdapter("select enrollment_id, C.name, U.email, join_date from Enrollment,Course_tbl C,Usertbl U where C.id = course_id and U.id = user_id and user_id=" + uid, con);
            ad.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cd = new SqlCommand("delete from Enrollment where enrollment_id = " + GridView1.Rows[e.RowIndex].Cells[1].Text, con);
            cd.ExecuteNonQuery();
            fillgrid();
            countOrders();
            countFees();
            Response.Redirect("OwnEnrolleds.aspx");
        }
    }
}