using System;
using System.Configuration;
using System.Data;
using System.Data.Common;

namespace WebApplication3
{
    public class DBHelper
    {
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        }

        private static string GetProviderName()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString2"].ProviderName;
        }

        public static DataTable ExecuteQuery(string query)
        {
            DataTable dt = new DataTable();
            try
            {
                DbProviderFactory factory = DbProviderFactories.GetFactory(GetProviderName());
                
                using (DbConnection conn = factory.CreateConnection())
                {
                    conn.ConnectionString = GetConnectionString();
                    using (DbCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = query;
                        using (DbDataAdapter adapter = factory.CreateDataAdapter())
                        {
                            adapter.SelectCommand = cmd;
                            conn.Open();
                            adapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error executing query: " + ex.Message);
            }
            return dt;
        }

        public static int ExecuteNonQuery(string query)
        {
            int result = 0;
            try
            {
                DbProviderFactory factory = DbProviderFactories.GetFactory(GetProviderName());
                
                using (DbConnection conn = factory.CreateConnection())
                {
                    conn.ConnectionString = GetConnectionString();
                    using (DbCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = query;
                        conn.Open();
                        result = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error executing command: " + ex.Message);
            }
            return result;
        }

        public static object ExecuteScalar(string query)
        {
            object result = null;
            try
            {
                DbProviderFactory factory = DbProviderFactories.GetFactory(GetProviderName());
                
                using (DbConnection conn = factory.CreateConnection())
                {
                    conn.ConnectionString = GetConnectionString();
                    using (DbCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = query;
                        conn.Open();
                        result = cmd.ExecuteScalar();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error executing scalar: " + ex.Message);
            }
            return result;
        }
    }
}
