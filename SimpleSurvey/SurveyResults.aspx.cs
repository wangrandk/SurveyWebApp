using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleSurvey
{
    public partial class SurveyResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btbSwitch_Click(object sender, EventArgs e)
        {
            Server.Transfer("SurveyForm.aspx");
        }
    }
}