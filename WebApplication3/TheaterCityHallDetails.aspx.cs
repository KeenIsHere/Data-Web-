using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class TheaterCityHallDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormViewTheater.ChangeMode(FormViewMode.ReadOnly);
                FormViewHall.ChangeMode(FormViewMode.ReadOnly);
                GridViewTheater.DataBind();
                GridViewHall.DataBind();
            }
        }

        protected void GridViewTheater_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditTheater")
            {
                string theaterId = e.CommandArgument.ToString();
                SqlDataSourceTheater.SelectCommand = string.Format(
                    "SELECT THEATERID, THEATERNAME FROM THEATER WHERE THEATERID = '{0}'",
                    theaterId.Replace("'", "''"));
                FormViewTheater.DataBind();
                FormViewTheater.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void GridViewHall_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditHall")
            {
                string hallId = e.CommandArgument.ToString();
                SqlDataSourceHall.SelectCommand = string.Format(
                    "SELECT HALLID, THEATERID, HALLNUMBER, HALLCAPACITY FROM HALL WHERE HALLID = '{0}'",
                    hallId.Replace("'", "''"));
                FormViewHall.DataBind();
                FormViewHall.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void FormViewTheater_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.ReadOnly)
                ResetTheater();
            else if (e.NewMode == FormViewMode.Insert)
            {
                SqlDataSourceTheater.SelectCommand = "SELECT NULL AS THEATERID, NULL AS THEATERNAME FROM DUAL WHERE 1=0";
                FormViewTheater.DataBind();
            }
        }

        protected void FormViewHall_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.ReadOnly)
                ResetHall();
            else if (e.NewMode == FormViewMode.Insert)
            {
                SqlDataSourceHall.SelectCommand = "SELECT NULL AS HALLID, NULL AS THEATERID, NULL AS HALLNUMBER, NULL AS HALLCAPACITY FROM DUAL WHERE 1=0";
                FormViewHall.DataBind();
            }
        }

        protected void FormViewTheater_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null) ResetTheater(); else { e.ExceptionHandled = true; e.KeepInInsertMode = true; }
        }

        protected void FormViewTheater_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null) ResetTheater(); else { e.ExceptionHandled = true; e.KeepInEditMode = true; }
        }

        protected void FormViewTheater_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception == null) ResetTheater(); else e.ExceptionHandled = true;
        }

        protected void FormViewHall_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null) ResetHall(); else { e.ExceptionHandled = true; e.KeepInInsertMode = true; }
        }

        protected void FormViewHall_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null) ResetHall(); else { e.ExceptionHandled = true; e.KeepInEditMode = true; }
        }

        protected void FormViewHall_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception == null) ResetHall(); else e.ExceptionHandled = true;
        }

        private void ResetTheater()
        {
            SqlDataSourceTheater.SelectCommand = "SELECT THEATERID, THEATERNAME FROM THEATER ORDER BY THEATERID";
            FormViewTheater.ChangeMode(FormViewMode.ReadOnly);
            FormViewTheater.DataBind();
            GridViewTheater.DataBind();
            GridViewHall.DataBind();
        }

        private void ResetHall()
        {
            SqlDataSourceHall.SelectCommand = "SELECT HALLID, THEATERID, HALLNUMBER, HALLCAPACITY FROM HALL ORDER BY HALLID";
            FormViewHall.ChangeMode(FormViewMode.ReadOnly);
            FormViewHall.DataBind();
            GridViewHall.DataBind();
        }
    }
}
