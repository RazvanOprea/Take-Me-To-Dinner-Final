<%@ Page Title="Restaurants" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="ShowPlaces.aspx.cs" Inherits="WebApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/Site-Contact.css?version=6" />

<div class="container-fluid">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
        Some text here
        <br />
        Apply filter
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
                          <div class="col-sm-7 col-xs-12">
                              <div class="blank_row"></div>
                              <div class="row">
                                  <div class="col-sm-11 col-xs-12">
                                      <asp:Label runat="server" ID="lblTitle" Text='<%# Item.Name %>' Font-Size="X-Large" Font-Bold="true"></asp:Label>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-sm-11 col-xs-12">
                                      <asp:Label runat="server" ID="lblDescription" Text='<%# Item.Description%>' CssClass="text-justify"/>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-sm-4 col-xs-6">
                                      <span class="grey">OPEN TIME</span>
                                      <asp:Label runat="server" ID="lblOpenTime" Text='<%#Item.OpenTime %>' />
                                  </div>
                                  <div class="col-sm-4 col-xs-6">
                                      <span class="grey">CLOSE TIME</span>
                                      <asp:Label runat="server" ID="lblCloseTime" Text='<%#Item.CloseTime %>' />
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
                              <asp:Label runat="server" ID="lblRating" Text="CUSTOMER RATING" CssClass="rating-text grey"></asp:Label>
                              <asp:Image runat="server" ID="imgRating" ImageUrl='<%# Eval("Rating", "~/Content/Images/Rating/Rating{0}.png") %>' CssClass="rating-picture"/>
                          </div>
                          <div class="col-sm-4 col-sm-offset-3 col-xs-6">
                              <asp:Button runat="server" ID="btnDetails" CssClass="details-button" Font-Size="Larger" Text="Details" />
                              <asp:Button runat="server" ID="Button1" CssClass="book-button" Font-Size="Larger" Text="Directions" />
                          </div>
                      </div>
                  </div>
                  <br />
                  <%--<div class="table-responsive">
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
                              <td class="right-td">
                                  <asp:Button runat="server" ID="btnDirections" CssClass="book-button" Font-Size="Larger" Text="Directions" />
                                  <asp:Button runat="server" ID="btnDetails" CssClass="details-button" Font-Size="Larger" Text="Details" />
                              </td>
                          </tr>
                          <tr class="blank_row">
                              <td colspan="3"></td>
                          </tr>
                      
                          <br />
                      </table>
                  </div>--%>
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
    
</asp:Content>
