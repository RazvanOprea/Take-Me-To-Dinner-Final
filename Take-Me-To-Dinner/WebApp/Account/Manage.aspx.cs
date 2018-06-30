using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Business;
using Business.Managers;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using WebApp.Models;

namespace WebApp.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        public string UserId
        {
            get
            {
                return User.Identity.GetUserId();
            }
        }
        public string UserRole
        {
            get
            {
                return Context.GetOwinContext().GetUserManager<ApplicationUserManager>().GetRoles(UserId).FirstOrDefault().ToString();
                
            }
        }
        public string UserEmail
        {
            get
            {
                return User.Identity.GetUserName();
            }
        }

        protected void Page_Load()
        {
            if (!IsPostBack)
                ProfilePageInit();

        }

        protected void ProfilePageInit()
        {
            Email.Text = UserEmail;
            Role.Text = UserRole;
            if (UserProfileManager.HasUserCustomProfile(UserId))
            {
                UserProfile profile = UserProfileManager.GetUserProfile(UserId);
                txtMinPrice.Text = profile.MinPrice.ToString();
                txtMaxPrice.Text = profile.MaxPrice.ToString();
                //ddlCities.Items.FindByText(profile.City.ToString()).Selected = true;
                ddlCities.SelectedIndex = (int)profile.IdCity - 1;
                ddlRating.SelectedIndex = (int)profile.MinRating - 1;
                //dropdownlist.ClearSelection(); //making sure the previous selection has been cleared
                //dropdownlist.Items.FindByValue(value).Selected = true;
                
            }
            if (UserRole != "Admin")
            {
                LinkAdmin.Visible = false;
            }

            if (UserRole != "Admin" && UserRole != "Partner")
            {
                LinkAddPlace.Visible = false;
                if (UserProfileManager.HasPartnerRequestedAcces(UserId) == false)
                    BecomePartner.Visible = true;
                    
            }
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                IdentityResult result = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text);
                if (result.Succeeded)
                {
                    //var user = manager.FindById(User.Identity.GetUserId());
                    //signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    //Response.Redirect("~/Account/Manage?m=ChangePwdSuccess");
                    ErrorMessage.Text = "Password changed successfully!";
                }
                else
                {
                    AddErrors(result);
                }
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            UserProfile profile = new UserProfile();
            profile.IdUser = UserId;
            profile.IdCity = Convert.ToInt32(ddlCities.SelectedItem.Value);
            profile.City = ddlCities.SelectedItem.Text;
            profile.MinRating = Convert.ToInt32(ddlRating.SelectedItem.Value);
            profile.MinPrice = Convert.ToInt32(txtMinPrice.Text);
            profile.MaxPrice = Convert.ToInt32(txtMaxPrice.Text);
            UserProfileManager.UpdateProfile(profile);

            SuccesMessage.Text = "Profile successfully updated";
            SuccesMessage.Visible = true;;

        }

        protected void btnResetProfile_Click(object sender, EventArgs e)
        {
            if (UserProfileManager.HasUserCustomProfile(UserId))
            {
                UserProfileManager.DeleteUserProfile(UserId);
                Response.Redirect("Manage.aspx");
            }
            
        }

        protected void LinkProfile_Click(object sender, EventArgs e)
        {
            ProfileForm.Visible = true;
            ChangePasswordForm.Visible = false;
            ErrorMessage.Text = "";
            ManageUsersForm.Visible = false;
            AddPlaceForm.Visible = false;

        }

        protected void LinkPassword_Click(object sender, EventArgs e)
        {
            ChangePasswordForm.Visible = true;
            ProfileForm.Visible = false;
            SuccesMessage.Visible = false;
            lblRequestedSucces.Visible = false;
            ManageUsersForm.Visible = false;
            AddPlaceForm.Visible = false;
        }

        protected void LinkAdmin_Click(object sender, EventArgs e)
        {
            ManageUsersForm.Visible = true;
            ProfileForm.Visible = false;
            ChangePasswordForm.Visible = false;
            AddPlaceForm.Visible = false;
        }

        protected void LinkAddPlace_Click(object sender, EventArgs e)
        {
            ManageUsersForm.Visible = false;
            ProfileForm.Visible = false;
            ChangePasswordForm.Visible = false;
            AddPlaceForm.Visible = true;
        }

        protected void odsUsers_Selecting(object sender, System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected string GetUserRole(string userId)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            if (manager.IsEmailConfirmed(userId))
                return manager.GetRoles(userId).FirstOrDefault().ToString();
            else
                return "";
        }

        protected bool IsButtonVisible(string userId)
        {
            string role = GetUserRole(userId);
            if (role == "User" || role =="Partner") return true;
            else return false;
        }
        protected string GetLinkText(string userId)
        {
            string role = GetUserRole(userId);
            if (role == "User") return "Make partner";
            else return "Make user";
        }
       

        protected void grdUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MakePartner")
            {
                string id = e.CommandArgument.ToString();
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                if (GetUserRole(id) == "User")
                {
                    manager.RemoveFromRole(id, "User");
                    manager.AddToRole(id, "Partner");
                    grdUsers.DataBind();
                }
                else
                {
                    manager.RemoveFromRole(id, "Partner");
                    manager.AddToRole(id, "User");
                    grdUsers.DataBind();
                }
            }
            
        }

        protected void grdUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            string id = grdUsers.DataKeys[e.RowIndex].Values["Id"].ToString();
            UsersManager.DeleteUser(id);
            grdUsers.DataBind();
            e.Cancel = true;
        }

        protected string GetAdminId()
        {
            var users = UsersManager.GetAllUsers();
            foreach (var user in users)
            {
                var role = Context.GetOwinContext().GetUserManager<ApplicationUserManager>().GetRoles(user.Id).FirstOrDefault().ToString();
                if (role == "Admin") return user.Id;
            }
            return "";
        }

        protected void BecomePartner_Click(object sender, EventArgs e)
        {
            UserProfileManager.SetRequestedTrue(UserId);
            lblRequestedSucces.Text = "Partner request has been sent!";
            lblRequestedSucces.Visible = true;
            BecomePartner.Visible = false;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SendEmail(GetAdminId(), "Partnership", "User " + UserEmail + " made a partner request.");
        }


        protected void btnAddPlace_Click(object sender, EventArgs e)
        {
            Place place = new Place();
            place.Type = ddlPlaceTypes.SelectedItem.Text;
            place.IdCity = Convert.ToInt32(ddlPlaceCities.SelectedItem.Value);
            place.Name = PlaceName.Text;
            place.Adress = PlaceAdress.Text;
            place.Telephone = PlaceTelephone.Text;
            place.Website = PlaceWebsite.Text;
            place.Rating = 1;
            place.RatingFloat = 1;
            place.AveragePrice = Convert.ToInt32(PlaceAveragePrice.Text);
            if (PlaceLat.Text != null) place.Lat = PlaceLat.Text;
            if (PlaceLong.Text != null) place.Long = PlaceLong.Text;
            place.OpenTime = TimeSpan.Parse(PlaceOpenTime.Text.ToString());
            place.CloseTime = TimeSpan.Parse(PlaceCloseTime.Text.ToString());
            place.Confirmed = true;
            place.IdPartner = UserId;
            place.Description = PlaceDescription.Text;
            // Check file exist or not  
            if (PlaceUploadPhoto.PostedFile != null)
            {
                // Check the extension of image  
                string extension = Path.GetExtension(PlaceUploadPhoto.FileName);
                if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg")
                {
                    Stream strm = PlaceUploadPhoto.PostedFile.InputStream;
                    using (var image = System.Drawing.Image.FromStream(strm))
                    { 
                        // Resize image
                        int newWidth = 1500; // New Width of Image in Pixel  
                        int newHeight = 1000; // New Height of Image in Pixel  
                        var thumbImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imgRectangle);
                        // Save the file  
                        string filename = place.Name + Guid.NewGuid().ToString() + extension;
                        string targetPath = Server.MapPath(@"~\Content\Images\Places\" + filename) ;
                        place.Photo = "~/Content/Images/Places/" + filename;
                        thumbImg.Save(targetPath, image.RawFormat);
                    }
                }
            }
            PlacesManager.AddPlace(place);
            if (PlaceUploadPhotos.PostedFiles != null)
            {
                foreach (var file in PlaceUploadPhotos.PostedFiles)
                {
                    PlacesPhoto photo = new PlacesPhoto();
                    photo.IdPlace = PlacesManager.GetLastIdPlaceForUserId(UserId);
                    photo.IdUser = UserId;
                    // Check the extension of image  
                    string extension = Path.GetExtension(file.FileName);
                    photo.Extension = extension;
                    photo.UploadDate = DateTime.Now;
                    if (extension.ToLower() == ".png" || extension.ToLower() == ".jpg")
                    {
                        Stream strm = file.InputStream;
                        using (var image = System.Drawing.Image.FromStream(strm))
                        {
                            // Resize image
                            int newWidth = 730; // New Width of Image in Pixel  
                            int newHeight = 346; // New Height of Image in Pixel  
                            var thumbImg = new Bitmap(newWidth, newHeight);
                            var thumbGraph = Graphics.FromImage(thumbImg);
                            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                            thumbGraph.DrawImage(image, imgRectangle);
                            // Save the file  
                            string filename = place.Name + Guid.NewGuid().ToString() + extension;
                            photo.Name = filename;
                            string targetPath = Server.MapPath(@"~\Content\Images\PlacesPhotos\" + filename);
                            photo.Path = "~/Content/Images/PlacesPhotos/" + filename;
                            thumbImg.Save(targetPath, image.RawFormat);
                        }
                    }
                    PlacesManager.AddPlacePhoto(photo);
                }
            }
            Response.Redirect("~/Pages/ShowPlaces.aspx?cityId=" + place.IdCity);
        }
    }
}