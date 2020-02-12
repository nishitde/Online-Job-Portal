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
    
    
    public class HiringManager {
        
        private Int32 _Id;
        
        private Int32 _CompanyId;
        
        private Int32 _BranchId;
        
        private Int32 _DepartmentId;
        
        private String _HiringManagerName;
        
        private String _EmailId;
        
        public HiringManager(int ID) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand("select * from HiringManager where ID = " + ID , ObjConnection);
			SqlDataReader ObjReader = ObjCommand.ExecuteReader();
			ObjReader.Read();
			if(ObjReader["Id"] != DBNull.Value)
				Id = (int)ObjReader["Id"];
			if(ObjReader["CompanyId"] != DBNull.Value)
				CompanyId = (int)ObjReader["CompanyId"];
			if(ObjReader["BranchId"] != DBNull.Value)
				BranchId = (int)ObjReader["BranchId"];
			if(ObjReader["DepartmentId"] != DBNull.Value)
				DepartmentId = (int)ObjReader["DepartmentId"];
			if(ObjReader["HiringManagerName"] != DBNull.Value)
				HiringManagerName = (string)ObjReader["HiringManagerName"];
			if(ObjReader["EmailId"] != DBNull.Value)
				EmailId = (string)ObjReader["EmailId"];
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
        
        public virtual Int32 CompanyId {
            get {
				return _CompanyId;
            }
            set {
				_CompanyId = value;
            }
        }
        
        public virtual Int32 BranchId {
            get {
				return _BranchId;
            }
            set {
				_BranchId = value;
            }
        }
        
        public virtual Int32 DepartmentId {
            get {
				return _DepartmentId;
            }
            set {
				_DepartmentId = value;
            }
        }
        
        public virtual String HiringManagerName {
            get {
				return _HiringManagerName;
            }
            set {
				_HiringManagerName = value;
            }
        }
        
        public virtual String EmailId {
            get {
				return _EmailId;
            }
            set {
				_EmailId = value;
            }
        }
        
        public static Int32 AddHiringManager(Int32 CompanyId, Int32 BranchId, Int32 DepartmentId, String HiringManagerName, String EmailId) {
			string strsql = "insert into HiringManager output inserted.id values(" + CompanyId + "," + BranchId + "," + DepartmentId + "," + "'"+ HiringManagerName.Replace("'","''") + "'," + "'"+ EmailId.Replace("'","''") + "'" + ")"; 
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			int NewID = (int) ObjCommand.ExecuteScalar();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
			return NewID;
        }
        
        public static DataTable GetHiringManagerRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			DataTable ObjDataTable= new DataTable();
			string strsql ="select * from HiringManager";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlDataAdapter ObjAdapter = new SqlDataAdapter(strsql,ObjConnection);
			ObjAdapter.Fill(ObjDataTable);
			ObjAdapter.Dispose();
			ObjConnection.Dispose();
			return ObjDataTable;
        }
        
        public void Update() {
			string strsql= "update HiringManager set " + "CompanyId= " + CompanyId + ", " + "BranchId= " + BranchId + ", " + "DepartmentId= " + DepartmentId + ", " + "HiringManagerName= '" + HiringManagerName.Replace("'","''") + "', " + "EmailId= '" + EmailId.Replace("'","''") + "' " + " where ID ="  + Id ;
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjConnection.Dispose();
			ObjCommand.Dispose();
        }
        
        public static void DeleteHiringManagerRecords(string WhereClause) {
			SqlConnection ObjConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyJobPortal"].ConnectionString);
			ObjConnection.Open();
			DataTable ObjDataTable= new DataTable();
			string strsql ="delete from HiringManager";
			if(WhereClause != String.Empty) strsql= strsql + " where " + WhereClause;
			SqlCommand ObjCommand = new SqlCommand(strsql,ObjConnection);
			ObjCommand.ExecuteNonQuery();
			ObjCommand.Dispose();
			ObjConnection.Dispose();
        }
    }
}
