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
    public partial class Home : System.Web.UI.Page
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
            }
        }
        public  void loadEnrolls(int qty)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:hello("+ qty + ")", true);
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
            ds.Clear();
            ad = new SqlDataAdapter("select Course_tbl.id,Course_tbl.name,professor_name,C.name \"Category\",timeduration,description,fees from Category C,Course_tbl where C.id = cateid", con);
            ad.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int uid = int.Parse(Session["Lid"].ToString());
            int cid = int.Parse(GridView1.Rows[e.RowIndex].Cells[1].Text);
            ds.Clear();
            ad = new SqlDataAdapter("select * from Enrollment where user_id = "+uid+" and course_id = "+cid, con);
            ad.Fill(ds);
            if(ds.Tables[0].Rows.Count == 0)
            {
                cd = new SqlCommand("insert into Enrollment(course_id,user_id,join_date) values(" + cid + "," + uid + ",'" + DateTime.Now.ToString("M/d/yyyy") + "')", con);
                cd.ExecuteNonQuery();
                countOrders();
                Response.Redirect("OwnEnrolleds.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('You alredy enrolled in this course')</script>", true);
            }
           


        }
    }
}