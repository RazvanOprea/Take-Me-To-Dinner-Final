using System;
using System.Collections.Generic;
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
        }

        protected void LinkProfile_Click(object sender, EventArgs e)
        {
            ProfileForm.Visible = true;
            ChangePasswordForm.Visible = false;
            ErrorMessage.Text = "";

        }

        protected void LinkPassword_Click(object sender, EventArgs e)
        {
            ChangePasswordForm.Visible = true;
            ProfileForm.Visible = false;
            SuccesMessage.Visible = false;
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
    }
}