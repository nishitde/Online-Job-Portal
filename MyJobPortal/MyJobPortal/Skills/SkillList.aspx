<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="SkillList.aspx.cs" Inherits="Skills_SkillList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3">List of Skill</span>
            <span class="pull-right"><a href="NewSkill.aspx">Add a New Skill</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <label>Skill Name Like</label>
            <asp:TextBox runat="server" ID="TxtSkillName" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <label>SkillType like</label>
            <asp:DropDownList runat="server" ID="DdlSkillType" CssClass="form-control" DataTextField="SkillTypeName" DataValueField="Id"></asp:DropDownList>
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
                <asp:BoundField HeaderText="Skill" DataField="SkillName" />
                <asp:BoundField HeaderText="Skill Type" DataField="SkillTypeId" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
                <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="EditSkill.aspx?ID={0}" />
            </Columns>
        </asp:GridView>
            </div>
              
    </div>
</asp:Content>