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
    
    
    public class State {
        
        private Int32 _Id;
        
        private String _StateName;
        
        private Int32 _CountryId;
        
        private String _Status;
        
        public State(int ID) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand("select * from State where ID = " + ID , ObjConnection);
			SqlDataReader ObjReader = ObjCommand.ExecuteReader();
			ObjReader.Read();
			if(ObjReader["Id"] != DBNull.Value)
				Id = (int)ObjReader["Id"];
			if(ObjReader["StateName"] != DBNull.Value)
				StateName = (string)ObjReader["StateName"];
			if(ObjReader["CountryId"] != DBNull.Value)
				CountryId = (int)ObjReader["CountryId"];
			if(ObjReader["Status"] != DBNull.Value)
				Status = (string)ObjReader["Status"];
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
        
        public virtual String StateName {
            get {
				return _StateName;
            }
            set {
				_StateName = value;
            }
        }
        
        public virtual Int32 CountryId {
            get {
				return _CountryId;
            }
            set {
				_CountryId = value;
            }
        }
        
        public virtual String Status {
            get {
				return _Status;
            }
            set {
				_Status = value;
            }
        }
        
        public static Int32 AddState(String StateName, Int32 CountryId, String Status) {
			string strsql = "insert into State output inserted.id values(" + "'"+ StateName.Replace("'","''") + "'," + CountryId + "," + "'"+ Status.Replace("'","''") + "'" + ")"; 
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			int NewID = (int) ObjCommand.ExecuteScalar();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
			return NewID;
        }
        
        public static DataTable GetStateRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			DataTable ObjDataTable= new DataTable();
			string strsql ="select * from State";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
            //throw new Exception(strsql);
            SqlDataAdapter ObjAdapter = new SqlDataAdapter(strsql,ObjConnection);
			ObjAdapter.Fill(ObjDataTable);
			ObjAdapter.Dispose();
			ObjConnection.Dispose();
			return ObjDataTable;
        }
        
        public void Update() {
			string strsql= "update State set " + "StateName= '" + StateName.Replace("'","''") + "', " + "CountryId= " + CountryId + ", " + "Status= '" + Status.Replace("'","''") + "' " + " where ID ="  + Id ;
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
        }
        
        public static void DeleteStateRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			DataTable ObjDataTable= new DataTable();
			string strsql ="delete from State";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjCommand.Dispose();
			ObjConnection.Dispose();
        }
    }
}
