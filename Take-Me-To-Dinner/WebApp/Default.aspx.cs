using Business;
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
    public partial class _Default : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                btnSearch.Visible = false;
            }
        }

        public string UserId
        {
            get
            {
                return User.Identity.GetUserId();
            }
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (UserProfileManager.HasUserCustomProfile(UserId))
            {
                UserProfile profile = UserProfileManager.GetUserProfile(UserId);
                Response.Redirect("Pages/ShowPlaces.aspx?cityId="+ profile.IdCity +
                                    "&minRating=" + profile.MinRating + 
                                    "&minPrice=" + profile.MinPrice +
                                    "&maxPrice=" + profile.MaxPrice);
            }
            else
            {
                Response.Redirect("Account/Manage.aspx");
            }
        }
    }
}