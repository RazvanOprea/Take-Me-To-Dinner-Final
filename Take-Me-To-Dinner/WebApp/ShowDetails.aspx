<%@ Page Title="Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ShowDetails.aspx.cs" Inherits="WebApp.ShowDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView runat="server" ID="dsada" DataSourceID="odsPlace" />

    <asp:ObjectDataSource runat="server" ID="odsPlace"
        TypeName="Business.Managers.PlacesManager"
        DataObjectTypeName="Business.Place"
        SelectMethod="GetPlaceByID"
        OnSelecting="odsPlace_Selecting">
        <SelectParameters>
            <asp:Parameter Name="placeId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

