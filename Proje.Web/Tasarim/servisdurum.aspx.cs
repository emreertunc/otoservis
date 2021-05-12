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
    public partial class servisdurum : System.Web.UI.Page
    {
        public static int servisid = 0;

        protected void Page_PreInit(Object sender, EventArgs e)
        {
            this.MasterPageFile = "~/Sablon.Master";

            if (Session["role"] == null)
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GridViewAktifServisler.Visible = false;
                GridViewAktifKalemler.Visible = false;
                GridViewServisler.Visible = false;
                GridViewServisKalemler.Visible = false;

                Label2.Visible = false;
                Label3.Visible = false;
                try
                {
                    if (Convert.ToInt32(Session["role"]) == 2)
                    {
                        GridViewServisler.Visible = true;
                        GridViewServisKalemler.Visible = true;
                        ///Label2.Visible = true;

                        string tc = Session["tckn"].ToString();
                        //tc = "85998623066";
                        otoservisdbEntities db = new otoservisdbEntities();

                        var query = db.musteris.ToList()
                                            .Where(x => x.tckn == tc)
                                            .Select(x => x.musteriID).Single();

                        var query2 = db.musteris.ToList()
                                            .Where(x => x.tckn == tc)
                                            .Select(x => x.adSoyad).Single();

                        Label1.Text = query2 + " kişisine ait servis kayıtları:";


                        GridViewServisler.DataSource = servisislem.getSpesificServisKayit(query);
                        GridViewServisler.DataBind();


                        if (servisid != 0)
                        {

                            GridViewServisKalemler.DataSource = servisislem.getServisKalem(Convert.ToInt32(servisid));
                            GridViewServisKalemler.DataBind();
                        }
                    }

                    else if (Convert.ToInt32(Session["role"]) == 1 ||
                            Convert.ToInt32(Session["role"]) == 3 ||
                            Convert.ToInt32(Session["role"]) == 4)
                    {
                        GridViewAktifServisler.Visible = true;
                        GridViewAktifKalemler.Visible = true;
                        //Label3.Visible = true;

                        GridViewAktifServisler.DataSource = servisislem.getAktifServisKayit();
                        GridViewAktifServisler.DataBind();

                        Label1.Text = "aktif durumdaki servis kayıtları:";
                    }


                }
                catch (Exception ex)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bu kişi adına bir servis kaydı bulunmuyor')", true);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Bu kişi adına bir servis kaydı bulunmuyor', 'HATA');", true);
                }
            }
        }
        protected void GridViewServisler_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label2.Text = "";
            Label2.Visible = false;
            GridViewRow row = GridViewServisler.SelectedRow;
            servisid = Convert.ToInt32(row.Cells[1].Text);

            GridViewServisKalemler.DataSource = servisislem.getServisKalem(Convert.ToInt32(servisid));
            GridViewServisKalemler.DataBind();
            
            if (GridViewServisKalemler.Rows.Count == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Servise ait servis kalemi mevcut değil', '');", true);
            }

            else
            {
                Label2.Visible = true;
                Label2.Text = "Servise ait servis kalemleri:";
            }
        }

        protected void GridViewAktifServisler_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label3.Text = "";
            Label3.Visible = false;
            GridViewRow row = GridViewAktifServisler.SelectedRow;
            servisid = Convert.ToInt32(row.Cells[2].Text);
            string serviskodu = row.Cells[2].Text;

            GridViewAktifKalemler.DataSource = servisislem.getServisKalem(Convert.ToInt32(servisid));
            GridViewAktifKalemler.DataBind();

            if (GridViewAktifKalemler.Rows.Count == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Servise ait servis kalemi mevcut değil', '');", true);
            }

            else
            {
                Label3.Visible = true;
                Label3.Text = "Servise ait servis kalemleri:";
            }
        }

        protected void GridViewAktifServisler_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridViewAktifServisler.EditIndex = e.NewEditIndex;

            GridViewRow row = GridViewAktifServisler.Rows[e.NewEditIndex];
            string serviskodu = row.Cells[2].Text;

            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Servis sayfasına yönlendiriliyorsunuz', 'İŞLEM BAŞARILI');", true);
            Response.Redirect("servis.aspx?serviskod=" + serviskodu.ToString());
        }

        protected void GridViewAktifServisler_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[2].Text = "Servis ID";
                e.Row.Cells[3].Text = "Plaka";
                e.Row.Cells[4].Text = "Marka";
                e.Row.Cells[5].Text = "Model";
                e.Row.Cells[6].Text = "Model Yılı";
                e.Row.Cells[7].Text = "Şase No";
                e.Row.Cells[8].Text = "Motor No";
                e.Row.Cells[9].Text = "Açıklama";
                e.Row.Cells[10].Text = "Servis Girişi";
                e.Row.Cells[11].Text = "Servis Çıkışı";
                e.Row.Cells[12].Text = "İşlemde";
            }
        }

        protected void GridViewServisler_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Text = "Servis ID";
                e.Row.Cells[2].Text = "Plaka";
                e.Row.Cells[3].Text = "Marka";
                e.Row.Cells[4].Text = "Model";
                e.Row.Cells[5].Text = "Model Yılı";
                e.Row.Cells[6].Text = "Şase No";
                e.Row.Cells[7].Text = "Motor No";
                e.Row.Cells[8].Text = "Açıklama";
                e.Row.Cells[9].Text = "Servis Girişi";
                e.Row.Cells[10].Text = "Servis Çıkışı";
                e.Row.Cells[11].Text = "İşlemde";
            }
        }

        protected void GridViewAktifKalemler_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Servis Kalem ID";
                e.Row.Cells[1].Text = "Parça Adı";
                e.Row.Cells[2].Text = "Adet";
                e.Row.Cells[3].Text = "Açıklama";
            }
        }

        protected void GridViewServisKalemler_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Servis Kalem ID";
                e.Row.Cells[1].Text = "Parça Adı";
                e.Row.Cells[2].Text = "Adet";
                e.Row.Cells[3].Text = "Açıklama";
            }
        }
    }
}