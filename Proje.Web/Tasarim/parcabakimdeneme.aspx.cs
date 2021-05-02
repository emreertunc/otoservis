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
    public partial class parcabakimdeneme : System.Web.UI.Page
    {
        /*protected void Page_PreInit(Object sender, EventArgs e)
        {
            this.MasterPageFile = "~/Sablon.Master";

            if (Session["role"] == null)
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }

            else if (Session["role"].Equals(2) || Session["role"].Equals(4))
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }
        }*/

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                GridViewParcaAll.DataSource = parcaislem.getParcaBilgiAll();
                GridViewParcaAll.DataBind();
            }

        }

        protected void LinkButtonEkle_Click(object sender, EventArgs e)
        {
            try
            {
                TextBox parcaID = GridViewParcaAll.FooterRow.FindControl("TextBox1") as TextBox;
                TextBox parcaKodu = GridViewParcaAll.FooterRow.FindControl("TextBox3") as TextBox;
                TextBox parcaAdi = GridViewParcaAll.FooterRow.FindControl("TextBox5") as TextBox;
                TextBox fiyatAlis = GridViewParcaAll.FooterRow.FindControl("TextBox7") as TextBox;
                TextBox fiyatSatis= GridViewParcaAll.FooterRow.FindControl("TextBox9") as TextBox;
                TextBox stok = GridViewParcaAll.FooterRow.FindControl("TextBox11") as TextBox;

                string s1 = Convert.ToString(parcaID.Text);
                string s2 = Convert.ToString(parcaKodu.Text);
                string s3 = Convert.ToString(parcaAdi.Text);
                decimal s4 = Convert.ToDecimal(fiyatAlis.Text);
                decimal s5 = Convert.ToDecimal(fiyatSatis.Text);
                int s6 = Convert.ToInt32(stok.Text);
                // kullaniciAdi, parola, tckn, adSoyad, iseGirisTarihi, Convert.ToInt32(bolumID), Convert.ToInt32(pozisyonID), telno

                if (s1 != "" || s2 != "" || s3 != "" || s4 != 0 || s5 != 0)
                {
                    parcaislem.AddParca(s2, s3, s4, s5, s6);
                    GridViewParcaAll.DataSource = parcaislem.getParcaBilgiAll();
                    GridViewParcaAll.DataBind();
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
            Label parcaID = GridViewParcaAll.FooterRow.FindControl("Label1") as Label;
            TextBox parcaKodu = GridViewParcaAll.FooterRow.FindControl("TextBox3") as TextBox;
            TextBox parcaAdi = GridViewParcaAll.FooterRow.FindControl("TextBox5") as TextBox;
            TextBox fiyatAlis = GridViewParcaAll.FooterRow.FindControl("TextBox7") as TextBox;
            TextBox fiyatSatis = GridViewParcaAll.FooterRow.FindControl("TextBox9") as TextBox;
            TextBox stok = GridViewParcaAll.FooterRow.FindControl("TextBox11") as TextBox;
        }

        protected void LinkButtonDuzenle_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButtonVazgec_Click1(object sender, EventArgs e)
        {
            Label kullaniciID = GridViewParcaAll.FooterRow.FindControl("Label1") as Label;
            TextBox kullaniciAdi = GridViewParcaAll.FooterRow.FindControl("TextBox3") as TextBox;
            TextBox parola = GridViewParcaAll.FooterRow.FindControl("TextBox5") as TextBox;
            TextBox tckn = GridViewParcaAll.FooterRow.FindControl("TextBox7") as TextBox;
            TextBox adSoyad = GridViewParcaAll.FooterRow.FindControl("TextBox9") as TextBox;
            TextBox iseGirisTarihi = GridViewParcaAll.FooterRow.FindControl("TextBox11") as TextBox;
            TextBox bolumID = GridViewParcaAll.FooterRow.FindControl("TextBox13") as TextBox;
            TextBox pozisyonID = GridViewParcaAll.FooterRow.FindControl("TextBox15") as TextBox;
            TextBox telno = GridViewParcaAll.FooterRow.FindControl("TextBox17") as TextBox;
        }

        protected void GridViewKullanici_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Label parcaID = GridViewParcaAll.Rows[e.RowIndex].FindControl("Label2") as Label;

                //string mid = musteriID.Text;

                int pid = Convert.ToInt32(parcaID.Text);

                parcaislem.silParca(pid);
                GridViewParcaAll.DataSource = parcaislem.getParcaBilgiAll();
                GridViewParcaAll.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Silme başarısız')", true);
            }

        }

        protected void GridViewKullanici_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewParcaAll.EditIndex = e.NewEditIndex;
            GridViewParcaAll.DataSource = parcaislem.getParcaBilgiAll();
            GridViewParcaAll.DataBind();
            Label11.Text = "";
            GridViewParcaAll.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }
        protected void GridViewKullanici_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewParcaAll.EditIndex = -1;
            GridViewParcaAll.DataSource = parcaislem.getParcaBilgiAll();
            GridViewParcaAll.DataBind();
            Label11.Text = "";
        }
        protected void GridViewKullanici_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label parcaID = GridViewParcaAll.Rows[e.RowIndex].FindControl("Label1") as Label;
                TextBox parcaKodu = GridViewParcaAll.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
                TextBox parcaAdi = GridViewParcaAll.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
                TextBox fiyatAlis = GridViewParcaAll.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;
                TextBox fiyatSatis = GridViewParcaAll.Rows[e.RowIndex].FindControl("TextBox8") as TextBox;
                TextBox stok = GridViewParcaAll.Rows[e.RowIndex].FindControl("TextBox10") as TextBox;

                int s1 = Convert.ToInt32(parcaID.Text);
                string s2 = Convert.ToString(parcaKodu.Text);
                string s3 = Convert.ToString(parcaAdi.Text);
                decimal s4 = Convert.ToDecimal(fiyatAlis.Text);
                decimal s5 = Convert.ToDecimal(fiyatSatis.Text);
                int s6 = Convert.ToInt32(stok.Text);

                if (s1 != 0 || s2 != "" || s3 != "" || s4 != 0 || s5 != 0)
                {
                    parcaislem.guncelleParca(s1, s2, s3, s4, s5, s6);
                    Label11.Text = "Satır bilgisi başarıyla güncellendi";

                    GridViewParcaAll.EditIndex = -1;
                    GridViewParcaAll.DataSource = parcaislem.getParcaBilgiAll();
                    GridViewParcaAll.DataBind();
                }

                else ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Eksik girişler mevcut')", true);
            }

            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Güncelleme Başarısız')", true);
            }
        }

        protected void GridViewParcaAll_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewParcaAll.PageIndex = e.NewPageIndex;

            GridViewParcaAll.DataSource = parcaislem.getParcaBilgiAll();
            GridViewParcaAll.DataBind();
        }

        protected void txtSearch_OnTextChanged(object sender, EventArgs e)
        {
            this.SearchParcas();
        }
        private void SearchParcas()
        {
            var parcalar = parcaislem.getSpesificParcaAll(txtSearch.Text);

            GridViewParcaAll.DataSource = parcalar;
            GridViewParcaAll.DataBind();
        }

        protected void ButtonTemizle_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            this.SearchParcas();
        }
    }
}