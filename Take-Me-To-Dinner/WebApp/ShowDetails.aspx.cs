using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ShowDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["placeId"] = Request.QueryString["placeId"];
            }
        }

        protected void odsPlace_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["placeId"] = Session["placeId"];
        }
    }
}