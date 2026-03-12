using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class UserDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Show the instruction message initially
                FormView1.ChangeMode(FormViewMode.ReadOnly);
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUser")
            {
                string userId = e.CommandArgument.ToString();
                LoadUserForEdit(userId);
            }
        }

        private void LoadUserForEdit(string userId)
        {
            // Create a filtered query for the specific user
            SqlDataSource1.SelectCommand = string.Format(
                "SELECT USERID, USERNAME, USERCONTACT FROM USER_ACCOUNT WHERE USERID = '{0}'", 
                userId.Replace("'", "''") // Basic SQL injection prevention
            );
            
            // Rebind and switch to edit mode
            FormView1.DataBind();
            FormView1.ChangeMode(FormViewMode.Edit);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Reset to show all users
                ResetToAllUsers();
                
                // Show success message (you can add a label for this)
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                    "alert('User updated successfully!');", true);
            }
            else
            {
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
                
                // Show error message
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                    "alert('Error updating user: " + e.Exception.Message.Replace("'", "\\'") + "');", true);
            }
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.ReadOnly)
            {
                // User clicked Cancel or after update
                ResetToAllUsers();
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                // User clicked "Add New" - prepare for insert
                SqlDataSource1.SelectCommand = "SELECT NULL AS USERID, NULL AS USERNAME, NULL AS USERCONTACT FROM DUAL WHERE 1=0";
                FormView1.DataBind();
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Reset to show all users after successful insert
                ResetToAllUsers();
                
                // Show success message
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                    "alert('New user added successfully!');", true);
            }
            else
            {
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
                
                // Show error message
                string errorMsg = e.Exception.Message.Replace("'", "\\'");
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                    "alert('Error adding user: " + errorMsg + "');", true);
            }
        }

        private void ResetToAllUsers()
        {
            SqlDataSource1.SelectCommand = "SELECT USERID, USERNAME, USERCONTACT FROM USER_ACCOUNT ORDER BY USERID";
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            FormView1.DataBind();
            GridView1.DataBind();
        }
    }
}
