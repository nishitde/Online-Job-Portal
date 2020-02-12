<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewJobPost.master" AutoEventWireup="true" CodeFile="ViewRequirements.aspx.cs" Inherits="JobPost_ViewRequirements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">Job Requirement</span>&nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="LnkBtnEditJobRequirements" OnClick="LnkBtnEditJobRequirements_Click" CssClass="h4 glyphicon glyphicon-pencil"></asp:LinkButton>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Education : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblEducation" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Experience : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblExperience" Text="example 1" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-2">
            <span class="h4">Skills : <asp:LinkButton runat="server" ID="LnkBtnAddSkillModal" OnClick="LnkBtnAddSkillModal_Click" Visible="false" ToolTip="Add more skills" CssClass="glyphicon glyphicon-plus-sign"></asp:LinkButton></span>
        </div>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" DataKeyNames="Id,SkillId" OnRowDataBound="GridViewSkills_RowDataBound" HeaderStyle-BackColor="#344154" Font-Size="Large" AlternatingRowStyle-BackColor="#cccccc" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" ID="GridViewSkills" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Skill Name" DataField="SkillId" />
                <asp:TemplateField Visible="false">
                     <ItemTemplate>
                         <asp:LinkButton runat="server" CausesValidation="false" OnClick="LnkBtnDeleteSkill_Click" ID="LnkBtnDeleteSkill" CssClass="glyphicon glyphicon-trash" ></asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <!-- Add Skill To Job Post Modal -->
  <div runat="server" class="modal show" id="AddSkillToJobPostModal" visible="false" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Add Required Skills To Job Post</h4>
        </div>
        <div class="modal-body">
          <div class="row">
              <h5>Skill Type</h5>&nbsp;&nbsp;<asp:LinkButton runat="server" ID="LnkBtnAddSkillType" CausesValidation="false" CssClass="glyphicon glyphicon-plus-sign" OnClick="LnkBtnAddSkillType_Click" ToolTip="Add another Skill Type"></asp:LinkButton>
              <asp:DropDownList runat="server" ValidationGroup="AddSkillToJobPost" AutoPostBack="true" OnSelectedIndexChanged="DdlSkillType_SelectedIndexChanged" DataTextField="SkillTypeName" DataValueField="Id" ID="DdlSkillType" CssClass="form-control"></asp:DropDownList>
              <asp:RequiredFieldValidator runat="server" ID="ReqDdlSkillType" ValidationGroup="AddSkillToJobPost" InitialValue="--Select--" ControlToValidate="DdlSkillType" ErrorMessage="Please select Skill Type" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
          </div>
            <br />
            <div class="row">
              <h5>Select Skills</h5>&nbsp;&nbsp;<asp:LinkButton runat="server" ID="LnkBtnAddSkill" CausesValidation="false" CssClass="glyphicon glyphicon-plus-sign" OnClick="LnkBtnAddSkill_Click" ToolTip="Add another Skill"></asp:LinkButton><br />
              <asp:CheckBoxList runat="server" ID="ChkLstSkills" ValidationGroup="AddSkillToJobPost" DataTextField="SkillName" DataValueField="Id" RepeatLayout="Flow" RepeatDirection="Horizontal" RepeatColumns="5"></asp:CheckBoxList>
              <br />
                <asp:Label runat="server" ID="LblSelectCheckBoxError" Visible="false" Text="Please select atleast one Skill" CssClass="text-danger"></asp:Label>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" ID="BtnAddSkills" ValidationGroup="AddSkillToJobPost" OnClick="BtnAddSkills_Click" Text="Add Skills" CssClass="btn btn-primary" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddSkillModal" Text="Close" CausesValidation="false" OnClick="lnkBtnCloseAddSkillModal_Click" CssClass="btn btn-default"></asp:LinkButton>
        </div>
      </div>
      
    </div>
  </div>
        <!-- Add Skill Type Modal -->
    <div runat="server" class="modal show" id="AddSkillTypeModal" visible="false" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Add Skill Type</h4>
        </div>
        <div class="modal-body">
          <div class="row">
              <h5>Skill Type Name :</h5>
              <asp:TextBox runat="server" ID="TxtSkillType" CssClass="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ValidationGroup="AddSkillType" ControlToValidate="TxtSkillType" ErrorMessage="Please specify Skill Type Name" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
              <asp:Label runat="server" ID="LblDuplicateSkillType" Text="A duplicate Skill Type already exists" Visible="false" CssClass="text-danger"></asp:Label>
          </div>
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" ID="BtnAddSkiilType" OnClick="AddSkiilType_Click" ValidationGroup="AddSkillType" Text="Add Skill Type" CssClass="btn btn-primary" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddSkillTypeModal" Text="Close" OnClick="CloseAddSkillTypeModal_Click" CausesValidation="false" CssClass="btn btn-default"></asp:LinkButton>
        </div>
      </div>
      
    </div>
  </div>
    <!-- Add Skill to database Modal -->
    <div runat="server" class="modal show" id="AddSkillModal" visible="false" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Add Skill</h4>
        </div>
        <div class="modal-body">
          <div class="row">
              <h5>Skill Type</h5>
              <asp:DropDownList runat="server" ValidationGroup="AddSkill" AutoPostBack="true" OnSelectedIndexChanged="DdlSkillType_SelectedIndexChanged" DataTextField="SkillTypeName" DataValueField="Id" ID="DdlSkillTypeInAddSkill" CssClass="form-control"></asp:DropDownList>
              <asp:RequiredFieldValidator runat="server" ID="ReqDdlSkillTypeInAddSkill" ValidationGroup="AddSkill" InitialValue="--Select--" ControlToValidate="DdlSkillTypeInAddSkill" ErrorMessage="Please select Skill Type" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
          </div>
            <br />
            <div class="row">
              <h5>Skills Name</h5>
              <asp:TextBox runat="server" ID="TxtSkillNameInAddSkill" ValidationGroup="AddSkill" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="ReqSkillNameInAddSkill" ValidationGroup="AddSkill" ControlToValidate="TxtSkillNameInAddSkill" ErrorMessage="Please specify Skill Name" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label runat="server" ID="LblDuplicateSkillName" Text="A duplicate Skill Name already exists for this Skill Type" CssClass="text-danger" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" ID="BtnAddSkillToDatabase" ValidationGroup="AddSkill" OnClick="BtnAddSkillToDatabase_Click" Text="Add Skills" CssClass="btn btn-primary" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddSkillModalDatabase" Text="Close" OnClick="LnkBtnCloseAddSkillModalDatabase_Click" CausesValidation="false" CssClass="btn btn-default"></asp:LinkButton>
        </div>
      </div>
      
    </div>
  </div>
</asp:Content>

