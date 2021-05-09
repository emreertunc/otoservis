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
                        Label2.Visible = true;

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
                        Label3.Visible = true;

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
            GridViewRow row = GridViewServisler.SelectedRow;
            servisid = Convert.ToInt32(row.Cells[1].Text);

            GridViewServisKalemler.DataSource = servisislem.getServisKalem(Convert.ToInt32(servisid));
            GridViewServisKalemler.DataBind();
        }

        protected void GridViewAktifServisler_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewAktifServisler.SelectedRow;
            servisid = Convert.ToInt32(row.Cells[2].Text);
            string serviskodu = row.Cells[2].Text;

            GridViewAktifKalemler.DataSource = servisislem.getServisKalem(Convert.ToInt32(servisid));
            GridViewAktifKalemler.DataBind();
        }

        protected void GridViewAktifServisler_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridViewAktifServisler.EditIndex = e.NewEditIndex;

            GridViewRow row = GridViewAktifServisler.Rows[e.NewEditIndex];
            string serviskodu = row.Cells[2].Text;

            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Servis sayfasına yönlendiriliyorsunuz', 'İŞLEM BAŞARILI');", true);
            Response.Redirect("servis.aspx?serviskod=" + serviskodu.ToString());
        }
    }
}