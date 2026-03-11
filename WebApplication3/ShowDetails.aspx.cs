using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ShowDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        protected void CalendarInsert_SelectionChanged(object sender, EventArgs e)
        {
            Calendar cal = (Calendar)sender;
            FormView fv = (FormView)cal.NamingContainer;
            TextBox txtDate = (TextBox)fv.FindControl("SHOWDATETextBox");
            if (txtDate != null)
            {
                txtDate.Text = cal.SelectedDate.ToString("dd-MMM-yyyy");
            }
        }

        protected void CalendarEdit_SelectionChanged(object sender, EventArgs e)
        {
            Calendar cal = (Calendar)sender;
            FormView fv = (FormView)cal.NamingContainer;
            TextBox txtDate = (TextBox)fv.FindControl("SHOWDATETextBox");
            if (txtDate != null)
            {
                txtDate.Text = cal.SelectedDate.ToString("dd-MMM-yyyy");
            }
        }
    }
}
