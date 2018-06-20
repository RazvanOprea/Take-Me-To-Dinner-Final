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
            }
        }

        protected void odsPlaces_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["cityId"] = Session["cityId"];
        }

        protected String FormatTime(TimeSpan? input)
        {
            return input.Value.ToString(@"hh\:mm");
        }

        protected void ddlCities_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            Session["cityId"] = ddl.SelectedItem.Value;
            lwPlaces.DataBind();
        }

        protected void btnCity_Click(object sender, EventArgs e)
        {
            int cmbval = Convert.ToInt32(ddlCities.SelectedItem.Value);
            int minval = Convert.ToInt32(txtMinPrice.Text);
            int maxval = Convert.ToInt32(txtMaxPrice.Text);
            Session["cityId"] = cmbval;
            lwPlaces.DataBind();
        }
    }
}