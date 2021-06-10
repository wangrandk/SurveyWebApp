using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.ComponentModel;


namespace SimpleSurvey
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SurveyApp;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("sp_insertUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", tbxname.Text);
            cmd.Parameters.AddWithValue("@password", tbxpw.Text);
            cmd.Parameters.AddWithValue("@role", DropDownList1.SelectedItem.Value);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                Response.Write("<h2>New user inserted</h2>" + i);
            }
            else
            {
                Response.Write("<h2>User already exist</h2>");

            }


            SqlCommand cmd1 = new SqlCommand("sp_insertRole", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@role", DropDownList1.SelectedItem.Value);
            con.Open();
            int n = cmd1.ExecuteNonQuery();
            con.Close();
            if (n == 1)
            {
                Response.Write("<h2>New role inserted</h2>");

            }
            else
            {
                Response.Write("<h2>role already exist</h2>");

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btbSwitch1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageQuestions.aspx");
        }

        protected void btbSwitch2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageSurveys.aspx");
        }
    }
}