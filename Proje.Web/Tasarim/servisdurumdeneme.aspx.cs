using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proje.Business;
using Proje.DataAccess;
using System.Data;

namespace Proje.Web.Tasarim
{
    public partial class servisdurumdeneme : System.Web.UI.Page
    {
        public static int servisid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                try
                {
                    if(Convert.ToInt32(Session["role"]) == 2)
                    {
                        //string tc = Session["tckn"].ToString();
                        string tc = "26533997788";
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

                    //else if (Convert.ToInt32(Session["role"]) == 1 ||
                    //        Convert.ToInt32(Session["role"]) == 3 ||
                    //        Convert.ToInt32(Session["role"]) == 4)
                    //{
                    //    GridViewAktifServisler.DataSource = servisislem.getAktifServisKayit();
                    //    GridViewAktifServisler.DataBind();
                    //}


                }
                catch(Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('hata')", true);
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
            servisid = Convert.ToInt32(row.Cells[1].Text);

            GridViewAktifKalemler.DataSource = servisislem.getServisKalem(Convert.ToInt32(servisid));
            GridViewAktifKalemler.DataBind();
        }
    }
}