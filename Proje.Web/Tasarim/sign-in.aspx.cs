using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proje.DataAccess;
using Proje.Business;

namespace Proje.Web.Tasarim
{
    public partial class sign_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {

                }

                else if (Session["role"].Equals(1) || Session["role"].Equals(2) || Session["role"].Equals(3) || Session["role"].Equals(4))
                {
                    Session.Abandon();
                    Session.Clear();
                    Response.Cookies.Clear();
                }
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('hata')", true);
            }
        }
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (textboxUserName.Text == "" || textboxPassword.Text == "")
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Lütfen tüm alanları doldurun')", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Lütfen tüm alanları doldurun', 'EKSİK GİRİŞ');", true);
            }

            try
            {
                int role = login.getLoginRole(textboxUserName.Text, textboxPassword.Text);

                if (role == 00404)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Kullanıcı adı ve/veya parola hatalı')", true);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Kullanıcı adı ve/veya parola hatalı', 'HATA');", true);
                }

                else
                {
                    List<kullanici> Credentials = login.getLoginCredentials(textboxUserName.Text, textboxPassword.Text);

                    Session["role"] = role;
                    Session["username"] = Credentials[0].kullaniciAdi;
                    Session["fullname"] = Credentials[0].adSoyad;
                    Session["tckn"] = Credentials[0].tckn;
                    Session["bolumid"] = Credentials[0].bolumID;
                    Session["pozid"] = Credentials[0].pozisyonID;

                    Session["pozisyon"] = login.getPozisyonAd(role);
                    //Response.AddHeader("REFRESH", "10;URL=default.aspx");
                    Response.Redirect("default.aspx");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('exception')", true);
            }
        }
    }
}