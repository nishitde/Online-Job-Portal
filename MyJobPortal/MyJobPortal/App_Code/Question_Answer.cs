//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyJobPortalModel {
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Configuration;
    
    
    public class Question_Answer {
        
        private Int32 _Id;
        
        private Int32 _QuestionId;
        
        private Int32 _AnswerId;
        
        public Question_Answer(int ID) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand("select * from Question_Answer where ID = " + ID , ObjConnection);
			SqlDataReader ObjReader = ObjCommand.ExecuteReader();
			ObjReader.Read();
			if(ObjReader["Id"] != DBNull.Value)
				Id = (int)ObjReader["Id"];
			if(ObjReader["QuestionId"] != DBNull.Value)
				QuestionId = (int)ObjReader["QuestionId"];
			if(ObjReader["AnswerId"] != DBNull.Value)
				AnswerId = (int)ObjReader["AnswerId"];
			ObjReader.Close();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
        }
        
        public virtual Int32 Id {
            get {
				return _Id;
            }
            set {
				_Id = value;
            }
        }
        
        public virtual Int32 QuestionId {
            get {
				return _QuestionId;
            }
            set {
				_QuestionId = value;
            }
        }
        
        public virtual Int32 AnswerId {
            get {
				return _AnswerId;
            }
            set {
				_AnswerId = value;
            }
        }
        
        public static Int32 AddQuestion_Answer(Int32 QuestionId, Int32 AnswerId) {
			string strsql = "insert into Question_Answer output inserted.id values(" + QuestionId + "," + AnswerId + ")"; 
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			int NewID = (int) ObjCommand.ExecuteScalar();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
			return NewID;
        }
        
        public static DataTable GetQuestion_AnswerRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			DataTable ObjDataTable= new DataTable();
			string strsql ="select * from Question_Answer";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlDataAdapter ObjAdapter = new SqlDataAdapter(strsql,ObjConnection);
			ObjAdapter.Fill(ObjDataTable);
			ObjAdapter.Dispose();
			ObjConnection.Dispose();
			return ObjDataTable;
        }
        
        public void Update() {
			string strsql= "update Question_Answer set " + "QuestionId= " + QuestionId + ", " + "AnswerId= " + AnswerId + " " + " where ID ="  + Id ;
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
        }
        
        public static void DeleteQuestion_AnswerRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			DataTable ObjDataTable= new DataTable();
			string strsql ="delete from Question_Answer";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjCommand.Dispose();
			ObjConnection.Dispose();
        }
    }
}
