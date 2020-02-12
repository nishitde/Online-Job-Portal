<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="CityList.aspx.cs" Inherits="City_CityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">List of City</span>
            <span class="pull-right"><a href="NewCity.aspx">Add a New City</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>City Name Like</label>
            <asp:TextBox runat="server" ID="TxtCityName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <label>Country </label>
            <asp:DropDownList runat="server" ID="DdlCountry" AutoPostBack="true" OnSelectedIndexChanged="DdlCountry_SelectedIndexChanged" CssClass="form-control" DataTextField="CountryName" DataValueField="Id"></asp:DropDownList>
        </div>
        <div class="col-xs-3">
            <label>State</label>
            <asp:DropDownList runat="server" ID="DdlState" CssClass="form-control" DataTextField="StateName" DataValueField="Id"></asp:DropDownList>
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
                    <asp:Button runat="server" ID="BtnGo" CssClass="btn btn-default" OnClick="BtnGo_Click" Text="Go" />
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
                <asp:BoundField HeaderText="City" DataField="CityName" />
                <asp:BoundField HeaderText="State" DataField="StateId" />
                <asp:BoundField HeaderText="Country" DataField="CountryId" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="LnkBtnEditCity" OnClick="LnkBtnEditCity_Click" CssClass="glyphicon glyphicon-pencil h4"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </div>
              
    </div>
    <asp:HiddenField runat="server" ID="HdnCityId" />

    <!-- Edit City Modal -->
    <div runat="server" id="EditCityModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Edit City</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        <label>City Name</label>
        <asp:TextBox runat="server" ID="TxtCityNameEdit" ValidationGroup="EditCity" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ValidationGroup="EditCity" ID="ReqCityName" ErrorMessage="Please Specify City Name" Display="Dynamic" ControlToValidate="TxtCityNameEdit" CssClass="text-danger"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="LblDuplicateCityNameErrorEdit" CssClass="text-danger" Text="This City already exists in database" Visible="false"></asp:Label>
     </div>
          <div class="row">
            <label>Country</label>
            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlCountryEdit_SelectedIndexChanged" ID="DdlCountryEdit" DataTextField="CountryName" DataValueField="Id" ValidationGroup="EditCity" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="ReqCountryEdit" ControlToValidate="DdlCountryEdit" ErrorMessage="Please select a country" ValidationGroup="EditCity" InitialValue="--Select--" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
          <div class="row">
            <label>State</label>
            <asp:DropDownList runat="server" ID="DdlStateEdit" DataTextField="StateName" DataValueField="Id" ValidationGroup="EditCity" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="ReqStateEdit" ControlToValidate="DdlStateEdit" ErrorMessage="Please select a state" ValidationGroup="EditCity" InitialValue="--Select--" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <label>Status</label>
            <asp:DropDownList runat="server" ID="DdlStatusEdit" ValidationGroup="EditCity" CssClass="form-control">
                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
            </asp:DropDownList>
        </div>
          
        </div>   
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnUpdateCity" Text="Update this City" ValidationGroup="EditCity" CausesValidation="true" OnClick="BtnUpdateCity_Click" CssClass="btn btn-default"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseCity" CssClass="btn btn-default" CausesValidation="false" Text="Close" OnClick="LnkBtnCloseCity_Click"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>