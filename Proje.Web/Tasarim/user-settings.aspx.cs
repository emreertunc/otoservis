using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proje.Business;
using Proje.DataAccess;

namespace Proje.Web.Tasarim
{
    public partial class user_settings : System.Web.UI.Page
    {
        protected void Page_PreInit(Object sender, EventArgs e)
        {
            this.MasterPageFile = "~/Sablon.Master";

            if (Session["role"] == null)
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }
        }


        public static int kullaniciid;
        public static string kullaniciadi;
        public static string parola;
        public static string tc;
        public static string adsoyad;
        public static string isegiristarihi;
        public static int bolumid;
        public static int pozisyonid;
        public static string telno;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["role"] != null)
                {
                    divUnauthorized.Visible = false;
                    tc = Session["tckn"].ToString();
                    //tc = "26499883324";

                    kullanici k1 = new kullanici();
                    k1 = kullanicibilgi.getKullaniciAsClass(tc);
                    LabelAd.Text = k1.adSoyad + " için düzenleme yapılıyor";

                    kullaniciid = k1.kullaniciID;
                    kullaniciadi = k1.kullaniciAdi;
                    parola = k1.parola;
                    adsoyad = k1.adSoyad;
                    telno = k1.telno;
                    isegiristarihi = k1.iseGirisTarihi.ToString();
                    bolumid = k1.bolumID;
                    pozisyonid = k1.pozisyonID;

                    txtAdSoyad.Text = adsoyad;
                    txtParola.Text = parola;
                    txtTCKN.Text = tc;
                    txtTelno.Text = telno;
                    txtUserName.Text = kullaniciadi;
                }
                else
                {
                    divUnauthorized.Visible = true;
                    divKullaniciGuncelleme.Visible = false;
                    Response.AddHeader("Location", "10; sign-in.aspx");
                }
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                adsoyad = txtAdSoyad.Text;
                parola = txtParola.Text;
                tc = txtTCKN.Text;
                telno = txtTelno.Text;
                kullaniciadi = txtUserName.Text; 
                
                if (txtTCKN.Text.Length != 11 || txtAdSoyad.Text == "" || txtParola.Text == "" || txtTelno.Text.Length != 10)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Boş ya da hatalı girişler var')", true);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Boş ya da hatalı girişler var', 'HATA');", true);
                }
                else
                {
                    kullanicibilgi.guncelleKullanici(kullaniciid, kullaniciadi, parola, tc, adsoyad, isegiristarihi, bolumid, pozisyonid, telno);
                    //LabelBilgi.Text = "Satır bilgisi başarıyla güncellendi";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Bilgiler başarıyla güncellendi', 'İŞLEM BAŞARILI');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('güncelleme başarısız')", true);
            }
        }
    }
}