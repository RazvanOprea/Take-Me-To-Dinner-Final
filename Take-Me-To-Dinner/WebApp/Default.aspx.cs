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

        protected void SearchComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx?cityId=" + SearchComboBox.SelectedItem.Value);
        }

        //protected void DropDownListPlaces_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Response.Redirect("About.aspx?cityId=" + DropDownListPlaces.SelectedItem.Value);
        //}
    }
}