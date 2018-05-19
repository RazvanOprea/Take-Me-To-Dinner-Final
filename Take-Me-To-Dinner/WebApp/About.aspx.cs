using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business.Managers;

namespace WebApp
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grid.DataSource = PlacesController.GetAllPlaces();
            grid.DataBind();
        }
    }
}