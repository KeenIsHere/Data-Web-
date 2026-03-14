using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class TicketDetails : Page
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
            if (e.CommandName == "EditTicket")
            {
                string ticketId = e.CommandArgument.ToString();
                SqlDataSource1.SelectCommand = string.Format(
                    "SELECT TICKETID, BOOKINGID, SEATID, BASETICKETPRICE, FINALTICKETPRICE, SEATSTATUS FROM TICKET WHERE TICKETID = '{0}'",
                    ticketId.Replace("'", "''"));
                FormView1.DataBind();
                FormView1.ChangeMode(FormViewMode.Edit);
            }
            else if (e.CommandName == "DeleteTicket")
            {
                SqlDataSource1.DeleteParameters.Clear();
                SqlDataSource1.DeleteParameters.Add("TICKETID", e.CommandArgument.ToString());
                SqlDataSource1.Delete();
                ResetToAllTickets();
            }
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.ReadOnly)
            {
                ResetToAllTickets();
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                SqlDataSource1.SelectCommand = "SELECT NULL AS TICKETID, NULL AS BOOKINGID, NULL AS SEATID, NULL AS BASETICKETPRICE, NULL AS FINALTICKETPRICE, NULL AS SEATSTATUS FROM DUAL WHERE 1=0";
                FormView1.DataBind();
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllTickets();
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
                ResetToAllTickets();
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
                ResetToAllTickets();
            }
            else
            {
                e.ExceptionHandled = true;
            }
        }

        private void ResetToAllTickets()
        {
            SqlDataSource1.SelectCommand = "SELECT TICKETID, BOOKINGID, SEATID, BASETICKETPRICE, FINALTICKETPRICE, SEATSTATUS FROM TICKET ORDER BY TICKETID";
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            FormView1.DataBind();
            GridView1.DataBind();
        }
    }
}
