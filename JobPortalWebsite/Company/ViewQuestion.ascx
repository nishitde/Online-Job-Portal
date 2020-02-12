<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewQuestion.ascx.cs" Inherits="Company_ViewQuestion" %>

<div class="panel panel-primary">
    <div class="panel-heading" style="height:65px">
        <span class="h3">Qusetion:&nbsp;</span><asp:Label runat="server" CssClass="h4" ID="LblQuestion"></asp:Label>
        <asp:LinkButton runat="server" ID="LnkBtnAnswer"  Text="Answer this Question" OnClick="LnkBtnAnswer_Click" CssClass="pull-right h4 btn btn-default"></asp:LinkButton>
    </div>
    <div class="panel-body">
        <span class="h3">Answer:&nbsp;</span><asp:Label runat="server" CssClass="h4" ID="LblAnswer"></asp:Label>
    </div>
    <!-- Add Answer Modal -->
    <div runat="server" id="DivAddAnswerModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">   
        <h4 class="modal-title">Answer this Answer</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-xs-12">
        <h5>Answer</h5>
        <asp:TextBox runat="server" ID="TxtAnswer" Height="70" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="ReqAnswer" ErrorMessage="Please Specify Answer" Display="Dynamic" ControlToValidate="TxtAnswer" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
     </div>
    <br />
    
      </div>
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnAddAnswer" Text="Add This Answer" CausesValidation="true" OnClick="BtnAddAnswer_Click" CssClass="btn btn-primary"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseAddAnswerModal" CssClass="btn btn-default" CausesValidation="false" OnClick="LnkBtnCloseAddAnswerModal_Click" Text="Close"></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</div>