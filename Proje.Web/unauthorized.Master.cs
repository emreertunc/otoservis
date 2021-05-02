using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proje.Web
{
    public partial class Unauthorized : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divGuestName.Visible = false;
            divGuestUyari.Visible = false;
            divUnauthorized.Visible = false;
            divMainMenuSearch.Visible = false;

            try
            {
                if (Session["role"] == null)
                {
                    //divNavbar.Visible = false;
                    //labelUname1.Text = "GUEST";
                    labelUname2.Text = "GUEST";
                    labelPozisyon.Text = "";
                    divStandartUsername.Visible = false;
                    divGuestName.Visible = true;
                    //divUserSettingsinMenu.Visible = false;
                    divMainMenuSearch.Visible = false;
                    this.Image1.Attributes["src"] = "assets/images/misafir100_100.jpg";
                    divGuestUyari.Visible = true;


                    divCalisan.Visible = false;
                    divMusteri.Visible = false;
                    divAdmin.Visible = false;

                    divContentGoster.Visible = false;
                }

                else if (Session["role"].Equals(2))
                {
                    labelUname2.Text = Session["fullname"].ToString();
                    labelPozisyon.Text = Session["pozisyon"].ToString();

                    this.Image1.Attributes["src"] = "assets/images/" + Session["tckn"].ToString() + ".jpg";
                    this.Image2.Attributes["src"] = "assets/images/" + Session["tckn"].ToString() + ".jpg";

                    divCalisan.Visible = false;
                    divAdmin.Visible = false;

                    divUnauthorized.Visible = true;
                    divContentGoster.Visible = false;
                }

                else if (Session["role"].Equals(3) || Session["role"].Equals(4))
                {
                    labelUname2.Text = Session["fullname"].ToString();
                    labelPozisyon.Text = Session["pozisyon"].ToString();
                    this.Image1.Attributes["src"] = "assets/images/usta100.jpg";
                    this.Image2.Attributes["src"] = "assets/images/usta100.jpg";

                    divAdmin.Visible = false;

                    divUnauthorized.Visible = true;
                    divContentGoster.Visible = false;
                }
            }

            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('hata')", true);
            }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Cookies.Clear();
            Response.Redirect("default.aspx");
        }
    }
}