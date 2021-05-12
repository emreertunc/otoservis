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
    public partial class kullaniciyonetim : System.Web.UI.Page
    {
        protected void Page_PreInit(Object sender, EventArgs e)
        {
            this.MasterPageFile = "~/Sablon.Master";

            if (Session["role"] == null)
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }

            else if (Session["role"].Equals(2) || Session["role"].Equals(3) || Session["role"].Equals(4))
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
                GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
                GridViewKullanici.DataBind();

                GridViewBolumID.DataSource = kullanicibilgi.getBolumIDList();
                GridViewPozisyonID.DataSource = kullanicibilgi.getPozisyonIDList();
                GridViewPozisyonID.DataBind();
                GridViewBolumID.DataBind();
            }

        }

        protected void LinkButtonEkle_Click(object sender, EventArgs e)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();

                TextBox kullaniciID = GridViewKullanici.FooterRow.FindControl("TextBox1") as TextBox;
                TextBox kullaniciAdi = GridViewKullanici.FooterRow.FindControl("TextBox3") as TextBox;
                TextBox parola = GridViewKullanici.FooterRow.FindControl("TextBox5") as TextBox;
                TextBox tckn = GridViewKullanici.FooterRow.FindControl("TextBox7") as TextBox;
                TextBox adSoyad = GridViewKullanici.FooterRow.FindControl("TextBox9") as TextBox;
                TextBox iseGirisTarihi = GridViewKullanici.FooterRow.FindControl("TextBox11") as TextBox;
                TextBox bolumID = GridViewKullanici.FooterRow.FindControl("TextBox13") as TextBox;
                TextBox pozisyonID = GridViewKullanici.FooterRow.FindControl("TextBox15") as TextBox;
                TextBox telno = GridViewKullanici.FooterRow.FindControl("TextBox17") as TextBox;

                string s1 = Convert.ToString(kullaniciID.Text);
                string s2 = Convert.ToString(kullaniciAdi.Text);
                string s3 = Convert.ToString(parola.Text);
                string s4 = Convert.ToString(tckn.Text);
                string s5 = Convert.ToString(adSoyad.Text);
                string s6 = Convert.ToString(iseGirisTarihi.Text);
                string s7 = Convert.ToString(bolumID.Text);
                string s8 = Convert.ToString(pozisyonID.Text);
                string s9 = Convert.ToString(telno.Text);

                List<string> ifkullaniciexists = db.kullanicis.ToList()
                                .Where(x => x.tckn == tckn.Text)
                                .Select(x => x.tckn).ToList();

                List<string> ifkullaniciadexists = db.kullanicis.ToList()
                                .Where(x => x.kullaniciAdi == kullaniciAdi.Text)
                                .Select(x => x.kullaniciAdi).ToList();

                List<string> ifmusteriexists = db.musteris.ToList()
                        .Where(x => x.tckn == tckn.Text)
                        .Select(x => x.tckn).ToList();

                List<int> ifbolumexists = db.bolumlers.ToList()
                        .Where(x => x.bolumID == Convert.ToInt32(bolumID.Text))
                        .Select(x => x.bolumID).ToList();

                List<int> ifpozisyonexists = db.pozisyonlars.ToList()
                        .Where(x => x.pozisyonID == Convert.ToInt32(pozisyonID.Text))
                        .Select(x => x.pozisyonID).ToList();

                List<string> iftelexists = db.kullanicis.ToList()
                        .Where(x => x.telno == telno.Text)
                        .Select(x => x.telno).ToList();

                // kullaniciAdi, parola, tckn, adSoyad, iseGirisTarihi, Convert.ToInt32(bolumID), Convert.ToInt32(pozisyonID), telno

                if (s2 == "" || s3 == "" || s4 == "" || s5 == "" || s6 == "" || s7 == "" || s8 == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Eksik girişler mevcut', 'HATA');", true);
                }

                else if (tckn.Text.Length != 11)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('TC Kimlik No 11 hane olmalı', '');", true);
                }

                else if (telno.Text.Length != 10)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Telefon Numarası 10 haneli olmalı 532xxxxxxx şeklinde girilmeli', '');", true);
                }

                else if (ifkullaniciexists.Count != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu TC Noya sahip bir müşteri mevcut', 'HATA');", true);
                }

                else if (ifkullaniciadexists.Count != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu kullanıcı adı alınmış', 'HATA');", true);
                }

                else if (ifbolumexists.Count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Böyle bir bölüm bulunmamakta', 'HATA');", true);
                }

                else if (ifpozisyonexists.Count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Böyle bir pozisyon bulunmamakta', 'HATA');", true);
                }

                else if (iftelexists.Count != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu Telefon numarası sistemde mevcut', 'HATA');", true);
                }

                else if (ifmusteriexists.Count == 0)
                {
                    kullanicibilgi.AddKullanici(s2, s3, s4, s5, s6, Convert.ToInt32(s7), Convert.ToInt32(s8), s9);
                    dbmusteri2.AddMusteri(tckn.Text, adSoyad.Text);
                    GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
                    GridViewKullanici.DataBind();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Kullanıcı başarıyla eklendi', '');", true);
                }

                else if (ifmusteriexists.Count != 0)
                {
                    kullanicibilgi.AddKullanici(s2, s3, s4, s5, s6, Convert.ToInt32(s7), Convert.ToInt32(s8), s9);
                    GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
                    GridViewKullanici.DataBind();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Kullanıcı başarıyla eklendi', '');", true);
                }

                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Beklenmedik bir hata oluştu', 'HATA');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Ekleme Başarısız')", true);
            }
        }

        protected void LinkButtonGuncelle_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButtonVazgec_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButtonDuzenle_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButtonVazgec_Click1(object sender, EventArgs e)
        {
            Label kullaniciID = GridViewKullanici.FooterRow.FindControl("Label1") as Label;
            TextBox kullaniciAdi = GridViewKullanici.FooterRow.FindControl("TextBox3") as TextBox;
            TextBox parola = GridViewKullanici.FooterRow.FindControl("TextBox5") as TextBox;
            TextBox tckn = GridViewKullanici.FooterRow.FindControl("TextBox7") as TextBox;
            TextBox adSoyad = GridViewKullanici.FooterRow.FindControl("TextBox9") as TextBox;
            TextBox iseGirisTarihi = GridViewKullanici.FooterRow.FindControl("TextBox11") as TextBox;
            TextBox bolumID = GridViewKullanici.FooterRow.FindControl("TextBox13") as TextBox;
            TextBox pozisyonID = GridViewKullanici.FooterRow.FindControl("TextBox15") as TextBox;
            TextBox telno = GridViewKullanici.FooterRow.FindControl("TextBox17") as TextBox;
        }

        protected void GridViewKullanici_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Label kullaniciID = GridViewKullanici.Rows[e.RowIndex].FindControl("Label2") as Label;

                //string mid = musteriID.Text;

                int kid = Convert.ToInt32(kullaniciID.Text);

                kullanicibilgi.silKullanici(kid);
                //GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
                GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
                GridViewKullanici.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Silme başarısız')", true);
            }

        }

        protected void GridViewKullanici_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewKullanici.EditIndex = e.NewEditIndex;
            //GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
            GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
            GridViewKullanici.DataBind();
            //Label11.Text = "";
            GridViewKullanici.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }
        protected void GridViewKullanici_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewKullanici.EditIndex = -1;
            //GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
            GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
            GridViewKullanici.DataBind();
            //Label11.Text = "";
        }
        protected void GridViewKullanici_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label kullaniciID = GridViewKullanici.Rows[e.RowIndex].FindControl("Label1") as Label;
                TextBox kullaniciAdi = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
                TextBox parola = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
                TextBox tckn = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;
                TextBox adSoyad = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox8") as TextBox;
                TextBox iseGirisTarihi = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox10") as TextBox;
                TextBox bolumID = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox12") as TextBox;
                TextBox pozisyonID = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox14") as TextBox;
                TextBox telno = GridViewKullanici.Rows[e.RowIndex].FindControl("TextBox16") as TextBox;

                int s1 = Convert.ToInt32(kullaniciID.Text);
                string s2 = Convert.ToString(kullaniciAdi.Text);
                string s3 = Convert.ToString(parola.Text);
                string s4 = Convert.ToString(tckn.Text);
                string s5 = Convert.ToString(adSoyad.Text);
                string s6 = Convert.ToString(iseGirisTarihi.Text);
                string s7 = Convert.ToString(bolumID.Text);
                string s8 = Convert.ToString(pozisyonID.Text);
                string s9 = Convert.ToString(telno.Text);


                if (s2 == "" || s3 == "" || s4 == "" || s5 == "" || s6 == "" || s7 == "" || s8 == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Eksik girişler mevcut', 'HATA');", true);
                }

                else if (tckn.Text.Length != 11)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('TC Kimlik No 11 hane olmalı', '');", true);
                }

                else if (telno.Text.Length != 10)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Telefon Numarası 10 haneli olmalı 532xxxxxxx şeklinde girilmeli', '');", true);
                }

                else
                {
                    kullanicibilgi.guncelleKullanici(s1, s2, s3, s4, s5, s6, Convert.ToInt32(s7), Convert.ToInt32(s8), s9);
                    //Label11.Text = "Satır bilgisi başarıyla güncellendi";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Satır bilgisi başarıyla güncellendi', 'İŞLEM BAŞARILI');", true);

                    GridViewKullanici.EditIndex = -1;
                    //GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
                    GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
                    GridViewKullanici.DataBind();
                }
                    
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Güncelleme Başarısız')", true);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Güncelleme Başarısız', 'HATA');", true);
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridViewKullanici.PageIndex = e.NewPageIndex;

            //GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
            GridViewKullanici.DataSource = kullanicibilgi.GetKullaniciVeBolumler();
            GridViewKullanici.DataBind();
        }
    }
}