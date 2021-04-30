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
    public partial class signindeneme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            if (txt_UserName.Text == "" || txt_Password.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Lütfen tüm alanları doldurun')", true);
            }

            try
            {
                int role = login.getLoginRole(txt_UserName.Text, txt_Password.Text);
                
                if(role == 00404)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Kullanıcı adı ve/veya parola hatalı')", true);
                }

                else
                {
                    Label1.Text = role.ToString();

                    List<kullanici> Credentials = login.getLoginCredentials(txt_UserName.Text, txt_Password.Text);

                    Label2.Text = Credentials[0].adSoyad;
                    Label3.Text = Credentials[0].bolumID.ToString();

                    Session["role"] = role;
                    Session["username"] = Credentials[0].kullaniciAdi;
                    Session["fullname"] = Credentials[0].adSoyad;
                    Session["tcno"] = Credentials[0].tckn;
                    Session["bolumid"] = Credentials[0].bolumID;
                    Session["pozid"] = Credentials[0].pozisyonID;

                    Response.Redirect("default.aspx");
                }
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('exception')", true);
            }
        }
    }
}