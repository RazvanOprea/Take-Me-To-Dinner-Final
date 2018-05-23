<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>





<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"  >
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.full.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css" />
    <link rel="stylesheet" href="Content/SearchPage.css"  type="text/css" />
    <style type="text/css">
        .select2-selection__rendered {
            line-height: 50px !important;
        }
        .select2-selection {
            height: 50px !important;
        }
        .select2-selection__arrow {
            height: 50px !important;
        }
    </style>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $(".js-example-responsive-multi").select2({
                width: 'resolve',
                placeholder: "What are you looking for?",
                dropdownCssClass: "bigdrop"
            });
            
        });
    </script>

    
    <div class="box">
        <h1 class="header1" id="head1">TAKE ME TO DINNER</h1>
        <h2 class="header2" id="head2">Find the best place to eat, drink and have lots of fun tonight.</h2>
        <br />
        <div class="container-4">
            <%--<input type="search" id="search" placeholder="What are you looking for?..." name="searchPlace" />
            <button type="submit" id="btnSearch" formmethod="post" formaction="/About"  class="icon" ><i class="fa fa-search"></i></button>--%>
            <asp:DropDownList ID="search" runat="server" DataSourceID="ldsPlaces" DataTextField="Name" DataValueField="IdPlace"
                     CssClass="form-control js-example-responsive-multi" ToolTip="Select"/>
        </div>
    </div>
 


<asp:LinqDataSource 
    ID="ldsPlaces" 
    runat="server" 
    ContextTypeName="Business.EntitiesContext" 
    TableName="Places">
</asp:LinqDataSource>


</asp:Content>
