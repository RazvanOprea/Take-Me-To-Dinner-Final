using Business.Managers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ShowPlaces : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SearchResultsDataView.DataSource = PlacesManager.GetAllConfirmedPlaces();
            SearchResultsDataView.DataBind();
        }
    }
}