<%@ Page Title="Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ShowDetails.aspx.cs" Inherits="WebApp.ShowDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="Content/ShowDetails.css?v=6" rel="stylesheet" type="text/css" />
    <link href="Content/jsImgSlider/themes/1/js-image-slider.css?v=13" rel="stylesheet" type="text/css" />
    <script src="Content/jsImgSlider/themes/1/js-image-slider.js" type="text/javascript"></script>

    <div class="container item-container">
        <br /> <br />
        <div class="col-sm-8 col-xs-12">
            <div id="sliderFrame">
                <div id="slider">
                    <asp:Repeater runat="server" ID="imgRepeater" DataSourceID="odsPlacePhotos" >
                        <ItemTemplate>
                            <asp:Image runat="server" ID="imgSlide" ImageUrl='<%#Eval("Path") %>' AlternateText="Image gallery"/>
                        </ItemTemplate>
                    </asp:Repeater>
                 </div>
            </div>
        </div>
        <div class="col-sm-4 col-xs-12">
            <asp:DataList runat="server" ID="DataListPlace" DataKeyField="IdPlace" DataSourceID="odsPlace">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm-11">
                            <asp:Label runat="server" ID="lblTitle" Text='<%# Eval("Name") %>' Font-Size="XX-Large" Font-Bold="true"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-11 col-xs-12">
                            <asp:Label runat="server" ID="lblAdress" Text='<%# ConvertToUpper(Eval("Adress").ToString())%>' CssClass="grey"/>
                        </div>
                    </div>
                    <div class="blank_row"></div>
                    <div class="row">
                        <div class="col-sm-11 col-xs-12">
                            <asp:Image runat="server" ID="imgRating" ImageUrl='<%# Eval("Rating", "~/Content/Images/Rating/Rating{0}.png") %>' 
                                Height="20px" Width="120px" CssClass="rating-img col-xs-center" ToolTip='<%#Eval("RatingFloat") %>'/>
                        </div>
                    </div>
                    <div class="blank_row"></div>
                    <div class="row">
                        <div class="col-sm-11 col-xs-12" style="text-align:justify;">
                            <asp:Label runat="server" ID="lblDescription" Text='<%# Eval("Description")%>' />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-11 col-xs-12">
                            <div class="col-sm-2 col-xs-2">
                                <i class="fa fa-cutlery" style="font-size:large"></i>
                            </div>
                            <div class="col-sm-9 col-xs-10">
                                <asp:Label runat="server" ID="lblType" Text='<%# ConvertToUpper(Eval("Type").ToString()) %>' CssClass="grey" ToolTip="Type"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-11 col-xs-12">
                            <div class="col-sm-2 col-xs-2">
                                <i class="fa fa-phone" style="font-size:large"></i>
                            </div>
                            <div class="col-sm-9 col-xs-10">
                                <asp:Label runat="server" ID="lblTelephone" Text='<%#Eval("Telephone") %>' CssClass="grey" ToolTip="Telephone"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-11 col-xs-12">
                            <div class="col-sm-2 col-xs-2">
                                <i class="fa fa-globe" style="font-size:large"></i>
                            </div>
                            <div class="col-sm-9 col-xs-10">
                                <asp:LinkButton runat="server" ID="linkWebsite" OnClick="linkWebsite_Click" CommandArgument='<%#Eval("Website") %>' 
                                    Text='<%#Eval("Website") %>' CssClass="grey" ToolTip="Website"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-11 col-xs-12">
                            <div class="col-sm-2 col-xs-2">
                                <span class="glyphicon glyphicon-time" style="font-size:large"></span>
                            </div>
                            <div class="col-sm-9 col-xs-10">
                                <asp:Label runat="server" ID="lblOpenTime" Text='<%#Eval("CloseTime") %>' CssClass="grey" ToolTip="Close time"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-11 col-xs-12">
                            <div class="col-sm-2 col-xs-2">
                                <span class="glyphicon glyphicon-map-marker" style="font-size:large"></span>
                            </div>
                            <div class="col-sm-9 col-xs-10">
                                <asp:LinkButton runat="server" ID="linkDirections" OnClick="linkDirections_Click" CommandArgument='<%#Eval("IdPlace") %>' 
                                    Text='Directions' CssClass="grey" ToolTip="Google Maps"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <div class="container item-container">
        <div class="col-sm-12 col-xs-12 center">
            <h3>Customer reviews</h3>
        </div>
        <div class="col-sm-12 col-xs-12">
           <asp:ListView runat="server" ID="lwReviews" ItemType="Business.PlacesReview" DataSourceID="odsReviews" DataKeyNames="IdReview" ItemPlaceholderID="ItemContainer">
               <LayoutTemplate>
                  <ul class="ul-places">
                      <asp:PlaceHolder ID="ItemContainer" runat="server"/>
                  </ul>
              </LayoutTemplate>
              <ItemTemplate>
                  <li>
                      <div class="row">
                          <div class="col-sm-12 col-xs-12">
                              <i class="fa fa-comment"></i>
                              <asp:Label runat="server" ID="lblEmail" Text='<%# ReviewFormat(Eval("EmailUser").ToString(), Eval("Date")) %>'
                                  Font-Italic="true" Font-Bold="true"/>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-sm-12 col-xs-12 custom-margin">
                              <asp:Label runat="server" ID="lblReview" Text='<%#Item.Review %>' />
                          </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-2 col-xs-12">
                            <asp:Image runat="server" ID="imgRatingReview" ImageUrl='<%# Eval("Rating", "~/Content/Images/Rating/Rating{0}.png") %>' 
                                Height="20px" Width="120px" CssClass="rating-img center"/>
                        </div>
                      </div>
                      <hr />
                  </li>
              </ItemTemplate>
           </asp:ListView>
        </div>
    </div>

    <asp:ObjectDataSource runat="server" ID="odsPlace"
        TypeName="Business.Managers.PlacesManager"
        DataObjectTypeName="Business.Place"
        SelectMethod="GetPlaceByID"
        OnSelecting="odsPlace_Selecting">
        <SelectParameters>
            <asp:Parameter Name="placeId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" ID="odsPlacePhotos"
        TypeName="Business.Managers.PlacesManager"
        DataObjectTypeName="Business.PlacesPhoto"
        SelectMethod="GetPlacePhotos"
        OnSelecting="odsPlacePhotos_Selecting">
        <SelectParameters>
            <asp:Parameter Name="placeId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource runat="server" ID="odsReviews"
        TypeName="Business.Managers.PlacesManager"
        DataObjectTypeName="Business.PlacesReview"
        SelectMethod="GetReviews"
        OnSelecting="odsReviews_Selecting">
        <SelectParameters>
            <asp:Parameter Name="placeId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

