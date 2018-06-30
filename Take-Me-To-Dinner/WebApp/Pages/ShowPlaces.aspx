<%@ Page Title="Restaurants" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="ShowPlaces.aspx.cs" Inherits="WebApp.Contact" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" href="../Content/ShowPlaces.css?version=40" />
<script type="text/javascript">
    function pageLoad() {
        $('.body-content').hide().show();
    }
</script>
    
<div class="container-fluid">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <asp:Label runat="server" ID="lblCities" Text="CHOOSE A CITY" CssClass="center grey"></asp:Label>
                <asp:dropdownlist id="ddlCities" runat="server" DataSourceID="ldscities" DataTextField="name" DataValueField="idcity"
                        CssClass="form-control dropdown-cities center" AutoPostBack="false" Width="60%" >
                </asp:dropdownlist>
            </div>
        </div>
        <hr />
        
        <div class="blank_row"></div>
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <asp:Label runat="server" ID="lblPrice" Text="AVERAGE PRICE (RON)" CssClass="center grey"></asp:Label>
                <div class="row">
                    <div class="col-sm-2 col-xs-2">
                        <asp:TextBox ID="txtMinPrice" runat="server" Width="30" Text="0" BackColor="#f88e1d" ForeColor="White" BorderStyle="None" />
                    </div>
                    <div class="col-sm-8 col-xs-7">
                        <asp:TextBox ID="sliderTwo" runat="server" />
                        <ajaxToolkit:MultiHandleSliderExtender ID="multiHandleSliderExtenderTwo" runat="server"
                            BehaviorID="multiHandleSliderExtenderTwo"
                            TargetControlID="sliderTwo"
                            Minimum="0"
                            Maximum="100"
                            Length="170"
                            TooltipText="{0}"
                            Orientation="Horizontal"
                            EnableKeyboard="false"
                            EnableMouseWheel="false"
                            Increment="5">
                            <MultiHandleSliderTargets>
                                <ajaxToolkit:MultiHandleSliderTarget ControlID="txtMinPrice" HandleCssClass="mymultihandle"/>
                                <ajaxToolkit:MultiHandleSliderTarget ControlID="txtMaxPrice" HandleCssClass="mymultihandle"/>
                            </MultiHandleSliderTargets>
                        </ajaxToolkit:MultiHandleSliderExtender>
                    </div>
                    <div class="col-sm-2 col-xs-2">
                        <asp:TextBox ID="txtMaxPrice" runat="server" Width="30" Text="100" BackColor="#f88e1d" ForeColor="White" BorderStyle="None"/>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div class="blank_row"></div>
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <asp:Label runat="server" ID="LabelRating" Text="CUSTOMER RATING" CssClass="center grey"></asp:Label>
                <div class="row">
                    <div class="col-sm-10 col-xs-9">
                        <asp:TextBox runat="server" ID="ratingSliderControl" />
                        <ajaxToolkit:SliderExtender runat="server" ID="ratingSlider" TargetControlID="ratingSliderControl" BoundControlID="ratingText" TooltipText="ratingText"
                            Minimum="1" Maximum="5" Length=220 HandleImageUrl="~/Content/Images/TrackBarHandle.png" HandleCssClass="myhandle"/>
                    </div>
                    <div class="col-sm-2 col-xs-3">
                        <asp:TextBox runat="server" ID="ratingText" Width="30" BackColor="#f88e1d" ForeColor="White" BorderStyle="None" />
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-12 col-xs-12">
                <asp:Button runat="server" ID="btnApply" Text="Apply" Width="100px" Height="35px" CssClass="center" OnClick="btnApply_Click"
                            BackColor="#f7f7f7" BorderWidth="1px" BorderStyle="Solid" BorderColor="#C0C0C0" />
            </div>
        </div>
    </div>
    <div class="col-sm-9">
      <asp:ListView ID="lwPlaces" runat="server" ItemType="Business.Place" DataKeyNames="IdPlace" DataSourceID="odsPlaces" ItemPlaceholderID="ItemContainer"  >
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
                                  <div class="col-sm-8 col-xs-12">
                                      <asp:Label runat="server" ID="lblTitle" Text='<%# Item.Name %>' Font-Size="X-Large" Font-Bold="true"></asp:Label>
                                  </div>
                                  <div class="col-sm-3 col-xs-12 padding-top-6px">
                                      <asp:Label runat="server" ID="lblPrice" Text='<%# Eval("AveragePrice", "{0} RON") %>' Font-Bold="true" ForeColor="#f88e1d"
                                            Font-Size="Medium" />
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
                              <div class="row">
                                  <div class="col-sm-1 col-xs-6">
                                      <asp:LinkButton runat="server" ID="btnModifyPlace" Text="Edit" Font-Bold="true" CssClass="center"
                                          Visible='<%# IsCommandButtonVisibile(Eval("IdPartner").ToString()) %>'/>
                                  </div>
                                  <div class="col-sm-2 col-xs-6">
                                    <asp:LinkButton runat="server" ID="btnDeletePlace" Text="Delete" ForeColor="Red" Font-Bold="true" CssClass="center"
                                          Visible='<%# IsCommandButtonVisibile(Eval("IdPartner").ToString()) %>' CommandArgument='<%#Item.IdPlace %>'
                                          OnClick="btnDeletePlace_Click"/>
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
                                  <asp:Button runat="server" ID="btnDetails" CssClass="details-button" Font-Size="Larger" Text="Details" Height="45px" Width="100px"
                                      OnClick="btnDetails_Click" CommandArgument='<%#Item.IdPlace %>'/>
                                  <asp:Button runat="server" ID="btnDirections" CssClass="book-button" Font-Size="Larger" Text="Directions" Height="45px" Width="100px" 
                                      OnClick="btnDirections_Click" CommandArgument='<%#Item.IdPlace %>'/>
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
        SelectMethod="GetAllPlaces"
        OnSelecting="odsPlaces_Selecting">
        <SelectParameters>
            <asp:Parameter Name="cityId" Type="Int32" />
            <asp:Parameter Name="rating" Type="Int32" />
            <asp:Parameter Name="minPrice" Type="Int32" />
            <asp:Parameter Name="maxPrice" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:LinqDataSource
        ID="ldsCities"
        runat="server"
        ContextTypeName="Business.EntitiesContext"
        TableName="Cities">
    </asp:LinqDataSource>
    
</asp:Content>
