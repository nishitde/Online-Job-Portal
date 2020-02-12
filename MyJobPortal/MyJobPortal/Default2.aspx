<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageWithLogin.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
        <img src="AddingValuesToTest.png" />
    </div>
    <div class="item">
        <img src="DesigningATest.png" />
    </div>
    <div class="item">
        <img src="ListOfLabNumbers.png" />
    </div>
    <div class="item">
        <img src="ListOfPatients.png" />
    </div>
    <div class="item">
        <img src="NewPatient.png" />
    </div>
    <div class="item">
        <img src="TestOfApatient.png" />
    </div>
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</asp:Content>

