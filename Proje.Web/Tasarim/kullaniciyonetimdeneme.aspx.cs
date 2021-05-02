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
    public partial class kullaniciyonetimdeneme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
                GridViewKullanici.DataBind();
            }
            
        }

        protected void LinkButtonEkle_Click(object sender, EventArgs e)
        {
            try
            {
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

                // kullaniciAdi, parola, tckn, adSoyad, iseGirisTarihi, Convert.ToInt32(bolumID), Convert.ToInt32(pozisyonID), telno

                if (s6 != "")
                {
                    kullanicibilgi.AddKullanici(s2, s3, s4, s5, s6, Convert.ToInt32(s7), Convert.ToInt32(s8), s9);
                    GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
                    GridViewKullanici.DataBind();
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
                GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
                GridViewKullanici.DataBind();
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Silme başarısız')", true);
            }
            
        }

        protected void GridViewKullanici_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewKullanici.EditIndex = e.NewEditIndex;
            GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
            GridViewKullanici.DataBind();
            Label11.Text = "";
            GridViewKullanici.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }
        protected void GridViewKullanici_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewKullanici.EditIndex = -1;
            GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
            GridViewKullanici.DataBind();
            Label11.Text = "";
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

                if (s6 != "")
                {
                    kullanicibilgi.guncelleKullanici(s1, s2, s3, s4, s5, s6, Convert.ToInt32(s7), Convert.ToInt32(s8), s9);
                    Label11.Text = "Satır bilgisi başarıyla güncellendi";

                    GridViewKullanici.EditIndex = -1;
                    GridViewKullanici.DataSource = kullanicibilgi.GetKullanici();
                    GridViewKullanici.DataBind();
                }

                else ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('hatalı tarih girildi')", true);
            }
            
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Güncelleme Başarısız')", true);
            }
        }
    }
}