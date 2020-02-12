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
    
    
    public class JobPost_InterviewProcess {
        
        private Int32 _Id;
        
        private Int32 _JobPostId;
        
        private String _AptitudeTest;
        
        private Int32 _NumberOfAptitudeTests;
        
        private String _GroupDiscussion;
        
        private Int32 _NumberOfGDs;
        
        private String _TechnicalRound;
        
        private Int32 _NumberOfTechnicalRounds;
        
        private String _PersonalInterview;
        
        private Int32 _NumberOfPersonalInterviews;
        
        public JobPost_InterviewProcess(int ID) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand("select * from JobPost_InterviewProcess where ID = " + ID , ObjConnection);
			SqlDataReader ObjReader = ObjCommand.ExecuteReader();
			ObjReader.Read();
			if(ObjReader["Id"] != DBNull.Value)
				Id = (int)ObjReader["Id"];
			if(ObjReader["JobPostId"] != DBNull.Value)
				JobPostId = (int)ObjReader["JobPostId"];
			if(ObjReader["AptitudeTest"] != DBNull.Value)
				AptitudeTest = (string)ObjReader["AptitudeTest"];
			if(ObjReader["NumberOfAptitudeTests"] != DBNull.Value)
				NumberOfAptitudeTests = (int)ObjReader["NumberOfAptitudeTests"];
			if(ObjReader["GroupDiscussion"] != DBNull.Value)
				GroupDiscussion = (string)ObjReader["GroupDiscussion"];
			if(ObjReader["NumberOfGDs"] != DBNull.Value)
				NumberOfGDs = (int)ObjReader["NumberOfGDs"];
			if(ObjReader["TechnicalRound"] != DBNull.Value)
				TechnicalRound = (string)ObjReader["TechnicalRound"];
			if(ObjReader["NumberOfTechnicalRounds"] != DBNull.Value)
				NumberOfTechnicalRounds = (int)ObjReader["NumberOfTechnicalRounds"];
			if(ObjReader["PersonalInterview"] != DBNull.Value)
				PersonalInterview = (string)ObjReader["PersonalInterview"];
			if(ObjReader["NumberOfPersonalInterviews"] != DBNull.Value)
				NumberOfPersonalInterviews = (int)ObjReader["NumberOfPersonalInterviews"];
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
        
        public virtual String AptitudeTest {
            get {
				return _AptitudeTest;
            }
            set {
				_AptitudeTest = value;
            }
        }
        
        public virtual Int32 NumberOfAptitudeTests {
            get {
				return _NumberOfAptitudeTests;
            }
            set {
				_NumberOfAptitudeTests = value;
            }
        }
        
        public virtual String GroupDiscussion {
            get {
				return _GroupDiscussion;
            }
            set {
				_GroupDiscussion = value;
            }
        }
        
        public virtual Int32 NumberOfGDs {
            get {
				return _NumberOfGDs;
            }
            set {
				_NumberOfGDs = value;
            }
        }
        
        public virtual String TechnicalRound {
            get {
				return _TechnicalRound;
            }
            set {
				_TechnicalRound = value;
            }
        }
        
        public virtual Int32 NumberOfTechnicalRounds {
            get {
				return _NumberOfTechnicalRounds;
            }
            set {
				_NumberOfTechnicalRounds = value;
            }
        }
        
        public virtual String PersonalInterview {
            get {
				return _PersonalInterview;
            }
            set {
				_PersonalInterview = value;
            }
        }
        
        public virtual Int32 NumberOfPersonalInterviews {
            get {
				return _NumberOfPersonalInterviews;
            }
            set {
				_NumberOfPersonalInterviews = value;
            }
        }
        
        public static Int32 AddJobPost_InterviewProcess(Int32 JobPostId, String AptitudeTest, Int32 NumberOfAptitudeTests, String GroupDiscussion, Int32 NumberOfGDs, String TechnicalRound, Int32 NumberOfTechnicalRounds, String PersonalInterview, Int32 NumberOfPersonalInterviews) {
			string strsql = "insert into JobPost_InterviewProcess output inserted.id values(" + JobPostId + "," + "'"+ AptitudeTest.Replace("'","''") + "'," + NumberOfAptitudeTests + "," + "'"+ GroupDiscussion.Replace("'","''") + "'," + NumberOfGDs + "," + "'"+ TechnicalRound.Replace("'","''") + "'," + NumberOfTechnicalRounds + "," + "'"+ PersonalInterview.Replace("'","''") + "'," + NumberOfPersonalInterviews + ")"; 
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			int NewID = (int) ObjCommand.ExecuteScalar();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
			return NewID;
        }
        
        public static DataTable GetJobPost_InterviewProcessRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			DataTable ObjDataTable= new DataTable();
			string strsql ="select * from JobPost_InterviewProcess";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlDataAdapter ObjAdapter = new SqlDataAdapter(strsql,ObjConnection);
			ObjAdapter.Fill(ObjDataTable);
			ObjAdapter.Dispose();
			ObjConnection.Dispose();
			return ObjDataTable;
        }
        
        public void Update() {
			string strsql= "update JobPost_InterviewProcess set " + "JobPostId= " + JobPostId + ", " + "AptitudeTest= '" + AptitudeTest.Replace("'","''") + "', " + "NumberOfAptitudeTests= " + NumberOfAptitudeTests + ", " + "GroupDiscussion= '" + GroupDiscussion.Replace("'","''") + "', " + "NumberOfGDs= " + NumberOfGDs + ", " + "TechnicalRound= '" + TechnicalRound.Replace("'","''") + "', " + "NumberOfTechnicalRounds= " + NumberOfTechnicalRounds + ", " + "PersonalInterview= '" + PersonalInterview.Replace("'","''") + "', " + "NumberOfPersonalInterviews= " + NumberOfPersonalInterviews + " " + " where ID ="  + Id ;
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
        }
        
        public static void DeleteJobPost_InterviewProcessRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			DataTable ObjDataTable= new DataTable();
			string strsql ="delete from JobPost_InterviewProcess";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjCommand.Dispose();
			ObjConnection.Dispose();
        }
    }
}
