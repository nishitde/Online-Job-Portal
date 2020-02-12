<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JobPost.ascx.cs" Inherits="JobPost_JobPost" %>
<style>
    .card {
  /* Add shadows to create the "card" effect */
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
}
    .card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
</style>
<div class="card row" style="border:thin;background-color:white">
    <div class="col-xs-12">
        <label>Job Title</label>
    </div>
    <div class="col-xs-12">
            <label>Description </label>
            <label>bhgfvkjrdgvjkl</label>
        <div class="row">
            <label>Description </label>
        </div>
        
    </div>
    <div class="col-xs-12">
        <div class="row pull-right">
            <asp:Button runat="server" CssClass="btn btn-success" ID="BtnApply" Text="Apply"></asp:Button>
        <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnSave" Text="Save"></asp:Button>
        </div>
    </div>
    <div class="col-xs-12">
        &nbsp;
    </div>
</div>
