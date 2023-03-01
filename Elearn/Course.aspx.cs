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
    public partial class Course : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                populateCate();
            }
        }
        public void populateCate()
        {
            ds.Clear();
            ad = new SqlDataAdapter("select * from Category",con);
            ad.Fill(ds);
            category.DataSource = ds.Tables[0];
            category.DataTextField = "name";
            category.DataValueField = "id";
            category.DataBind();
        }
        public void Clear()
        {
            name.Text = "";
            pname.Text = "";
            timeduration.Text = "";
            description.Text = "";
            timeduration.Text = "";
            fees.Text = "";
        }
        public void fillgrid()
        {
            ds.Clear();
            ad = new SqlDataAdapter("select * from Course_tbl", con);
            ad.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        protected void insert_Click(object sender, EventArgs e)
        {
            cd = new SqlCommand("insert into Course_tbl(name,professor_name,cateid,timeduration,description,fees) values('" + name.Text + "','" + pname.Text + "'," + category.SelectedItem.Value + "," + timeduration.Text + ",'" + description.Text + "'," + fees.Text + ")", con);
           
            cd.ExecuteNonQuery();
            Clear();
            fillgrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cd = new SqlCommand("delete from Course_tbl where id = " + GridView1.Rows[e.RowIndex].Cells[2].Text, con);
            cd.ExecuteNonQuery();
            fillgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ViewState["Cid"] = GridView1.Rows[e.RowIndex].Cells[2].Text;
            category.ClearSelection();
            name.Text = GridView1.Rows[e.RowIndex].Cells[3].Text;
            pname.Text = GridView1.Rows[e.RowIndex].Cells[4].Text;
            category.Items.FindByValue(GridView1.Rows[e.RowIndex].Cells[5].Text).Selected = true;
            timeduration.Text = GridView1.Rows[e.RowIndex].Cells[6].Text;
            description.Text = GridView1.Rows[e.RowIndex].Cells[7].Text;
            fees.Text = GridView1.Rows[e.RowIndex].Cells[8].Text;
        }

        protected void update_Click(object sender, EventArgs e)
        {
           
            cd = new SqlCommand("update Course_tbl set name = '"+name.Text+"',professor_name = '"+pname.Text+"',cateid="+category.SelectedItem.Value+",timeduration = "+timeduration.Text+", description = '"+description.Text+"',fees = "+fees.Text+" where id = "+ViewState["Cid"].ToString(), con);
            cd.ExecuteNonQuery();
            fillgrid();
            Clear();
        }
    }
}