<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="CountryList.aspx.cs" Inherits="Country_CountryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">List of Country</span>
            <span class="pull-right"><a href="NewCountry.aspx">Add a New Country</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Country Name Like</label>
            <asp:TextBox runat="server" ID="TxtCountryName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <label>Filter by Status</label>
            <asp:DropDownList runat="server" ID="DdlStatus" CssClass="form-control">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
        </div>
                <div class="col-xs-3">
              <label>&nbsp;</label>      <br />
                    <asp:Button OnClick="BtnGo_Click" runat="server" ID="BtnGo" CssClass="btn btn-default" Text="Go" />
                    </div>
    </div>
   <br />
    <div class="row">
        <div class="col-xs-12 text-center">
        Number of Records: <asp:Label runat="server" ID="LblNumberOfRecords"></asp:Label>
            <br />
            <asp:Label runat="server" ID="LblMessage" Visible="true" CssClass="text-success"></asp:Label>
            </div>
    </div>
      <div class="row">
        <div class="col-xs-12">
        <asp:GridView AutoGenerateColumns="false" DataKeyNames="Id" runat="server" ID="GridView1" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="Country" DataField="CountryName" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" OnClick="LnkBtnEditCountry_Click" ID="LnkBtnEditCountry" CssClass="glyphicon glyphicon-pencil h4"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </div>
              
    </div>
    <asp:HiddenField runat="server" ID="HdnCountryId" />

    <!-- Edit Country Modal -->
    <div runat="server" id="EditCountryModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Edit Country</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        <label>Country Name</label>
        <asp:TextBox runat="server" ID="TxtCountryNameEdit" ValidationGroup="EditCountry" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="EditCountry" ID="ReqCountryName" ErrorMessage="Please Specify Country Name" Display="Dynamic" ControlToValidate="TxtCountryNameEdit" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateCountryNameError" CssClass="text-danger" Text="This Country already exists in database" Visible="false"></asp:Label>
     </div>
        <div class="row">
            <label>Status</label>
            <asp:DropDownList runat="server" ID="DdlStatusEdit" ValidationGroup="EditCountry" CssClass="form-control">
                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
            </asp:DropDownList>
        </div>
          
        </div>   
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnUpdateCountry" Text="Update this Country" ValidationGroup="EditCountry" CausesValidation="true" CssClass="btn btn-default" OnClick="BtnUpdateCountry_Click"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseCountry" CssClass="btn btn-default" CausesValidation="false" Text="Close" OnClick="LnkBtnCloseCountry_Click"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>