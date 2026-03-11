using System;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class OccupancyPerformer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ddlMovie.Items.Count > 0)
                {
                    LoadTopPerformers();
                }
            }
        }

        protected void ddlMovie_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadTopPerformers();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadTopPerformers();
        }

        private void LoadTopPerformers()
        {
            if (string.IsNullOrEmpty(ddlMovie.SelectedValue))
                return;

            string query = @"SELECT *
                            FROM (
                                SELECT th.THEATERNAME,
                                       h.HALLNUMBER,
                                       COUNT(t.TICKETID) AS BOOKEDSEATS,
                                       h.HALLCAPACITY,
                                       ROUND((COUNT(t.TICKETID)/h.HALLCAPACITY)*100,2) AS OCCUPANCYPERCENTAGE
                                FROM MOVIE m
                                INNER JOIN SHOW s ON m.MOVIEID = s.MOVIEID
                                INNER JOIN HALL h ON s.HALLID = h.HALLID
                                INNER JOIN THEATER th ON h.THEATERID = th.THEATERID
                                INNER JOIN BOOKING b ON s.SHOWID = b.SHOWID
                                INNER JOIN TICKET t ON b.BOOKINGID = t.BOOKINGID
                                INNER JOIN PAYMENT p ON b.BOOKINGID = p.BOOKINGID
                                WHERE m.MOVIEID = :MovieID
                                AND p.AMOUNTPAID > 0
                                AND t.SEATSTATUS = 'Booked'
                                GROUP BY th.THEATERNAME, h.HALLNUMBER, h.HALLCAPACITY
                                ORDER BY OCCUPANCYPERCENTAGE DESC
                            )
                            WHERE ROWNUM <= 3";

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
                    param.ParameterName = "MovieID";
                    param.Value = ddlMovie.SelectedValue;
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
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.CssClass = "top-performer";
            }
        }
    }
}
