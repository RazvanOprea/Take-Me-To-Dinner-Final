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
                Session["rating"] = 1;
            }
        }

        protected void odsPlaces_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["cityId"] = Session["cityId"];
            e.InputParameters["rating"] = Session["rating"];
        }

        protected String FormatTime(TimeSpan? input)
        {
            return input.Value.ToString(@"hh\:mm");
        }


        protected void btnApply_Click(object sender, EventArgs e)
        {
            //int cmbval = Convert.ToInt32(ddlCities.SelectedItem.Value);
            //int minval = Convert.ToInt32(txtMinPrice.Text);
            //int maxval = Convert.ToInt32(txtMaxPrice.Text);
            //int rating = Convert.ToInt32(ratingText.Text);
            Session["cityId"] = Convert.ToInt32(ddlCities.SelectedItem.Value);
            Session["rating"] = Convert.ToInt32(ratingText.Text);
            // TO DO : la selecting sa adaug si min-max price
            Session["minPrice"] = Convert.ToInt32(txtMinPrice.Text);
            Session["maxPrice"] = Convert.ToInt32(txtMaxPrice.Text);

            lwPlaces.DataBind();
        }
    }
}