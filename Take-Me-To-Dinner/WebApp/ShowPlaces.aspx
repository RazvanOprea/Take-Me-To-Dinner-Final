﻿<%@ Page Title="Restaurants" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="ShowPlaces.aspx.cs" Inherits="WebApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/ShowPlaces.css?version=16" />

    <script type="text/javascript">
        function ddlCities_SelectedIndexChanged(ddlCities)
          {
            alert(ddlCities.options[ddlCities.selectedIndex].text);
          }
    </script>

<div class="container-fluid">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
        <div class="row">
            <div class="col-sm-12 col-xs-6">
                <asp:Label runat="server" ID="lblCities" Text="Change city" CssClass="center grey"></asp:Label>
                <asp:dropdownlist id="ddlCities" runat="server" DataSourceID="ldscities" DataTextField="name" DataValueField="idcity"
                        CssClass="form-control dropdown-cities center" AutoPostBack="true" Width="60%" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged" >
                </asp:dropdownlist>
            </div>
        </div>
        <hr />
        <div class="blank_row"></div>
        <div class="row">
            <asp:ScriptManager runat="server" ID="ScriptManager1" />
            <asp:TextBox runat="server" ID="slider"></asp:TextBox>
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <asp:Button runat="server" ID="btnCity" Text="Apply" Width="100px" Height="30px" CssClass="center"/>
            </div>
        </div>
    </div>
    <div class="col-sm-9">
      <asp:ListView ID="lwPlaces" runat="server" ItemType="Business.Place" DataKeyNames="IdPlace" DataSourceID="odsPlaces" ItemPlaceholderID="ItemContainer" >
          <LayoutTemplate>
              <ul class="ul-places">
                  <asp:PlaceHolder ID="ItemContainer" runat="server"/>
              </ul>
          </LayoutTemplate>
          <ItemTemplate>
              <li>
                  <div class="results-item">
                      <div class="row">
                          <div class="col-sm-5 col-xs-12">
                              <asp:Image runat="server" ID="imgPlace" ImageUrl=<%# Eval("Photo") %> CssClass="picture" />
                          </div>
                          <div class="col-sm-7 col-xs-11 margin-left-xs">
                              <div class="blank_row"></div>
                              <div class="row">
                                  <div class="col-sm-11">
                                      <asp:Label runat="server" ID="lblTitle" Text='<%# Item.Name %>' Font-Size="X-Large" Font-Bold="true"></asp:Label>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-sm-11 col-xs-12" style="text-align:justify;">
                                      <asp:Label runat="server" ID="lblDescription" Text='<%# Item.Description%>' />
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-sm-4 col-xs-6">
                                      <span class="grey">OPEN TIME</span>
                                      <asp:Label runat="server" ID="lblOpenTime" Text='<%# FormatTime(Item.OpenTime)%>' />
                                  </div>
                                  <div class="col-sm-4 col-xs-6">
                                      <span class="grey">CLOSE TIME</span>
                                      <asp:Label runat="server" ID="lblCloseTime" Text='<%#FormatTime(Item.CloseTime) %>' />
                                  </div>
                                  <div class="col-sm-4 col-xs-12">
                                      <span class="grey">TYPE</span>
                                      <asp:Label runat="server" ID="lblType" Text='<%#Item.Type %>'></asp:Label>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-sm-5 col-xs-12">
                              <div class="center">
                                  <asp:Label runat="server" ID="lblRating" Text="CUSTOMER RATING" CssClass="rating-text grey"></asp:Label>
                                  <asp:Image runat="server" ID="imgRating" ImageUrl='<%# Eval("Rating", "~/Content/Images/Rating/Rating{0}.png") %>' CssClass="rating-picture"/>
                              </div>
                          </div>
                          <div class="col-sm-4 col-sm-offset-3 col-xs-12">
                              <div class="center">
                                  <asp:Button runat="server" ID="btnDetails" CssClass="details-button" Font-Size="Larger" Text="Details" Height="45px" Width="100px" />
                                  <asp:Button runat="server" ID="Button1" CssClass="book-button" Font-Size="Larger" Text="Directions" Height="45px" Width="100px"/>
                              </div>
                          </div>
                      </div>
                      <br />
                  </div>
                  <br />
              </li>
          </ItemTemplate>
          <EmptyDataTemplate>
              <div class="containter center">
                  <div class="row">
                      <asp:Image runat="server" ID="imgNoResults" ImageUrl="~/Content/Images/NoResults.png" CssClass="no-results center" />
                  </div>
                  <div class="row">
                      <h3 class="center no-results">
                          <br />
                          No place match your preferences.
                          <br />
                          Please modify your search criteria and try again.
                      </h3>
                  </div>
              </div>
          </EmptyDataTemplate>
      </asp:ListView>
    </div>
    
  </div>
</div>

    <asp:ObjectDataSource ID="odsPlaces" runat="server"
        TypeName="Business.Managers.PlacesManager"
        DataObjectTypeName="Business.Place"
        SelectMethod="GetAllPlacesByCityId"
        OnSelecting="odsPlaces_Selecting">
        <SelectParameters>
            <asp:Parameter Name="cityId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:LinqDataSource
        ID="ldsCities"
        runat="server"
        ContextTypeName="Business.EntitiesContext"
        TableName="Cities">
    </asp:LinqDataSource>
    
</asp:Content>
