<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="StateList.aspx.cs" Inherits="State_StateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">List of State</span>
            <span class="pull-right"><a href="NewState.aspx">Add a New State</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>State Name Like</label>
            <asp:TextBox runat="server" ID="TxtStateName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <label>Country like</label>
            <asp:DropDownList runat="server" ID="DdlCountry" CssClass="form-control" DataTextField="CountryName" DataValueField="Id"></asp:DropDownList>
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
        <asp:GridView AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="Id" runat="server" ID="GridView1" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="State" DataField="StateName" />
                <asp:BoundField HeaderText="Country" DataField="CountryId" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="LnkBtnEditState" OnClick="LnkBtnEditState_Click" CssClass="glyphicon glyphicon-pencil h4"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </div>
              
    </div>
    <asp:HiddenField runat="server" ID="HdnStateId" />

    <!-- Edit State Modal -->
    <div runat="server" id="EditStateModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Edit State</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        <label>State Name</label>
        <asp:TextBox runat="server" ID="TxtStateNameEdit" ValidationGroup="EditState" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="EditState" ID="ReqStateName" ErrorMessage="Please Specify State Name" Display="Dynamic" ControlToValidate="TxtStateNameEdit" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateStateNameErrorEdit" CssClass="text-danger" Text="This State already exists in database" Visible="false"></asp:Label>
     </div>
          <div class="row">
            <label>Country</label>
            <asp:DropDownList runat="server" ID="DdlCountryEdit" DataTextField="CountryName" DataValueField="Id" ValidationGroup="EditState" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="row">
            <label>Status</label>
            <asp:DropDownList runat="server" ID="DdlStatusEdit" ValidationGroup="EditState" CssClass="form-control">
                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
            </asp:DropDownList>
        </div>
          
        </div>   
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnUpdateState" Text="Update this State" ValidationGroup="EditState" CausesValidation="true" CssClass="btn btn-default" OnClick="BtnUpdateState_Click"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseState" CssClass="btn btn-default" CausesValidation="false" Text="Close" OnClick="LnkBtnCloseState_Click"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>