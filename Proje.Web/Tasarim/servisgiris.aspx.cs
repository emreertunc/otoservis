using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proje.DataAccess;
using Proje.Business;
using System.Data;
using System.Data.SqlClient;

namespace Proje.Web.Tasarim
{
    public partial class servisgiris : System.Web.UI.Page
    {
        otoservisdbEntities db = new otoservisdbEntities();

        /// <summary>
        /// Shows a basic MessageBox on the passed in page
        /// </summary>
        /// <param name="page">The Page object to show the message on</param>
        /// <param name="message">The message to show</param>
        /// <returns></returns>
        public static void ShowMessageBox(Page page, string message)
        {
            Type cstype = page.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = page.ClientScript;

            // Find the first unregistered script number
            int ScriptNumber = 0;
            bool ScriptRegistered = false;
            do
            {
                ScriptNumber++;
                ScriptRegistered = cs.IsStartupScriptRegistered(cstype, "PopupScript" + ScriptNumber);
            } while (ScriptRegistered == true);

            //Execute the new script number that we found
            cs.RegisterStartupScript(cstype, "PopupScript" + ScriptNumber, "alert('" + message + "');", true);
        }






        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DropDownList1.DataSource = arackayit.getPlaka();
                DropDownList1.DataBind();

                DropDownList2.DataSource = dbarac2.getMarkaListe();
                DropDownList2.DataBind();

                //DropDownList3.DataSource = dbarac2.getModel();
                //DropDownList3.DataBind();

                DropDownList4.DataSource = musterikayit.getMusteri();
                DropDownList4.DataBind();


                int year = DateTime.Now.Year;
                for (int i = year - 30; i <= year + 1; i++)
                {
                    ListItem li = new ListItem(i.ToString());
                    DropDownList5.Items.Add(li);
                }
                DropDownList5.Items.FindByText(year.ToString()).Selected = true;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox1.ReadOnly = true;
            TextBox2.ReadOnly = true;
            TextBox3.ReadOnly = true;
            TextBox4.ReadOnly = true;
            TextBox5.ReadOnly = true;
            TextBox6.ReadOnly = true;
            TextBox7.ReadOnly = true;
            TextBox8.ReadOnly = true;

            string plakasecim = DropDownList1.SelectedValue;
            int aracid = arackayit.getAracID(plakasecim);

            List<arac> aracbilgi = arackayit.getAracBilgi(aracid);

            string isimmusteri = arackayit.getAracMusteri(aracid);
            string isimmarka = arackayit.getAracMarkaAdi(aracid);
            string isimmodel = arackayit.getAracModelAdi(aracid);
            int modelyili = arackayit.getAracModelYili(aracid);

            TextBox1.Text = aracbilgi[0].plaka;
            TextBox2.Text = isimmarka;
            TextBox3.Text = isimmodel;
            TextBox4.Text = isimmusteri;
            TextBox5.Text = modelyili.ToString();
            TextBox6.Text = aracbilgi[0].ruhsatNo;
            TextBox7.Text = aracbilgi[0].saseNo;
            TextBox8.Text = aracbilgi[0].motorNo;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            /*TextBox2.Text = DropDownList2.SelectedValue;
            TextBox3.Text = DropDownList3.SelectedValue;
            TextBox4.Text = DropDownList4.SelectedValue;
            TextBox5.Text = DropDownList5.SelectedValue;*/

            string maid1 = TextBox2.Text;
            string moid1 = TextBox3.Text;
            string musid1 = TextBox4.Text;
            string sene = TextBox5.Text;

            if (maid1 == "Marka" || moid1 == "Model" || musid1 == "Müşteri" || sene == "Model Yılı")
            {
                ShowMessageBox(Page, "Marka, model, müşteri ya da yıl seçimini unuttunuz, lütfen tekrar deneyin");
                TextBox1.Text = "Plaka";
                TextBox2.Text = "Marka";
                TextBox3.Text = "Model";
                TextBox4.Text = "Müşteri";
                TextBox5.Text = "Model Yılı";
                TextBox6.Text = "Ruhsat No";
                TextBox7.Text = "Şase No";
                TextBox8.Text = "Motor No";
            }

            else
            {
                var query1 = db.aracmarkas.ToList()
                         .Where(x => x.marka == maid1)
                         .Select(x => x.markaID).Single();

                var query2 = db.aracmodels.ToList()
                             .Where(x => x.model == moid1)
                             .Select(x => x.modelID).Single();

                var query3 = db.musteris.ToList()
                             .Where(x => x.adSoyad == musid1)
                             .Select(x => x.musteriID).Single();


                string pl = TextBox1.Text;
                int maid = query1;
                int moid = query2;
                int musid = query3;
                int yil = Convert.ToInt32(TextBox5.Text);
                string ruhsat = TextBox6.Text;
                string sase = TextBox7.Text;
                string motor = TextBox8.Text;

                int cevap = arackayit.ekleArac(pl, maid, moid, musid, yil, ruhsat, sase, motor);

                if (cevap == 1)
                {
                    ShowMessageBox(Page, "Kayıt Başarıyla Eklendi");
                    Label1.Text = "Kayıt Başarıyla Eklendi";
                    TextBox1.Text = "Plaka";
                    TextBox2.Text = "Marka";
                    TextBox3.Text = "Model";
                    TextBox4.Text = "Müşteri";
                    TextBox5.Text = "Model Yılı";
                    TextBox6.Text = "Ruhsat No";
                    TextBox7.Text = "Şase No";
                    TextBox8.Text = "Motor No";



                    //servisislem.ekleServisKayit()



                }

                else if (cevap == 2)
                {
                    ShowMessageBox(Page, "Girilen plakaya ait kayıt zaten mevcut, lütfen listeden seçip tekrar deneyin");
                }

                else ShowMessageBox(Page, "Kayıt eklenirken bir hata oluştu");

                DropDownList1.DataBind();
                DropDownList2.DataBind();
                DropDownList3.DataBind();
                DropDownList4.DataBind();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox2.Text = DropDownList2.SelectedValue;

            string maid1 = TextBox2.Text;

            var query1 = db.aracmarkas.ToList()
                         .Where(x => x.marka == maid1)
                         .Select(x => x.markaID).Single();

            int maid = query1;
            DropDownList3.DataSource = arackayit.getSpesificModel(maid);
            DropDownList3.DataBind();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox3.Text = DropDownList3.SelectedValue;
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox4.Text = DropDownList4.SelectedValue;
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox5.Text = DropDownList5.SelectedValue;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string tc = TextBox9.Text;
            string isim = TextBox10.Text;

            if (tc == "TC No" || isim == "Ad Soyad")
            {
                ShowMessageBox(Page, "TCKN veya isim girmeyi unuttunuz, lütfen tekrar deneyin");
            }

            else
            {
                int cevap = musterikayit.ekleMusteri(tc, isim);

                if (cevap == 1)
                {
                    ShowMessageBox(Page, "Kayıt Başarıyla Eklendi");
                    Label2.Text = "Kayıt Başarıyla Eklendi";
                    TextBox9.Text = "TC No";
                    TextBox10.Text = "Ad Soyad";
                }

                else if (cevap == 2)
                {
                    ShowMessageBox(Page, "Girilen TC No'ya ait kayıt zaten mevcut, lütfen listeden seçip tekrar deneyin");
                }

                else ShowMessageBox(Page, "Kayıt eklenirken bir hata oluştu");

                DropDownList4.DataSource = musterikayit.getMusteri();
                DropDownList4.DataBind();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string maid1 = TextBox2.Text;
            string moid1 = TextBox3.Text;
            string musid1 = TextBox4.Text;
            string sene = TextBox5.Text;

            string pl = TextBox1.Text;
            string ruhsat = TextBox6.Text;
            string sase = TextBox7.Text;
            string motor = TextBox8.Text;

            if (maid1 == "Marka" || moid1 == "Model" || musid1 == "Müşteri" || sene == "Model Yılı" || pl == "Plaka" || ruhsat == "Ruhsat No" || sase == "Şase No" || motor == "Motor No")
            {
                ShowMessageBox(Page, "Alanlardan birini doldurmayı unuttunuz, lütfen işlemi tekrar edin");
                TextBox1.Text = "Plaka";
                TextBox2.Text = "Marka";
                TextBox3.Text = "Model";
                TextBox4.Text = "Müşteri";
                TextBox5.Text = "Model Yılı";
                TextBox6.Text = "Ruhsat No";
                TextBox7.Text = "Şase No";
                TextBox8.Text = "Motor No";
            }

            else
            {
                var query1 = db.aracs.ToList()
                            .Where(x => x.plaka == pl)
                            .Select(x => x.aracID).Single();

                int aracid = query1;

                int serviskodu = servisislem.ekleServisKayit(aracid);
                Label1.Text = "Yeni servis kaydı oluşturuldu..";

                Response.Redirect("servis.aspx?serviskod=" + serviskodu.ToString());
            }
        }
    }
}