<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>





<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"  >
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css" />
    <link rel="stylesheet" href="Content/SearchPage.css"  type="text/css" />
    <style type="text/css">
       .select{
           width: 500px;
            height: 50px;
            background: #2b303b;
            border: none;
            font-size: 10pt;
            font-weight: bold;
            float: left;
            color: lightgray;
            padding-left: 15px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            text-align:center !important;
       }
       input:focus, select:focus, textarea:focus, form:focus, button:focus {outline:0;}
       .select option{
           outline:none !important;
           border:none !important;
       }
       .select dropdown{
           outline:none;
           border:none;
       }
       
    </style>
    
    <script type="text/javascript">

    </script>

    
    <div class="box">
        <h1 class="header1" id="head1">TAKE ME TO DINNER</h1>
        <h2 class="header2" id="head2">Find the best place to eat, drink and have lots of fun tonight.</h2>
        <br />
        <div class="container-4">
            <%--<input type="search" id="search" placeholder="What are you looking for?..." name="searchPlace" />
            <button type="submit" id="btnSearch" formmethod="post" formaction="/About"  class="icon" ><i class="fa fa-search"></i></button>--%>
            <asp:DropDownList ID="DropDownListPlaces" runat="server" DataSourceID="ldsCities" DataTextField="Name" DataValueField="IdCity" AppendDataBoundItems="true"
                     CssClass="select"  ToolTip="Select" OnSelectedIndexChanged="DropDownListPlaces_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="" Text="What are you looking for?" ></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
 


<asp:LinqDataSource 
    ID="ldsPlaces" 
    runat="server" 
    ContextTypeName="Business.EntitiesContext" 
    TableName="Places">
</asp:LinqDataSource>

<asp:LinqDataSource
    ID="ldsCities"
    runat="server"
    ContextTypeName="Business.EntitiesContext"
    TableName="Cities">
</asp:LinqDataSource>


</asp:Content>
