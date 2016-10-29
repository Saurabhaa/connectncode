using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataBaseLayer;
using System.Data;
using System.Data.SqlClient;


namespace BusinessLogicLayer
{
    public class RegistrationHelper
    {
        // Sign Up Data 

        private string _Name;
        private string _MobileNo;
        private string _Email;
        private string _Password;
        private string _Mode;
        private string _ProjectID;

        public string Name { get { return _Name; } set { _Name = value; } }
        public string MobileNo { get { return _MobileNo; } set { _MobileNo = value; } }
        public string Email { get { return _Email; } set { _Email = value; } }
        public string Password { get { return _Password; } set { _Password = value; } }
        public string Mode { get { return _Mode; } set { _Mode = value; } }
        public string ProjectID { get { return _ProjectID; } set { _ProjectID = value; } }

        public string saveRegistrationDetails()
        {
            string _result;

            try
            {
                SqlParameter[] objParameter = new SqlParameter[6];

                objParameter[0] = new SqlParameter("@pName", SqlDbType.VarChar, 50); objParameter[0].Value = Name;
                objParameter[1] = new SqlParameter("@pMobileNo", SqlDbType.VarChar, 50); objParameter[1].Value = MobileNo;
                objParameter[2] = new SqlParameter("@pEmail", SqlDbType.VarChar, 50); objParameter[2].Value = Email;
                objParameter[3] = new SqlParameter("@pPassword", SqlDbType.VarChar, 50); objParameter[3].Value = Password;
                objParameter[4] = new SqlParameter("@pMode", SqlDbType.VarChar, 50); objParameter[4].Value = Mode;
                objParameter[5] = new SqlParameter("@pvcOut", SqlDbType.VarChar, 50); objParameter[5].Direction = ParameterDirection.Output;
                CDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Add_RegistrationDetails", objParameter);

                _result = objParameter[5].Value.ToString();

                return _result;

            }
            catch (Exception ex)
            {
                return _result = ex.Message.ToString();
            }

        }



        public string saveUserProject()
        {
            string _result;

            try
            {
                SqlParameter[] objParameter = new SqlParameter[3];

                objParameter[0] = new SqlParameter("@pProjectID", SqlDbType.VarChar, 50); objParameter[0].Value = ProjectID;
                objParameter[1] = new SqlParameter("@pMode", SqlDbType.VarChar, 50); objParameter[1].Value = Mode;
                objParameter[2] = new SqlParameter("@pvcOut", SqlDbType.VarChar, 50); objParameter[2].Direction = ParameterDirection.Output;
                CDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "add_userprojects", objParameter);

                _result = objParameter[2].Value.ToString();

                return _result;

            }
            catch (Exception ex)
            {
                return _result = ex.Message.ToString();
            }

        }
        //  User Login Check

        public DataTable LoginAdmin(string user_id, string user_pwd)
        {


            CDataAccess objDataAccessHelper = new CDataAccess();
            SqlParameter[] objParameter = new SqlParameter[2];
            objParameter[0] = new SqlParameter("@email", SqlDbType.VarChar, 100); objParameter[0].Value = user_id;
            objParameter[1] = new SqlParameter("@password", SqlDbType.VarChar, 50); objParameter[1].Value = user_pwd;

            return objDataAccessHelper.GetDataTable("login_check", objParameter);

        }



        public DataTable Loginuser(string user_id, string user_pwd)
        {


            CDataAccess objDataAccessHelper = new CDataAccess();
            SqlParameter[] objParameter = new SqlParameter[2];
            objParameter[0] = new SqlParameter("@email", SqlDbType.VarChar, 100); objParameter[0].Value = user_id;
            objParameter[1] = new SqlParameter("@password", SqlDbType.VarChar, 50); objParameter[1].Value = user_pwd;

            return objDataAccessHelper.GetDataTable("login_check_for_user", objParameter);

        }
        // Blog Post Data


        private String _BlogPost;
        private String _ProjectTitle;

        public string BlogPost { get { return _BlogPost; } set { _BlogPost = value; } }
        public string ProjectTitle { get { return _ProjectTitle; } set { _ProjectTitle = value; } }

        public string saveBlogPost()
        {
            string _result;

            try
            {
                SqlParameter[] objParameter = new SqlParameter[4];

                objParameter[0] = new SqlParameter("@pProjectTitle", SqlDbType.NVarChar, -1); objParameter[0].Value = ProjectTitle;
                objParameter[1] = new SqlParameter("@pProjectDesc", SqlDbType.NVarChar, -1); objParameter[1].Value = BlogPost;
                objParameter[2] = new SqlParameter("@pMode", SqlDbType.VarChar, 50); objParameter[2].Value = Mode;
                objParameter[3] = new SqlParameter("@pvcOut", SqlDbType.VarChar, 50); objParameter[3].Direction = ParameterDirection.Output;
                CDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Add_Project", objParameter);

                _result = objParameter[3].Value.ToString();

                return _result;

            }
            catch (Exception ex)
            {
                return _result = ex.Message.ToString();
            }

        }



    }
}
