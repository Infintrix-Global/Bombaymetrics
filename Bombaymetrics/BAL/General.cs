using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Hosting;

namespace Bombaymetrics.BAL
{
    public class General
    {
        #region "Common functions"

        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ToString();


        public int GetDataInsertORUpdate(string storedProcedure, NameValueCollection nv)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(storedProcedure, con);

                for (int i = 0; i < nv.Count; i++)
                {
                    SqlParameter Param;
                    if ((nv.Get(nv.AllKeys[i])) == null)
                        Param = new SqlParameter(nv.AllKeys[i], DBNull.Value);
                    else
                        Param = new SqlParameter(nv.AllKeys[i], nv.Get(nv.AllKeys[i]));
                    cmd.Parameters.Add(Param);
                }

                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    result = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    ErrorMessage("Sql Error is=" + ex.Message.ToString());
                    cmd.Connection.Close();
                }
                finally
                {
                    con.Close();
                }
            }

            return result;
        }

        public void ErrorMessage(string msg)
        {
            string ACPPath = HostingEnvironment.MapPath("~/log.txt");
            StreamWriter swExtLogFile = new StreamWriter(ACPPath, true);
            swExtLogFile.Write(Environment.NewLine);
            swExtLogFile.Write("*****Error message=****" + msg + " at " + DateTime.Now.ToString());
            swExtLogFile.Flush();
            swExtLogFile.Close();
        }

        public int GetDataExecuteScaler(string storedProcedure, NameValueCollection nv)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(storedProcedure, con);

                for (int i = 0; i < nv.Count; i++)
                {
                    SqlParameter Param;
                    if ((nv.Get(nv.AllKeys[i])) == null)
                        Param = new SqlParameter(nv.AllKeys[i], DBNull.Value);
                    else
                        Param = new SqlParameter(nv.AllKeys[i], nv.Get(nv.AllKeys[i]));
                    cmd.Parameters.Add(Param);

                }

                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();

                    var result1 = cmd.ExecuteScalar();
                    result = result1 == DBNull.Value ? 0 : Convert.ToInt32(result1);


                }
                catch (Exception ex)
                {
                    ErrorMessage(ex.StackTrace + ex.Message.ToString());
                    cmd.Connection.Close();
                }
                finally
                {
                    con.Close();
                }
            }

            return result;
        }

        public long GetDataExecuteScalerRetObj(string storedProcedure, NameValueCollection nv)
        {
            long result = 0;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(storedProcedure, con);

                for (int i = 0; i < nv.Count; i++)
                {
                    SqlParameter Param;
                    if ((nv.Get(nv.AllKeys[i])) == null)
                        Param = new SqlParameter(nv.AllKeys[i], DBNull.Value);
                    else
                        Param = new SqlParameter(nv.AllKeys[i], nv.Get(nv.AllKeys[i]));
                    cmd.Parameters.Add(Param);

                }
                cmd.Parameters.Add("@ID", SqlDbType.BigInt);
                cmd.Parameters["@ID"].Direction = ParameterDirection.Output;
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    result = (long)cmd.Parameters["@ID"].Value;

                }
                catch (Exception ex)
                {
                    ErrorMessage(ex.StackTrace + ex.Message.ToString());
                    cmd.Connection.Close();
                }
                finally
                {
                    con.Close();
                }
            }

            return result;
        }

        public DataSet GetDataSet(string storedProcedure, NameValueCollection nv)
        {
            DataSet ds = new DataSet();

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(storedProcedure, con);

                for (int i = 0; i < nv.Count; i++)
                {
                    SqlParameter Param;
                    if ((nv.Get(nv.AllKeys[i])) == null)
                        Param = new SqlParameter(nv.AllKeys[i], DBNull.Value);
                    else
                        Param = new SqlParameter(nv.AllKeys[i], nv.Get(nv.AllKeys[i]));
                    cmd.Parameters.Add(Param);

                }

                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                try
                {
                    con.Open();
                    da.Fill(ds);
                }
                catch (Exception ex)
                {
                    ErrorMessage(ex.StackTrace + ex.Message.ToString());
                    da.Dispose();
                    cmd.Connection.Close();
                }
                finally
                {
                    con.Close();
                }
            }

            return ds;
        }

        public DataTable GetDataTable(string storedProcedure, NameValueCollection nv)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(storedProcedure, con);

                for (int i = 0; i < nv.Count; i++)
                {
                    SqlParameter Param;
                    if ((nv.Get(nv.AllKeys[i])) == null)
                        Param = new SqlParameter(nv.AllKeys[i], DBNull.Value);
                    else
                        Param = new SqlParameter(nv.AllKeys[i], nv.Get(nv.AllKeys[i]));
                    cmd.Parameters.Add(Param);

                }

                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                try
                {
                    con.Open();
                    da.Fill(dt);
                }
                catch (Exception ex)
                {
                    ErrorMessage(ex.StackTrace + ex.Message.ToString());
                    da.Dispose();
                    cmd.Connection.Close();
                }
                finally
                {
                    con.Close();
                }
            }

            return dt;
        }

    }
    #endregion



}