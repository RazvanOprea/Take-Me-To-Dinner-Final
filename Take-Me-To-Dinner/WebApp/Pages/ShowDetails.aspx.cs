using Business.Managers;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ShowDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                AddReviewForm.Visible = false;
            }
            if (!IsPostBack)
            {
                Session["placeId"] = Request.QueryString["placeId"];
            }
        }
        public string UserId
        {
            get
            {
                return User.Identity.GetUserId();
            }
        }
        public bool IsUserAdmin
        {
            get
            {
                if (UserId != null)
                {
                    var roles = Context.GetOwinContext().GetUserManager<ApplicationUserManager>().GetRoles(UserId).ToList();
                    foreach (string role in roles)
                        if (role == "Admin") return true;
                    return false;
                }
                else
                    return false;
            }
        }
        public string Email
        {
            get
            {
                return User.Identity.GetUserName();
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

        public string ReviewFormat(string email, object date)
        {
            DateTime newDate = (DateTime)date;
            return "Posted by " + email + " on " + newDate.ToString("dd/MM/yyyy");
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

        protected void odsReviews_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["placeId"] = Session["placeId"];
        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            int idPlace = Convert.ToInt32(Session["placeId"]);
            if (PlacesManager.UserReviewedBefore(idPlace, UserId))
            {
                ErrorMessage.Text = "You already have a review for this place";
                ErrorMessage.Visible = true;
            }
            else
            {
                ErrorMessage.Visible = false;
                int rating = Convert.ToInt32(ddlReview.SelectedItem.Value);
                PlacesManager.AddReview(idPlace, UserId, Email, txtReview.Text, rating, DateTime.Now);
                txtReview.Text = null;
                lwReviews.DataBind();
            }
        }

        protected void lwReviews_DataBinding(object sender, EventArgs e)
        {
            DataListPlace.DataBind();
        }

        protected void btnDeleteReview_Click(object sender, EventArgs e)
        {
            LinkButton myButton = (LinkButton)sender;
            int idReview = Convert.ToInt32(myButton.CommandArgument);
            PlacesManager.DeleteReview(idReview);
            lwReviews.DataBind();
        }

        protected void lwReviews_DataBound(object sender, EventArgs e)
        {
            ListView lw = (ListView)sender;
            foreach (var item in lw.Items)
            {
                if (item.ItemType == ListViewItemType.DataItem)
                {
                    LinkButton btn = (LinkButton)item.FindControl("btnDeleteReview");
                    HiddenField hf = (HiddenField)item.FindControl("IdUserField");
                    if (hf.Value == UserId || IsUserAdmin)
                    {
                        btn.Visible = true;
                    }
                    else
                    {
                        btn.Visible = false;
                    }
                }
            }
        }
    }
}