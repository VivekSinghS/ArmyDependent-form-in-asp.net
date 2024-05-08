using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArmyCops
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("data source=LAPTOP-LV098BPO\\SQLEXPRESS;initial catalog=ArmyDependent;integrated security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                viewData();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text == "Submit")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("insert into ArmDependent(Name,Rank,SmartCardNo,MobNo,Address,ArmyInrollmentNo) Values('" + txtName.Text + "','" + txtRank.Text + "','" + txtSmartcard.Text + "','" + txtMobno.Text + "','" + txtAddress.Text + "','" + txtarmyEnroll.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                viewData();
                Clear();
            }
            else if(btnSubmit.Text =="Update") 
                {

                con.Open();
                SqlCommand cmd = new SqlCommand("update ArmDependent set Name='" + txtName.Text + "',Rank='" + txtRank.Text + "',SmartcardNo='" + txtSmartcard.Text + "',MobNo='" + txtMobno.Text + "',Address='" + txtAddress.Text + "',ArmyInrollmentNo='" + txtarmyEnroll.Text + "' where ArmyNo = '" + ViewState["vd"] +"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                viewData();
                Clear();

            }
        }
          
        public void Clear()
        {
            txtName.Text = "";
            txtRank.Text = "";
            txtSmartcard.Text = "";
            txtMobno.Text = "";
            txtarmyEnroll.Text = "";
            txtAddress.Text = "";
            btnSubmit.Text = "Submit";

        }
        public void viewData()
        {
            SqlCommand cmd = new SqlCommand("Select * from ArmDependent", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            grdView.DataSource = dt;
            grdView.DataBind();
        }

        protected void grdView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from ArmDependent where ArmyNo= '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                DataBind();
                con.Close();
            }
            else if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from ArmDependent where ArmyNo= '" + e.CommandArgument + "'", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                con.Close();
                txtarmyEnroll.Text = dt.Rows[0]["ArmyInrollmentNo"].ToString();
                txtName.Text=dt.Rows[0]["Name"].ToString();
                txtRank.Text = dt.Rows[0]["Rank"].ToString();
                txtSmartcard.Text = dt.Rows[0]["SmartCardNo"].ToString();
                txtMobno.Text = dt.Rows[0]["MobNo"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                btnSubmit.Text = "Update";
                ViewState["vd"]=e.CommandArgument;
                
            }
        }
    }
}