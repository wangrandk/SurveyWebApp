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
using System.Web.Security;
using System.Security.Cryptography;

namespace SimpleSurvey
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void KeepUserSession(string username, string password, string role)
        {
            this.Session["USER_NAME"] = username;
            this.Session["PASSWORD"] = password;
            this.Session["ROLE"] = role;
            this.Session["TIME_OF_LOGIN"] = DateTime.UtcNow;

            //using FormsAuthentication, then the username can be stored onto the session in the same way you're telling the FormsAuthentication system that current session should be transformed from non-authenticated to authenticated:
            FormsAuthentication.RedirectFromLoginPage(this.tbxname.Text, createPersistentCookie: false);

            // wait 10 seconds, then jump to the survey form page
            //System.Threading.Thread.Sleep(3000);
            Response.Redirect("SurveyForm.aspx");
        }
         
        protected void btSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SurveyApp;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("sp_insertUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", tbxname.Text);
            cmd.Parameters.AddWithValue("@password", ComputeHash(tbxpw.Text));
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

            // Keep user in the session
            this.KeepUserSession(tbxname.Text, tbxpw.Text, DropDownList1.SelectedItem.Value);

        }

        private string ComputeHash(string input)
        {
            string output;
            using(SHA256 mySHA256 = SHA256.Create() )
            {
                byte[] secBytes = Encoding.ASCII.GetBytes(input);
                byte[] hashValue = mySHA256.ComputeHash(secBytes);
                output = Encoding.ASCII.GetString(hashValue);
            }
            return output;
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