<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPageForViewer.master" AutoEventWireup="true" CodeFile="NewAnswerCompany.aspx.cs" Inherits="Company_NewAnswerCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12">
            <span class="h3" style="color:#344154;text-transform:uppercase">Answer some Question</span>
            <span class="pull-right"><a href="CompanyList.aspx" class="btn btn-info">Back to list of QuestionAnswer</a></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <h5>Question like</h5>
            <asp:TextBox runat="server" ID="TxtQuestion" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-12 col-sm-1">
            <h5>&nbsp;</h5>
            <asp:Button runat="server" ID="BtnGo" Text="Go" OnClick="BtnGo_Click" CssClass="btn btn-primary" />
        </div>
    </div>
    <br />
    <div class="table-responsive">
        <asp:GridView runat="server" ID="GridViewQuestion" HeaderStyle-BackColor="#344154" Font-Size="Large" RowStyle-BackColor="White" HeaderStyle-ForeColor="White" BorderColor="#ff00ff" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">
            <Columns>
                <asp:BoundField HeaderText="Question" DataField="QuestionName" />
                <asp:BoundField HeaderText="Answer" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="LnkBtnAnswer" Text="Answer this Question" OnClick="LnkBtnAnswer_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    
</asp:Content>