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
                FormView1.ChangeMode(FormViewMode.ReadOnly);
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditShow")
            {
                string showId = e.CommandArgument.ToString();
                SqlDataSource1.SelectCommand = string.Format(
                    "SELECT SHOWID, MOVIEID, HALLID, SHOWDATE, SHOWTIME FROM SHOW WHERE SHOWID = '{0}'",
                    showId.Replace("'", "''"));
                FormView1.DataBind();
                FormView1.ChangeMode(FormViewMode.Edit);
            }
            else if (e.CommandName == "DeleteShow")
            {
                SqlDataSource1.DeleteParameters.Clear();
                SqlDataSource1.DeleteParameters.Add("SHOWID", e.CommandArgument.ToString());
                SqlDataSource1.Delete();
                ResetToAllShows();
            }
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.ReadOnly)
            {
                ResetToAllShows();
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                SqlDataSource1.SelectCommand = "SELECT NULL AS SHOWID, NULL AS MOVIEID, NULL AS HALLID, NULL AS SHOWDATE, NULL AS SHOWTIME FROM DUAL WHERE 1=0";
                FormView1.DataBind();
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllShows();
            }
            else
            {
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllShows();
            }
            else
            {
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllShows();
            }
            else
            {
                e.ExceptionHandled = true;
            }
        }

        private void ResetToAllShows()
        {
            SqlDataSource1.SelectCommand = "SELECT SHOWID, MOVIEID, HALLID, SHOWDATE, SHOWTIME FROM SHOW ORDER BY SHOWID";
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            FormView1.DataBind();
            GridView1.DataBind();
        }
    }
}
