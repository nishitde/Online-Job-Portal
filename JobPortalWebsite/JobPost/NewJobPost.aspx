<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="NewJobPost.aspx.cs" Inherits="JobPost_NewJobPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <span class="h3" style="color:#344154;text-transform:uppercase">Add a new Job Post</span>
            <span class="pull-right"><a href="JobPostList.aspx" class="btn btn-info">Back to the List of Job Post</a></span>
        </div>
    </div>
    <br />
                        <div class="row">
                            <div class="col-xs-12">
                                <span class="h3">Step 1: Enter Job Details</span>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                           <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Job Title</h5>
                                 </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:TextBox runat="server" ID="TxtJobTitle" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="ReqJobTitle" ControlToValidate="TxtJobTitle" Display="Dynamic" ErrorMessage="Please specify Job Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:Label runat="server" ID="LblDuplicateJobTitleError" Text="This Job Title already exists" CssClass="text-danger" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Company</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:DropDownList runat="server" ID="DdlCompany" AutoPostBack="true" OnSelectedIndexChanged="DdlCompany_SelectedIndexChanged" DataTextField="CompanyName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="ReqCompany" ControlToValidate="DdlCompany" Display="Dynamic" ErrorMessage="Please select a Company" InitialValue="--Select--" CssClass="text-danger"></asp:RequiredFieldValidator>
                                 </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Branches</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:CheckBoxList runat="server" ID="ChkLstBranches" CssClass="h4 checkbox" DataTextField="BranchName" DataValueField="Id" RepeatLayout="Flow" RepeatDirection="Horizontal" RepeatColumns="4"></asp:CheckBoxList>
                                    <asp:Label runat="server" ID="LblSelectBranchError" CssClass="text-danger" Text="Please select Branches" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Department</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:DropDownList runat="server" ID="DdlDepartment" DataTextField="DepartmentName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="ReqDepartment" CssClass="text-danger" ControlToValidate="DdlDepartment" InitialValue="--Select--" ErrorMessage="Please select Department" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                         <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Designation</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:DropDownList runat="server" ID="DdlDesignation" DataTextField="DesignationName" DataValueField="Id" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="ReqDesignation" CssClass="text-danger" ControlToValidate="DdlDesignation" InitialValue="--Select--" ErrorMessage="Please select Designation" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                             </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Job Type</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:RadioButtonList runat="server" CssClass="h4" ID="BtnLstJobType" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True" Text="&nbsp;Full Time&nbsp;&nbsp;&nbsp;" Value="FullTime"></asp:ListItem>
                                        <asp:ListItem Text="&nbsp;Part Time&nbsp;&nbsp;&nbsp;" Value="PartTime"></asp:ListItem>
                                        <asp:ListItem Text="&nbsp;Both&nbsp;&nbsp;&nbsp;" Value="Both"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Applicable To</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:RadioButtonList runat="server" CssClass="h4" ID="BtnLstGender" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True" Text="&nbsp;Male&nbsp;&nbsp;&nbsp;" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="&nbsp;Female&nbsp;&nbsp;&nbsp;" Value="Female"></asp:ListItem>
                                        <asp:ListItem Text="&nbsp;All&nbsp;&nbsp;&nbsp;" Value="All"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Salary Package</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <asp:TextBox runat="server" ID="TxtMinSalary" Placeholder="Min Salary Package" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="ReqMinSalary" SetFocusOnError="true" ControlToValidate="TxtMinSalary" Display="Dynamic" ErrorMessage="Please specify Min Salary Package" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server" ID="CmpMinSalary" ControlToValidate="TxtMinSalary" Display="Dynamic" ErrorMessage="Salary must be Numeric" CssClass="text-danger" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        <asp:CompareValidator ID="CmpSalaryCheck" runat="server" ErrorMessage="Min salary cannot be Greater than Max salary" ControlToValidate="TxtMinSalary" ControlToCompare="TxtMaxSalary" CssClass="text-danger" Display="Dynamic" Type="Integer" SetFocusOnError="true" Operator="LessThanEqual"></asp:CompareValidator>
                                    </div>
                                   <div class="col-xs-12 col-sm-6">
                                        <asp:TextBox runat="server" ID="TxtMaxSalary" Placeholder="Max Salary Package" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="ReqMaxSalary" SetFocusOnError="true" ControlToValidate="TxtMaxSalary" Display="Dynamic" ErrorMessage="Please specify Max Salary Package" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server" ID="CmpMaxSalary" ControlToValidate="TxtMaxSalary" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Salary must be Numeric" CssClass="text-danger" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Job Description</h5>
                                 </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:TextBox runat="server" ID="TxtJobDescription" TextMode="MultiLine" Height="400" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="ReqJobDescription" ControlToValidate="TxtJobDescription" Display="Dynamic" ErrorMessage="Please specify Job Description" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="divider"></div>
                        <div class="row">
                            <div class="col-xs-12">
                                <span class="h3">Step 2: Enter Requirements</span>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Required Education </h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:DropDownList runat="server" ID="DdlDegree" DataValueField="Id" DataTextField="DegreeName" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="ReqDegree" ControlToValidate="DdlDegree" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please select Required Experience" InitialValue="--Select--" CssClass="text-danger"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Required Experience</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:DropDownList runat="server" ID="DdlExperience" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="ReqExperience" ControlToValidate="DdlExperience" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please select Required Experience" InitialValue="--Select--" CssClass="text-danger"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                        <h5>Required Skills</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <asp:LinkButton runat="server" ID="LnkBtnAddSkillModel" Text="Add Skills  " OnClick="LnkBtnAddSkillModel_Click" CssClass="pull-right btn btn-info" CausesValidation="false"></asp:LinkButton>
                                </div>
                                
                                <div class="table-responsive">
                                    <asp:GridView runat="server" HeaderStyle-BackColor="#344154" Font-Size="Large" AlternatingRowStyle-BackColor="#cccccc" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" DataKeyNames="Id" ID="GridViewSkills" OnRowDataBound="GridViewSkills_RowDataBound" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">
                                        <Columns>
                                            <asp:BoundField HeaderText="Skill Name" DataField="SkillId" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" CausesValidation="false" ID="LnkBtnDeleteSkill" CssClass="glyphicon glyphicon-trash" OnClick="LnkBtnDeleteSkill_Click"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                               
                            </div>
                        </div>
                        <div class="divider"></div>
                        <div class="row">
                            <div class="col-xs-12">
                                <span class="h3">Step 3: Interview Process</span>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Aptitude Test</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <asp:DropDownList runat="server" ID="DdlAptitude" CssClass="form-control">
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                   <div class="col-xs-12 col-sm-6">
                                        <asp:TextBox runat="server" ID="TxtNumberOfAptitude" Text="0" ToolTip="Number Of Aptitude Tests" Placeholder="Number Of Aptitude Tests" CssClass="form-control"></asp:TextBox>
                                       <asp:Label runat="server" ID="LblNumberOfAptitudeError" Text="Please specify Number Of Aptitude" Visible="false" CssClass="text-danger"></asp:Label>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Group Discussion</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <asp:DropDownList runat="server" ID="DdlGD" CssClass="form-control">
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                   <div class="col-xs-12 col-sm-6">
                                        <asp:TextBox runat="server" ID="TxtNumberOfGD" Text="0" ToolTip="Number Of Group Discussions" Placeholder="Number Of GD's" CssClass="form-control"></asp:TextBox>
                                       <asp:Label runat="server" ID="LblNumberOfGDError" Text="Please specify Number Of Group Discussion" Visible="false" CssClass="text-danger"></asp:Label>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Technical Round</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <asp:DropDownList runat="server" ID="DdlTechnical" CssClass="form-control">
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                   <div class="col-xs-12 col-sm-6">
                                        <asp:TextBox runat="server" ID="TxtNumberOfTechnical" Text="0" ToolTip="Number Of Technical Rounds" Placeholder="Number Of Technical Rounds" CssClass="form-control"></asp:TextBox>
                                       <asp:Label runat="server" ID="LblNumberOfTechnicalError" Text="Please specify Number Of Technical Round" Visible="false" CssClass="text-danger"></asp:Label>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-12 col-sm-3">
                                    <h5>Personal Interview</h5>
                                </div>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="row">
                                    <div class="col-xs-12 col-sm-6">
                                        <asp:DropDownList runat="server" ID="DdlPersonalInterview" CssClass="form-control">
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                   <div class="col-xs-12 col-sm-6">
                                        <asp:TextBox runat="server" ID="TxtNumberOfInterviews" Text="0" ToolTip="Number Of Interviews" Placeholder="Number Of Interviews" CssClass="form-control"></asp:TextBox>
                                       <asp:Label runat="server" ID="LblNumberOfInteviewsError" Text="Please specify Number Of Interviews" Visible="false" CssClass="text-danger"></asp:Label>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <asp:Button runat="server" ID="BtnAdJobPost" Text="Add This Job Post" OnClick="BtnAdJobPost_Click" CssClass="btn btn-primary" />
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