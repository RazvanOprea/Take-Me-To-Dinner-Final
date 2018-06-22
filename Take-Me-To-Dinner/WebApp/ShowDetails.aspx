<%@ Page Title="Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ShowDetails.aspx.cs" Inherits="WebApp.ShowDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="Content/ShowDetails.css?v=7" rel="stylesheet" type="text/css" />
    <link href="Content/jsImgSlider/themes/1/js-image-slider.css?v=14" rel="stylesheet" type="text/css" />
    <script src="Content/jsImgSlider/themes/1/js-image-slider.js" type="text/javascript"></script>

    <div class="container item-container">
        <br /> <br />
        <div class="col-sm-8 col-xs-12">
            <div id="sliderFrame">
                <div id="slider">
                    <asp:Repeater runat="server" ID="imgRepeater" DataSourceID="odsPlacePhotos" >
                        <ItemTemplate>
                            <asp:Image runat="server" ID="imgSlide" ImageUrl='<%#Eval("Path") %>' AlternateText="Image gallery" Width="100%"/>
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
        <div class="col-sm-12 col-xs-12">
            <h3>Customer reviews</h3>
        </div>
        <div class="col-sm-12 col-xs-12">
           <asp:ListView runat="server" ID="lwReviews" ItemType="Business.PlacesReview" DataSourceID="odsReviews" DataKeyNames="IdReview" ItemPlaceholderID="ItemContainer"
                        OnDataBinding="lwReviews_DataBinding" OnDataBound="lwReviews_DataBound">
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
                              <asp:HiddenField runat="server" ID="IdUserField" Value= '<%#Eval("IdUser") %>' Visible="false" />
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
                        <div class="col-sm-2 col-sm-offset-8 col-xs-12">
                            <asp:LinkButton runat="server" ID="btnDeleteReview" CommandArgument='<%#Eval("IdReview") %>' OnClick="btnDeleteReview_Click"
                                Text="Delete" ForeColor="Red" />
                        </div>
                      </div>
                      <hr />
                  </li>
              </ItemTemplate>
           </asp:ListView>
        </div>
    </div>
    <asp:PlaceHolder runat="server" ID="AddReviewForm">
        <div class="container item-container">
            <div class="col-sm-12 col-xs-12">
                <h3>Add review</h3>
            </div>
            <div class="row">
                <div class="col-sm-2 col-xs-3 custom-margin">
                    RATE RESTAURNAT:
                </div>
                <div class="col-sm-2 col-xs-3">
                    <span class="glyphicon glyphicon-star" style="color:#ffd800" />
                    <asp:DropDownList runat="server" ID="ddlReview" Width="40px" ForeColor="Black">
                        <asp:ListItem Text="1" Value="1" Selected="True" />
                        <asp:ListItem Text="2" Value="2" />
                        <asp:ListItem Text="3" Value="3" />
                        <asp:ListItem Text="4" Value="4" />
                        <asp:ListItem Text="5" Value="5" />
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <div class="col-sm-12 col-xs-12">
                <asp:TextBox runat="server" ID="txtReview" TextMode="MultiLine" Rows="3"
                    MaxLength="10" Width="100%" CssClass="form-control" placeholder="Write a review..."></asp:TextBox>
            </div>
            <div class="col-sm-12 col-xs-12">
                <asp:Button runat="server" ID="btnReview" Text="Add review" Width="100px" Height="35px"
                        BackColor="#f7f7f7" BorderWidth="1px" BorderStyle="Solid" BorderColor="#C0C0C0" OnClick="btnReview_Click" ValidationGroup="groupReview"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtReview" CssClass="text-danger" ErrorMessage="Review is required." Display="Dynamic"
                                            ValidationGroup="groupReview"/>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtReview" CssClass="text-danger" ErrorMessage="Review must be between 10 and 200 alphanumeric characters." Display="Dynamic" 
                    ValidationExpression="^[a-zA-Z0-9]{10,200}$" ValidationGroup="groupReview"/>
            </div>
            <div class="col-sm-12 col-xs-12">
                <asp:Label runat="server" ID="ErrorMessage" Visible="false" CssClass="text-danger"></asp:Label>
            </div>
            <br />
        </div>
    </asp:PlaceHolder>
    

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

