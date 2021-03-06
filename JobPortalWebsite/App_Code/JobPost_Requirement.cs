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
    
    
    public class JobPost_Requirement {
        
        private Int32 _Id;
        
        private Int32 _JobPostId;
        
        private Int32 _RequiredEducationId;
        
        private Int32 _RequiredExperience;
        
        public JobPost_Requirement(int ID) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand("select * from JobPost_Requirement where ID = " + ID , ObjConnection);
			SqlDataReader ObjReader = ObjCommand.ExecuteReader();
			ObjReader.Read();
			if(ObjReader["Id"] != DBNull.Value)
				Id = (int)ObjReader["Id"];
			if(ObjReader["JobPostId"] != DBNull.Value)
				JobPostId = (int)ObjReader["JobPostId"];
			if(ObjReader["RequiredEducationId"] != DBNull.Value)
				RequiredEducationId = (int)ObjReader["RequiredEducationId"];
			if(ObjReader["RequiredExperience"] != DBNull.Value)
				RequiredExperience = (int)ObjReader["RequiredExperience"];
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
        
        public virtual Int32 JobPostId {
            get {
				return _JobPostId;
            }
            set {
				_JobPostId = value;
            }
        }
        
        public virtual Int32 RequiredEducationId {
            get {
				return _RequiredEducationId;
            }
            set {
				_RequiredEducationId = value;
            }
        }
        
        public virtual Int32 RequiredExperience {
            get {
				return _RequiredExperience;
            }
            set {
				_RequiredExperience = value;
            }
        }
        
        public static Int32 AddJobPost_Requirement(Int32 JobPostId, Int32 RequiredEducationId, Int32 RequiredExperience) {
			string strsql = "insert into JobPost_Requirement output inserted.id values(" + JobPostId + "," + RequiredEducationId + "," + RequiredExperience + ")"; 
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			int NewID = (int) ObjCommand.ExecuteScalar();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
			return NewID;
        }
        
        public static DataTable GetJobPost_RequirementRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			DataTable ObjDataTable= new DataTable();
			string strsql ="select * from JobPost_Requirement";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlDataAdapter ObjAdapter = new SqlDataAdapter(strsql,ObjConnection);
			ObjAdapter.Fill(ObjDataTable);
			ObjAdapter.Dispose();
			ObjConnection.Dispose();
			return ObjDataTable;
        }
        
        public void Update() {
			string strsql= "update JobPost_Requirement set " + "JobPostId= " + JobPostId + ", " + "RequiredEducationId= " + RequiredEducationId + ", " + "RequiredExperience= " + RequiredExperience + " " + " where ID ="  + Id ;
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
        }
        
        public static void DeleteJobPost_RequirementRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			DataTable ObjDataTable= new DataTable();
			string strsql ="delete from JobPost_Requirement";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjCommand.Dispose();
			ObjConnection.Dispose();
        }
    }
}
