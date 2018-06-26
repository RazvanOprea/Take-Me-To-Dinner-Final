using Business;
using Business.Managers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class _Default : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ddlCities_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Pages/ShowPlaces.aspx?cityId=" + ddlCities.SelectedItem.Value);
        }

        protected void ddlCities_Init(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            ddl.Items[0].Attributes.Add("disabled", "disabled");
        }

    }
}