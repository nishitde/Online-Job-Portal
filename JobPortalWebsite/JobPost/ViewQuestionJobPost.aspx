<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewJobPost.master" AutoEventWireup="true" CodeFile="ViewQuestionJobPost.aspx.cs" Inherits="JobPost_ViewQuestionJobPost" %>

<%@ Register Src="~/JobPost/ViewQuestion.ascx" TagPrefix="uc1" TagName="ViewQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">View Question regarding Job Post</span>
            <asp:LinkButton runat="server" ID="LnkBtnAddQuestion" Text="Ask a Question" OnClick="LnkBtnAddQuestion_Click" CssClass="btn btn-info pull-right"></asp:LinkButton>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
        </div>
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
        <h5>Question</h5>
        <asp:TextBox runat="server" ID="TxtQuestion" Height="70" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="ReqQuestion" ErrorMessage="Please Specify Question" Display="Dynamic" ControlToValidate="TxtQuestion" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
     </div>
    <br />
   
      </div>
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnAddQuestion" Text="Add This Question" CausesValidation="true" OnClick="BtnAddQuestion_Click" CssClass="btn btn-primary"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddQuestionModal" CssClass="btn btn-default" CausesValidation="false" OnClick="LnkBtnCloseAddQuestionModal_Click" Text="Close"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>