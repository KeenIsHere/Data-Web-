using System;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class UserTicket : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ddlUser.Items.Count > 0)
                {
                    LoadUserTickets();
                }
            }
        }

        protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadUserTickets();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadUserTickets();
        }

        private void LoadUserTickets()
        {
            if (string.IsNullOrEmpty(ddlUser.SelectedValue))
                return;

            string query = @"SELECT u.USERNAME, 
                                   b.BOOKINGDATETIME, 
                                   t.TICKETID, 
                                   m.MOVIETITLE,
                                   s.SHOWDATE,
                                   s.SHOWTIME,
                                   t.FINALTICKETPRICE
                            FROM USER_ACCOUNT u
                            INNER JOIN BOOKING b ON u.USERID = b.USERID
                            INNER JOIN TICKET t ON b.BOOKINGID = t.BOOKINGID
                            INNER JOIN SHOW s ON b.SHOWID = s.SHOWID
                            INNER JOIN MOVIE m ON s.MOVIEID = m.MOVIEID
                            WHERE u.USERID = :UserID
                            AND b.BOOKINGDATETIME >= ADD_MONTHS(SYSDATE, -6)
                            AND t.SEATSTATUS = 'Booked'
                            ORDER BY b.BOOKINGDATETIME DESC";

            DataTable dt = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
            string providerName = ConfigurationManager.ConnectionStrings["ConnectionString2"].ProviderName;

            DbProviderFactory factory = DbProviderFactories.GetFactory(providerName);
            
            using (DbConnection conn = factory.CreateConnection())
            {
                conn.ConnectionString = connString;
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = query;
                    
                    DbParameter param = cmd.CreateParameter();
                    param.ParameterName = "UserID";
                    param.Value = ddlUser.SelectedValue;
                    cmd.Parameters.Add(param);
                    
                    using (DbDataAdapter adapter = factory.CreateDataAdapter())
                    {
                        adapter.SelectCommand = cmd;
                        conn.Open();
                        adapter.Fill(dt);
                    }
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblTotalTickets.Text = dt.Rows.Count.ToString();
            
            decimal totalAmount = 0;
            foreach (DataRow row in dt.Rows)
            {
                totalAmount += Convert.ToDecimal(row["FINALTICKETPRICE"]);
            }
            lblTotalAmount.Text = "Rs. " + totalAmount.ToString("N2");
        }
    }
}
