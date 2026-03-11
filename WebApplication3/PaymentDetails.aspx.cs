using System;
using System.Web.UI;

namespace WebApplication3
{
    public partial class PaymentDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
        }
    }
}
