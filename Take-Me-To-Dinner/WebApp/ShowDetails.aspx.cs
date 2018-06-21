using Business.Managers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ShowDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["placeId"] = Request.QueryString["placeId"];
            }
        }

        protected void odsPlace_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["placeId"] = Session["placeId"];
        }

        protected void odsPlacePhotos_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["placeId"] = Session["placeId"];
        }

        public string ConvertToUpper(string input)
        {
            return input.ToUpper();
        }

        protected void linkWebsite_Click(object sender, EventArgs e)
        {
            LinkButton myButton = (LinkButton)sender;
            Response.Redirect(myButton.CommandArgument.ToString());
        }

        protected void linkDirections_Click(object sender, EventArgs e)
        {
            LinkButton myButton = (LinkButton)sender;
            int idPlace = Convert.ToInt32(myButton.CommandArgument.ToString());
            string querry = PlacesManager.GetGoogleMapsQuery(idPlace);
            Response.Redirect("https://" + "www.google.com/maps/dir/?api=1&destination=" + Server.UrlEncode(querry));
        }
    }
}