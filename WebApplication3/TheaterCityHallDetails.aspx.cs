using System;
using System.Web.UI;

namespace WebApplication3
{
    public partial class TheaterCityHallDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewTheater.DataBind();
                GridViewHall.DataBind();
            }
        }
    }
}
