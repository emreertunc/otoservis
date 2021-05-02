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
    public partial class settingsdeneme : System.Web.UI.Page
    {
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
                tc = "26499883324";
                //tc = Session["tckn"].ToString();

                kullanici k1 = new kullanici();
                k1 = kullanicibilgi.getKullaniciAsClass(tc);

                LabelAd.Text = k1.adSoyad+" için düzenleme yapılıyor";

                kullaniciid = k1.kullaniciID;
                kullaniciadi= k1.kullaniciAdi;
                parola = k1.parola;
                adsoyad= k1.adSoyad;
                telno = k1.telno;
                isegiristarihi = k1.iseGirisTarihi.ToString();

                txtAdSoyad.Text = adsoyad;
                txtParola.Text = parola;
                txtTCKN.Text = tc;
                txtTelno.Text = telno;
                txtUserName.Text = kullaniciadi;
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtTCKN.Text.Length!=11 || txtAdSoyad.Text == "" || txtParola.Text == "" || txtTelno.Text.Length != 10)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Boş ya da hatalı girişler var')", true);
                }
                else
                {
                    kullanicibilgi.guncelleKullanici(kullaniciid, kullaniciadi, parola, tc, adsoyad, isegiristarihi, bolumid, pozisyonid, telno);
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}