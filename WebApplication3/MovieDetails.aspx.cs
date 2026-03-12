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
                GridView1.DataBind();
            }
        }

        protected void CalendarInsert_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                Calendar cal = (Calendar)sender;
                FormView fv = (FormView)cal.NamingContainer;
                TextBox txtDate = (TextBox)fv.FindControl("RELEASEDATETextBox");
                if (txtDate != null)
                {
                    txtDate.Text = cal.SelectedDate.ToString("dd-MMM-yyyy");
                    ShowMessage("Date selected: " + cal.SelectedDate.ToString("dd-MMM-yyyy"), "success");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error selecting date: " + ex.Message, "error");
            }
        }

        protected void CalendarEdit_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                Calendar cal = (Calendar)sender;
                FormView fv = (FormView)cal.NamingContainer;
                TextBox txtDate = (TextBox)fv.FindControl("RELEASEDATETextBox");
                if (txtDate != null)
                {
                    txtDate.Text = cal.SelectedDate.ToString("dd-MMM-yyyy");
                    ShowMessage("Date updated: " + cal.SelectedDate.ToString("dd-MMM-yyyy"), "success");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error updating date: " + ex.Message, "error");
            }
        }

        // FormView Event Handlers
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows > 0)
                {
                    ShowMessage("? SUCCESS: Movie added successfully! The movie is now available in the system.", "success");
                    GridView1.DataBind(); // Refresh the grid
                }
                else
                {
                    ShowMessage("? WARNING: No movie was added. Please try again.", "warning");
                }
            }
            else
            {
                ShowMessage("? ERROR: Failed to add movie. " + GetUserFriendlyErrorMessage(e.Exception), "error");
                e.ExceptionHandled = true;
            }
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows > 0)
                {
                    ShowMessage("? SUCCESS: Movie updated successfully! All changes have been saved.", "success");
                    GridView1.DataBind(); // Refresh the grid
                }
                else
                {
                    ShowMessage("? WARNING: No changes were made to the movie.", "warning");
                }
            }
            else
            {
                ShowMessage("? ERROR: Failed to update movie. " + GetUserFriendlyErrorMessage(e.Exception), "error");
                e.ExceptionHandled = true;
            }
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows > 0)
                {
                    ShowMessage("? SUCCESS: Movie deleted successfully along with all related shows and bookings.", "success");
                    GridView1.DataBind(); // Refresh the grid
                }
                else
                {
                    ShowMessage("? WARNING: Movie could not be deleted. It may have already been removed.", "warning");
                }
            }
            else
            {
                ShowMessage("? ERROR: Failed to delete movie. " + GetUserFriendlyErrorMessage(e.Exception), "error");
                e.ExceptionHandled = true;
            }
        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                ShowMessage("? Operation cancelled. No changes were made.", "info");
            }
            else if (e.CommandName == "New")
            {
                pnlMessage.Visible = false; // Clear messages when adding new
            }
        }

        // SqlDataSource Event Handlers
        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowMessage("? DATABASE ERROR: " + GetUserFriendlyErrorMessage(e.Exception), "error");
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowMessage("? DATABASE ERROR: " + GetUserFriendlyErrorMessage(e.Exception), "error");
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ShowMessage("? DATABASE ERROR: " + GetUserFriendlyErrorMessage(e.Exception), "error");
                e.ExceptionHandled = true;
            }
        }

        // GridView Event Handlers
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // This fires before deletion - you can add pre-delete validation here
            string movieId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            // You could check if movie has active shows here
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add tooltips or additional styling to rows if needed
                Button deleteBtn = e.Row.Cells[e.Row.Cells.Count - 1].Controls[2] as Button;
                if (deleteBtn != null && deleteBtn.CommandName == "Delete")
                {
                    deleteBtn.OnClientClick = "return confirm('?? WARNING: Deleting this movie will also remove:\\n\\n• All show schedules\\n• All bookings\\n• All tickets\\n\\nThis action cannot be undone!\\n\\nAre you sure you want to proceed?');";
                    deleteBtn.ToolTip = "Delete this movie and all related records";
                }
            }
        }

        // Helper method to show messages
        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;
            
            // Set CSS class based on type
            string cssClass = "alert ";
            switch (type.ToLower())
            {
                case "success":
                    cssClass += "alert-success";
                    break;
                case "error":
                    cssClass += "alert-danger";
                    break;
                case "warning":
                    cssClass += "alert-warning";
                    break;
                case "info":
                    cssClass += "alert-info";
                    break;
                default:
                    cssClass += "alert-info";
                    break;
            }
            pnlMessage.CssClass = cssClass + " alert-custom";
        }

        // Helper method to convert technical errors to user-friendly messages
        private string GetUserFriendlyErrorMessage(Exception ex)
        {
            string message = ex.Message.ToLower();
            
            // Check for common Oracle errors
            if (message.Contains("unique constraint"))
            {
                return "A movie with this ID already exists. Please use a different Movie ID.";
            }
            else if (message.Contains("cannot insert null"))
            {
                return "All required fields must be filled. Please check your input and try again.";
            }
            else if (message.Contains("value larger than specified precision"))
            {
                return "One or more values are too large. Please check the Duration field.";
            }
            else if (message.Contains("invalid number"))
            {
                return "Duration must be a valid number between 1 and 500.";
            }
            else if (message.Contains("not a valid date"))
            {
                return "The release date format is invalid. Please select a date from the calendar.";
            }
            else if (message.Contains("foreign key constraint") || message.Contains("child record found"))
            {
                return "This movie has related shows or bookings. Please delete those first or contact support.";
            }
            else if (message.Contains("connection"))
            {
                return "Database connection error. Please check if the database is running and try again.";
            }
            else if (message.Contains("timeout"))
            {
                return "The operation took too long. Please try again.";
            }
            else
            {
                // Return a sanitized version of the actual error
                return "An unexpected error occurred. Please contact support if this persists. Error: " + 
                       (ex.Message.Length > 100 ? ex.Message.Substring(0, 100) + "..." : ex.Message);
            }
        }
    }
}
