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
    public partial class aracbakimdeneme : System.Web.UI.Page
    {
        //protected void Page_PreInit(Object sender, EventArgs e)
        //{
        //    this.MasterPageFile = "~/Sablon.Master";

        //    if (Session["role"] == null)
        //    {
        //        this.MasterPageFile = "~/unauthorized.Master";
        //    }

        //    else if (Session["role"].Equals(2) || Session["role"].Equals(3) || Session["role"].Equals(4))
        //    {
        //        this.MasterPageFile = "~/unauthorized.Master";
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewAracBilgi.DataSource = arackayit.getAracVeBolumler();
                GridViewAracBilgi.DataBind();
                
                //DropDownList modelYilddl = GridViewAracBilgi.FooterRow.FindControl("DropDownListYil") as DropDownList;
                //for (int i = 0; i < 150; i++)
                //{
                //    modelYilddl.Items.Insert(i, new ListItem((i + 1980).ToString(), (i + 1).ToString()));
                //}
            }

        }

        protected void LinkButtonEkle_Click(object sender, EventArgs e)
        {
            otoservisdbEntities db = new otoservisdbEntities();

            try
            {
                TextBox aracID = GridViewAracBilgi.FooterRow.FindControl("TextBox1") as TextBox;
                TextBox plaka = GridViewAracBilgi.FooterRow.FindControl("TextBox3") as TextBox;
                TextBox markaID = GridViewAracBilgi.FooterRow.FindControl("TextBox5") as TextBox;
                TextBox modelID = GridViewAracBilgi.FooterRow.FindControl("TextBox7") as TextBox;
                TextBox musteriID = GridViewAracBilgi.FooterRow.FindControl("TextBox9") as TextBox;
                TextBox modelYil = GridViewAracBilgi.FooterRow.FindControl("TextBox11") as TextBox;
                
                //DropDownList modelYilddl = GridViewAracBilgi.FooterRow.FindControl("DropDownListYil") as DropDownList;
                
                TextBox ruhsatNo = GridViewAracBilgi.FooterRow.FindControl("TextBox13") as TextBox;
                TextBox saseNo = GridViewAracBilgi.FooterRow.FindControl("TextBox15") as TextBox;
                TextBox motorNo = GridViewAracBilgi.FooterRow.FindControl("TextBox17") as TextBox;


                string maid1 = markaID.Text.ToString();
                string moid1 = modelID.Text.ToString();
                string musid1 = musteriID.Text.ToString();
                string sene = modelYil.Text.ToString();

                //string sene = modelYilddl.SelectedItem.ToString();

                string aracplaka = plaka.Text.ToString();
                string ruhsatno = ruhsatNo.Text.ToString();
                string saseno = saseNo.Text.ToString();
                string motorno = motorNo.Text.ToString();

                if (maid1 == "" || moid1 == "" || musid1 == "" || sene == "")
                {
                    //ShowMessageBox(Page, "Marka, model, müşteri ya da yıl seçimini unuttunuz, lütfen tekrar deneyin");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Marka, model, müşteri ya da yıl seçimini unuttunuz', 'HATALI GİRİŞ');", true);
                }
                else if (aracplaka == "" || ruhsatno == "" || saseno == "" || motorno == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Plaka, Ruhsat No, Şase No ya da Motor No girmeyi unuttunuz', 'HATALI GİRİŞ');", true);
                }

                else
                {
                    int cevap = arackayit.ekleArac(aracplaka, Convert.ToInt32(maid1), Convert.ToInt32(moid1), Convert.ToInt32(musid1), Convert.ToInt32(sene), ruhsatno, saseno, motorno);

                    if (cevap == 1)
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Kayıt Başarıyla Eklendi', 'İşlem Başarılı');", true);

                    }

                    else if (cevap == 2)
                    {
                        //ShowMessageBox(Page, "Girilen plakaya ait kayıt zaten mevcut, lütfen listeden seçip tekrar deneyin");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Girilen plakaya ait kayıt zaten mevcut, lütfen listeden seçip tekrar deneyin', 'HATALI GİRİŞ');", true);
                    }

                    else
                    {
                        //ShowMessageBox(Page, "Kayıt eklenirken bir hata oluştu");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Kayıt eklenirken beklenmeyen bir hata oluştu', 'HATA');", true);
                    }

                    GridViewAracBilgi.DataSource= arackayit.getAracKayitAll();
                    GridViewAracBilgi.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Hata')", true);
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
            //TextBox aracID = GridViewAracBilgi.FooterRow.FindControl("TextBox1") as TextBox;
            //TextBox plaka = GridViewAracBilgi.FooterRow.FindControl("TextBox3") as TextBox;
            //TextBox markaID = GridViewAracBilgi.FooterRow.FindControl("TextBox5") as TextBox;
            //TextBox modelID = GridViewAracBilgi.FooterRow.FindControl("TextBox7") as TextBox;
            //TextBox musteriID = GridViewAracBilgi.FooterRow.FindControl("TextBox9") as TextBox;
            ////TextBox modelYil = GridViewAracBilgi.FooterRow.FindControl("TextBox11") as TextBox;
            //DropDownList modelYilddl = GridViewAracBilgi.FooterRow.FindControl("DropDownListYil") as DropDownList;
            //TextBox ruhsatNo = GridViewAracBilgi.FooterRow.FindControl("TextBox13") as TextBox;
            //TextBox saseNo = GridViewAracBilgi.FooterRow.FindControl("TextBox15") as TextBox;
            //TextBox motorNo = GridViewAracBilgi.FooterRow.FindControl("TextBox17") as TextBox;
        }

        protected void GridViewKullanici_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Label aracID = GridViewAracBilgi.Rows[e.RowIndex].FindControl("Label2") as Label;

                int aracid = Convert.ToInt32(aracID.Text);

                arackayit.silAracKayit(aracid);
                GridViewAracBilgi.DataSource = arackayit.getAracVeBolumler();
                GridViewAracBilgi.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Silme başarısız')", true);
            }

        }

        protected void GridViewKullanici_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewAracBilgi.EditIndex = e.NewEditIndex;
            GridViewAracBilgi.DataSource = arackayit.getAracVeBolumler();
            GridViewAracBilgi.DataBind();
            GridViewAracBilgi.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }
        protected void GridViewKullanici_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewAracBilgi.EditIndex = -1;
            GridViewAracBilgi.DataSource = arackayit.getAracVeBolumler();
            GridViewAracBilgi.DataBind();
        }
        protected void GridViewKullanici_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                //DropDownList modelYilddl2 = GridViewAracBilgi.Rows[e.RowIndex].FindControl("DropDownListYil2") as DropDownList;

                //for (int i = 0; i < 150; i++)
                //{
                //    modelYilddl2.Items.Insert(i, new ListItem((i + 1980).ToString(), (i + 1).ToString()));
                //}

                Label aracID = GridViewAracBilgi.Rows[e.RowIndex].FindControl("Label1") as Label;
                TextBox plaka = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
                TextBox markaID = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
                TextBox modelID = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;
                TextBox musteriID = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox8") as TextBox;
                TextBox modelYil = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox10") as TextBox;
                
                //DropDownList modelYilddl = GridViewAracBilgi.Rows[e.RowIndex].FindControl("DropDownListYil2") as DropDownList;
                
                TextBox ruhsatNo = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox12") as TextBox;
                TextBox saseNo = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox14") as TextBox;
                TextBox motorNo = GridViewAracBilgi.Rows[e.RowIndex].FindControl("TextBox16") as TextBox;

                

                
                if (aracID.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Araç ID alınırken bir hata meydana geldi', 'HATA');", true);
                }

                else if (plaka.Text == "" || markaID.Text == "" || modelID.Text == "" || musteriID.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Plaka, Marka ID, Model ID ve Müşteri ID boş bırakılamaz', 'HATA');", true);
                }
                else
                {
                    otoservisdbEntities db = new otoservisdbEntities();
                    var query1 = db.aracmodels.ToList()
                             .Where(x => x.modelID == Convert.ToInt32(modelID.Text))
                              .Select(x => x.markaID).Single();

                    if (query1 != Convert.ToInt32(markaID.Text))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Model ile marka bilgisi uyuşmuyor', 'HATA');", true);
                    }
                    else
                    {
                        int s1 = Convert.ToInt32(aracID.Text);
                        string s2 = Convert.ToString(plaka.Text);
                        int s3 = Convert.ToInt32(markaID.Text);
                        int s4 = Convert.ToInt32(modelID.Text);
                        int s5 = Convert.ToInt32(musteriID.Text);
                        int s6 = Convert.ToInt32(modelYil.Text);

                        //int s6 = Convert.ToInt32(modelYilddl.SelectedItem);

                        string s7 = Convert.ToString(ruhsatNo.Text);
                        string s8 = Convert.ToString(saseNo.Text);
                        string s9 = Convert.ToString(motorNo.Text);

                        arackayit.guncelleArac(s1, s2, s3, s4, s5, s6, s7, s8, s9);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Satır bilgisi başarıyla güncellendi', 'İŞLEM BAŞARILI');", true);

                        GridViewAracBilgi.EditIndex = -1;
                        GridViewAracBilgi.DataSource = arackayit.getAracVeBolumler();
                        GridViewAracBilgi.DataBind();
                    }
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
            GridViewAracBilgi.PageIndex = e.NewPageIndex;

            GridViewAracBilgi.DataSource = arackayit.getAracVeBolumler();
            GridViewAracBilgi.DataBind();

            //DropDownList modelYilddl = GridViewAracBilgi.FooterRow.FindControl("DropDownListYil") as DropDownList;

            //for (int i = 0; i < 150; i++)
            //{
            //    modelYilddl.Items.Insert(i, new ListItem((i + 1980).ToString(), (i + 1).ToString()));
            //}
        }
    }
}