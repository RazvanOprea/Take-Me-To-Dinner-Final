using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
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
            Email.Text = UserEmail;
            Role.Text = UserRole;
            //Role.ForeColor = (Role.Text == "Admin" ? System.Drawing.Color.Red : System.Drawing.Color.Black);
        }

        protected string RoleColor(string userRole)
        {
            switch (userRole)
            {
                case "Admin": return "Red";
                case "Partner": return "Green";
                default: return "Black";
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
    }
}