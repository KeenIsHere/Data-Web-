using System;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class TheaterMovie : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ddlTheater.Items.Count > 0)
                {
                    LoadTheaterMovies();
                }
            }
        }

        protected void ddlTheater_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadTheaterMovies();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadTheaterMovies();
        }

        private void LoadTheaterMovies()
        {
            if (string.IsNullOrEmpty(ddlTheater.SelectedValue))
                return;

            string query = @"SELECT th.THEATERNAME,
                                   h.HALLNUMBER,
                                   m.MOVIETITLE,
                                   m.MOVIELANGUAGE,
                                   s.SHOWDATE,
                                   s.SHOWTIME
                            FROM THEATER th
                            INNER JOIN HALL h ON th.THEATERID = h.THEATERID
                            INNER JOIN SHOW s ON h.HALLID = s.HALLID
                            INNER JOIN MOVIE m ON s.MOVIEID = m.MOVIEID
                            WHERE th.THEATERID = :TheaterID
                            ORDER BY s.SHOWDATE DESC, s.SHOWTIME";

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
                    param.ParameterName = "TheaterID";
                    param.Value = ddlTheater.SelectedValue;
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
    }
}
