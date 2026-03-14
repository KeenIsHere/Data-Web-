using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class PaymentDetails : Page
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
            if (e.CommandName == "EditPayment")
            {
                string paymentId = e.CommandArgument.ToString();
                SqlDataSource1.SelectCommand = string.Format(
                    "SELECT PAYMENTID, BOOKINGID, AMOUNTPAID, PAYMENTDATE, PAYMENTMETHOD FROM PAYMENT WHERE PAYMENTID = '{0}'",
                    paymentId.Replace("'", "''"));
                FormView1.DataBind();
                FormView1.ChangeMode(FormViewMode.Edit);
            }
            else if (e.CommandName == "DeletePayment")
            {
                SqlDataSource1.DeleteParameters.Clear();
                SqlDataSource1.DeleteParameters.Add("PAYMENTID", e.CommandArgument.ToString());
                SqlDataSource1.Delete();
                ResetToAllPayments();
            }
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.ReadOnly)
            {
                ResetToAllPayments();
            }
            else if (e.NewMode == FormViewMode.Insert)
            {
                SqlDataSource1.SelectCommand = "SELECT NULL AS PAYMENTID, NULL AS BOOKINGID, NULL AS AMOUNTPAID, NULL AS PAYMENTDATE, NULL AS PAYMENTMETHOD FROM DUAL WHERE 1=0";
                FormView1.DataBind();
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ResetToAllPayments();
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
                ResetToAllPayments();
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
                ResetToAllPayments();
            }
            else
            {
                e.ExceptionHandled = true;
            }
        }

        private void ResetToAllPayments()
        {
            SqlDataSource1.SelectCommand = "SELECT PAYMENTID, BOOKINGID, AMOUNTPAID, PAYMENTDATE, PAYMENTMETHOD FROM PAYMENT ORDER BY PAYMENTID";
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            FormView1.DataBind();
            GridView1.DataBind();
        }
    }
}
