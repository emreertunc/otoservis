using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Proje.Business;
using Proje.DataAccess;

namespace Proje.Web.Tasarim
{
    public partial class _default : System.Web.UI.Page
    {

        //protected void Page_PreInit(Object sender, EventArgs e)
        //{
        //    this.MasterPageFile = "~/Sablon.Master";
            
        //    if(Session["role"] == null)
        //    {
        //        this.MasterPageFile = "~/unauthorized.Master";
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["role"] == null)
            {
                divGuestUyari.Visible = true;
            }
            else
            {
                divGuestUyari.Visible = false;
            }
        }
    }
}