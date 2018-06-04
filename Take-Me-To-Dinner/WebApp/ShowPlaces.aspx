<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowPlaces.aspx.cs" Inherits="WebApp.ShowPlaces" MasterPageFile="~/Site.Master" %>
<%@ Register Assembly="DevExpress.Web.v18.1" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" EnableViewState="false">
    <link rel="stylesheet" href="Content/Site2.css"/>

    <div class="wrapper-relative" id="content">
        <div class="results-options">
            <div class="wrapper-scroll">
                <div class="item-1">
                    <div class="caption-cell">SEARCH BY CITY</div>
                    <div class="control-cell"></div>
                </div>
            </div>
        </div>
        <div class="results-content" runat="server" id="ResultsPanel">
            <div class="wrapper-scroll">
                <dx:ASPxDataView runat="server" ID="SearchResultsDataView" CssClass="data-view" Width="100%">
                    <ContentStyle Border-BorderStyle="None"></ContentStyle>
                    <ItemStyle CssClass="results-item" />
                    <SettingsTableLayout ColumnCount="1" />
                    <PagerSettings ShowNumericButtons="False" EndlessPagingMode="OnScroll"></PagerSettings>
                    <ItemTemplate>
                        <div class="price">
                            STARTING FROM
                            <h4>
                                0$
                            </h4>
                        </div>
                        <div class="parameters">
                        <span class="parameter">
                            <span class="grey">TYPE</span> <%# Eval("Name") %> 
                        </span>
                        <span class="parameter">
                            <span class="grey">LOCATION</span> <%# Eval("Name") %> 
                        </span>
                    </div>
                    </ItemTemplate>
                </dx:ASPxDataView>
            </div>
        </div>
    </div>
</asp:Content>
