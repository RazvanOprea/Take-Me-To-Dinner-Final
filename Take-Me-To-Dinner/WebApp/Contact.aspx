﻿<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Contact.aspx.cs" Inherits="WebApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/Site-Contact.css" />

  <div class="container-fluid">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-10">
      <asp:ListView ID="lwPlaces" runat="server" ItemType="Business.Place" DataKeyNames="IdPlace" DataSourceID="odsPlaces" ItemPlaceholderID="ItemContainer" >
          <LayoutTemplate>
              <ul>
                  <asp:PlaceHolder ID="ItemContainer" runat="server"/>
              </ul>
          </LayoutTemplate>
          <ItemTemplate>
              <li>
                  <div class="table-responsive">
                      <table class="results-item">
                          <tr>
                              <td class="left-td">
                                  <asp:Image runat="server" ID="imgPlace" ImageUrl=<%# Eval("Photo") %> CssClass="picture" />
                              </td>
                              <td class="right-td">
                                  <table>
                                      <tr>
                                          <td>
                                              <asp:Label runat="server" ID="lblTitle" Text='<%# Item.Name %>' Font-Size="X-Large" Font-Bold="true"></asp:Label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label runat="server" ID="lblDescription" Text='<%# Item.Description%>' CssClass="description"/>
                                          </td>
                                      </tr>
                                      <tr class="parameters">
                                         <td class="parameter">
                                             <span class="grey">TYPE</span> <asp:Label runat="server" ID="lblType" Text='<%#Item.Type %>' />
                                         </td>
                                          <td class="parameter">
                                              <span class="grey">OPEN TIME</span> <asp:Label runat="server" ID="lblOpenTime" Text='<%#Item.OpenTime %>' />
                                          </td>
                                          <td class="parameter">
                                              <span class="grey">CLOSE TIME</span> <asp:Label runat="server" ID="lblCloseTime" Text='<%#Item.CloseTime %>' />
                                          </td>
                                      </tr>
                                      <tr class="blank_row">
                                        <td colspan="3"></td>
                                      </tr>
                                  </table>
                              </td>
                          </tr>
                          <tr>
                              <td class="left-td">
                                  <asp:Label runat="server" ID="lblRating" Text="CUSTOMER RATING" CssClass="rating-text grey"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="left-td">
                                  <asp:Image runat="server" ID="imgRating" ImageUrl='<%# Eval("Rating", "~/Content/Images/Rating/Rating{0}.png") %>' CssClass="rating-picture"/>
                              </td>
                          </tr>
                          <tr class="blank_row">
                              <td colspan="3"></td>
                          </tr>
                      
                          <br />
                      </table>
                  </div>
              </li>
          </ItemTemplate>
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
    
</asp:Content>
