using Business.Managers;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
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
                if (Request.QueryString["minPrice"] != null) txtMinPrice.Text = Request.QueryString["minPrice"];
                if (Request.QueryString["maxPrice"] != null) txtMaxPrice.Text = Request.QueryString["maxPrice"];
                if (Request.QueryString["minRating"] != null) ratingText.Text = Request.QueryString["minRating"];
                ratingSliderControl.Text = ratingText.Text;
                ddlCities.SelectedIndex = Convert.ToInt32(Session["cityId"]) - 1;

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

        protected string GetUserRole(string userId)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var role = manager.GetRoles(userId).FirstOrDefault().ToString();
            if (role != null) return role;
            else
                return "";
        }

        protected bool IsCommandButtonVisibile(string userId)
        {
            if (!Request.IsAuthenticated) return false;
            if (GetUserRole(UserId) == "Admin") return true;
            else
            {
                if (userId == UserId)
                    return true;
                else
                    return false;
            }
        }

        protected void btnDeletePlace_Click(object sender, EventArgs e)
        {
            LinkButton myButton = (LinkButton)sender;
            int idPlace = Convert.ToInt32(myButton.CommandArgument.ToString());
            PlacesManager.DeletePlace(idPlace);
            lwPlaces.DataBind();
        }
    }
}