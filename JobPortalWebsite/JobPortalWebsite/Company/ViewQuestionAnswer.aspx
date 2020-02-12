<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewCompany.master" AutoEventWireup="true" CodeFile="ViewQuestionAnswer.aspx.cs" Inherits="Company_ViewQuestionAnswer" %>
<%@ Register Src="~/Company/ViewQuestion.ascx" TagPrefix="uc1" TagName="ViewQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <span class="pull-right"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;<asp:LinkButton runat="server" ID="LnkBtnAddQuestion" Font-Size="Medium" Font-Underline="true" Text="Ask a Question" OnClick="LnkBtnAddQuestion_Click"></asp:LinkButton></span>
    </div>
    <div class="row">
        <!--<span class="pull-right"><span class="glyphicon glyphicon-check"></span>&nbsp;<asp:LinkButton runat="server" ID="LnkBtnAnswer" Font-Size="Medium" Font-Underline="true" Text="Answer a Question"></asp:LinkButton></span>-->
    </div>
    <div class="row">
        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
    </div>
    <!-- Add Question Modal -->
    <div runat="server" id="DivAddQuestionModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">   
        <h4 class="modal-title">Add a Question</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-xs-12">
        <label>Question</label>
        <asp:TextBox runat="server" ID="TxtQuestion" Height="70" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="ReqQuestion" ErrorMessage="Please Specify Question" Display="Dynamic" ControlToValidate="TxtQuestion" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
     </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <label>Related To</label>
            <asp:DropDownList runat="server" ID="DdlRelatedTo" CssClass="form-control">
                <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                <asp:ListItem Text="Job" Value="Job"></asp:ListItem>
                <asp:ListItem Text="Company" Value="Company"></asp:ListItem>
                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="ReqDdlRelatedTo" ControlToValidate="DdlRelatedTo" Display="Dynamic" InitialValue="--Select--" CssClass="text-danger" ErrorMessage="Please select a value"></asp:RequiredFieldValidator>
        </div>
    </div>
      </div>
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnAddQuestion" Text="Add This Question" CausesValidation="true" OnClick="BtnAddQuestion_Click" CssClass="btn btn-default"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddQuestionModal" CssClass="btn btn-default" OnClick="LnkBtnCloseAddQuestionModal_Click" Text="Close"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>