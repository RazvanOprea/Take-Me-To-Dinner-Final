using Business.Managers;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["cityId"] = Request.QueryString["cityId"];
                Session["minRating"] = Request.QueryString["minRating"] ?? "1";
                Session["minPrice"] = Request.QueryString["minPrice"] ?? "0";
                Session["maxPrice"] = Request.QueryString["maxPrice"] ?? "300";
            }
        }
        public string UserId
        {
            get
            {
                return User.Identity.GetUserId();
            }
        }

        protected void odsPlaces_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["cityId"] = Session["cityId"];
            e.InputParameters["rating"] = Session["minRating"];
            e.InputParameters["minPrice"] = Session["minPrice"];
            e.InputParameters["maxPrice"] = Session["maxPrice"];

        }

        protected String FormatTime(TimeSpan? input)
        {
            return input.Value.ToString(@"hh\:mm");
        }


        protected void btnApply_Click(object sender, EventArgs e)
        {
            Session["cityId"] = Convert.ToInt32(ddlCities.SelectedItem.Value);
            Session["minRating"] = Convert.ToInt32(ratingText.Text);
            // TO DO : la selecting sa adaug si min-max price
            Session["minPrice"] = Convert.ToInt32(txtMinPrice.Text);
            Session["maxPrice"] = Convert.ToInt32(txtMaxPrice.Text);

            lwPlaces.DataBind();
        }

        protected void btnDirections_Click(object sender, EventArgs e)
        {
            Button myButton = (Button)sender;
            int idPlace = Convert.ToInt32(myButton.CommandArgument.ToString());
            string querry = PlacesManager.GetGoogleMapsQuery(idPlace);
            Response.Redirect("https://" + "www.google.com/maps/dir/?api=1&destination=" + Server.UrlEncode(querry));
        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Button myButton = (Button)sender;
            int idPlace = Convert.ToInt32(myButton.CommandArgument.ToString());
            if (UserId != null)
            {
                PlacesManager.AddUserSearchHistory(idPlace, UserId, DateTime.Now);
            }
            
            Response.Redirect("ShowDetails.aspx?placeId=" + idPlace);
        }
    }
}