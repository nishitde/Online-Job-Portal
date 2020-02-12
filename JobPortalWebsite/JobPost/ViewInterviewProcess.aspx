<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/ViewJobPost.master" AutoEventWireup="true" CodeFile="ViewInterviewProcess.aspx.cs" Inherits="JobPost_ViewInterviewProcess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <br />
    <div class="row">
        <div class="col-xs-12">
            <span class="h3">Interview Process</span>&nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="LnkBtnEditInteriewProcess" OnClick="LnkBtnEditInteriewProcess_Click" CssClass="h4 glyphicon glyphicon-pencil"></asp:LinkButton>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4" style="color:#f53157">Number Of Aptitude Tests : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfAptitude" ForeColor="DarkBlue" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4" style="color:#f53157">Number Of Technical Rounds : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfTechnical" ForeColor="DarkBlue" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4" style="color:#f53157">Number Of Group Discussions : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfGD" ForeColor="DarkBlue" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <span class="h4" style="color:#f53157">Number Of Interviews : </span>
        </div>
        <div class="col-xs-12 col-sm-6">
            <asp:Label runat="server" ID="LblNumberOfinterview" ForeColor="DarkBlue" Font-Bold="true" CssClass="h4"></asp:Label>
        </div>
    </div>
    <!-- Edit InterViewProcess Modal -->
    <div runat="server" id="EditInterViewProcessModal" class="modal show" visible="false" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Edit InterviewProcess</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        
        <h5>Number Of Aptitude Tests</h5>
        <asp:TextBox runat="server" ID="TxtNumberOfAptitude" Text="0" ToolTip="Number Of Aptitude Tests" Placeholder="Number Of Aptitude Tests" CssClass="form-control"></asp:TextBox>
        <asp:Label runat="server" ID="LblNumberOfAptitudeError" Text="Please specify Number Of Aptitude" Visible="false" CssClass="text-danger"></asp:Label>

     </div>
          <div class="row">
              <h5>Group Discussion</h5>
              <asp:TextBox runat="server" ID="TxtNumberOfGD" Text="0" ToolTip="Number Of Group Discussions" Placeholder="Number Of GD's" CssClass="form-control"></asp:TextBox>
              <asp:Label runat="server" ID="LblNumberOfGDError" Text="Please specify Number Of Group Discussion" Visible="false" CssClass="text-danger"></asp:Label>
          </div>
          <div class="row">
              <h5>Technical Round</h5>
                <asp:TextBox runat="server" ID="TxtNumberOfTechnical" Text="0" ToolTip="Number Of Technical Rounds" Placeholder="Number Of Technical Rounds" CssClass="form-control"></asp:TextBox>
                <asp:Label runat="server" ID="LblNumberOfTechnicalError" Text="Please specify Number Of Technical Round" Visible="false" CssClass="text-danger"></asp:Label>
          </div>
          <div class="row">
              <h5>Personal Interview</h5>
              <asp:TextBox runat="server" ID="TxtNumberOfInterviews" Text="0" ToolTip="Number Of Interviews" Placeholder="Number Of Interviews" CssClass="form-control"></asp:TextBox>
                                       <asp:Label runat="server" ID="LblNumberOfInteviewsError" Text="Please specify Number Of Interviews" Visible="false" CssClass="text-danger"></asp:Label>
          </div>
        </div>   
      <div class="modal-footer">
          <div class="row">
              <asp:Button runat="server" ID="BtnUpdateInterviewProcess" Text="Update this InterviewProcess" OnClick="BtnUpdateInterviewProcess_Click" CausesValidation="true" CssClass="btn btn-primary"/>
            &nbsp;&nbsp;
          <asp:LinkButton runat="server" ID="LnkBtnCloseInterviewProcess" CssClass="btn btn-default" OnClick="LnkBtnCloseInterviewProcess_Click" CausesValidation="false" Text="Close" ></asp:LinkButton>
          </div>
          
      </div>
    </div>

  </div>
</div>
</asp:Content>

