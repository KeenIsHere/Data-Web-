using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class MovieDetails : Page
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
            if (e.CommandName == "EditMovie")
            {
                string movieId = e.CommandArgument.ToString();
                LoadMovieForEdit(movieId);
            }
            else if (e.CommandName == "DeleteMovie")
            {
                SqlDataSource1.DeleteParameters.Clear();
                SqlDataSource1.DeleteParameters.Add("MOVIEID", e.CommandArgument.ToString());
                SqlDataSource1.Delete();
                ResetToAllMovies();
            }
        }

        private void LoadMovieForEdit(string movieId)
        {
            SqlDataSource1.SelectCommand = string.Format(
                "SELECT MOVIEID, MOVIETITLE, MOVIELANGUAGE, MOVIEDURATION, RELEASEDATE FROM MOVIE WHERE MOVIEID = '{0}'",
                movieId.Replace("'", "''"));

            FormView1.DataBind();
            FormView1.ChangeMode(FormViewMode.Edit);
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.ReadOnly)
            {
                ResetToAllMovies();
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                SqlDataSource1.SelectCommand = "SELECT NULL AS MOVIEID, NULL AS MOVIETITLE, NULL AS MOVIELANGUAGE, NULL AS MOVIEDURATION, NULL AS RELEASEDATE FROM DUAL WHERE 1=0";
                FormView1.DataBind();
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllMovies();
                ShowMessage("Movie added successfully.", "success");
            }
            else
            {
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
                ShowMessage("Error adding movie: " + e.Exception.Message, "error");
            }
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllMovies();
                ShowMessage("Movie updated successfully.", "success");
            }
            else
            {
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
                ShowMessage("Error updating movie: " + e.Exception.Message, "error");
            }
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllMovies();
                ShowMessage("Movie deleted successfully.", "success");
            }
            else
            {
                e.ExceptionHandled = true;
                ShowMessage("Error deleting movie: " + e.Exception.Message, "error");
            }
        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                ResetToAllMovies();
            }
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ShowMessage("Database error: " + e.Exception.Message, "error");
            }
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ShowMessage("Database error: " + e.Exception.Message, "error");
            }
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ShowMessage("Database error: " + e.Exception.Message, "error");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        private void ResetToAllMovies()
        {
            SqlDataSource1.SelectCommand = "SELECT MOVIEID, MOVIETITLE, MOVIELANGUAGE, MOVIEDURATION, RELEASEDATE FROM MOVIE ORDER BY MOVIEID";
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            FormView1.DataBind();
            GridView1.DataBind();
        }

        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;
            pnlMessage.CssClass = "alert " +
                (type == "success" ? "alert-success" : type == "error" ? "alert-danger" : "alert-info") +
                " alert-custom mb-3";
        }
    }
}
