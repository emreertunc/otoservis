using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proje.DataAccess;
using Proje.Business;
using System.Data;

namespace Proje.Web.Tasarim
{
    public partial class servis : System.Web.UI.Page
    {
        otoservisdbEntities db = new otoservisdbEntities();

        protected void Page_PreInit(Object sender, EventArgs e)
        {
            this.MasterPageFile = "~/Sablon.Master";

            if (Session["role"] == null)
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }

            else if (Session["role"].Equals(2))
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string servisid = Request.QueryString["serviskod"];
                Label1.Text = servisid;

                if (servisid != null)
                {
                    divRedirect.Visible = false;

                    var serviskontrol = db.servis.ToList()
                        .Where(x => x.servisID == Convert.ToInt32(servisid))
                        .Select(x => x.servisID).ToList();

                    if (serviskontrol.Count != 0)
                    {
                        var query1 = db.servis.ToList()
                                                    .Where(x => x.servisID == Convert.ToInt32(servisid))
                                                    .Select(x => x.aracID).Single();

                        var query2 = db.servis.ToList()
                                    .Where(x => x.servisID == Convert.ToInt32(servisid))
                                    .Select(x => x.servisGiris).Single();

                        var query3 = db.servis.ToList()
                                    .Where(x => x.servisID == Convert.ToInt32(servisid))
                                    .Select(x => x.aciklama).Single();

                        var query4 = db.servis.ToList()
                                    .Where(x => x.servisID == Convert.ToInt32(servisid))
                                    .Select(x => x.servisCikis).Single();

                        var query5 = db.servis.ToList()
                                    .Where(x => x.servisID == Convert.ToInt32(servisid))
                                    .Select(x => x.servisAktif).Single();

                        string aracid = query1.ToString();
                        string giristarih = query2.ToString();

                        TextBox2.Text = servisid;
                        TextBox3.Text = aracid;
                        TextBox5.Text = giristarih;
                        ddlAktif.SelectedValue = query5.ToString();

                        if (query3 != null)
                        {
                            string aciklama = query3.ToString();
                            TextBox4.Text = aciklama;
                        }
                        if (query4 != null)
                        {
                            string cikistarih = query4.ToString();
                            txtDatePicker.Text = cikistarih;
                        }

                        //parca parcalar = new parca();

                        //parcalar = parcaislem.getParcaBilgi();

                        //List<parcaliste> plist = new List<parcaliste>;
                        //plist = parcaislem.getParcaBilgi();

                        var parcalist = parcaislem.getParcaBilgi();

                        GridViewParca.DataSource = parcalist;
                        GridViewParca.DataBind();
                        //GridView1.Columns[1].HeaderText = "Parça ID";
                        //GridView1.Columns[2].HeaderText = "Parça Adı";
                        //GridView1.Columns[3].HeaderText = "Parça Kodu";

                        for (int i = 0; i < 1000; i++)
                        {
                            DropDownList1.Items.Insert(i, new ListItem((i + 1).ToString(), (i + 1).ToString()));
                        }

                        var servislist = servisislem.getServisKayit2();

                        GridViewServisList.DataSource = servislist;
                        GridViewServisList.DataBind();

                        
                        var srvkalem = servisislem.getServisKalem(Convert.ToInt32(servisid));
                        GridViewSrKalem.DataSource = srvkalem;
                        GridViewSrKalem.DataBind();

                        if (GridViewSrKalem.Rows.Count == 0)
                        {
                            GridViewSrKalem.Visible = false;
                        }

                        bool aktifdurum = servisislem.getAktifDurum(Convert.ToInt32(servisid));

                        if (aktifdurum == false)
                        {
                            divParca.Visible = false;
                            Button4.Visible = false;
                        }
                    }

                    else
                    {
                        divRedirect.Visible = true;
                        //Label2.Visible = true;
                        //Button3.Visible = true;
                        divServisGuncelle.Visible = false;
                        divServisList.Visible = false;
                        divParcaList.Visible = false;
                        divParcaGiris.Visible = false;
                        divServisKalem.Visible = false;
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Servis Giriş Ekranına yönlendirilmek için sayfadaki butona tıklayın...')", true);
                        redirectToDefault();
                    }



                }

                else
                {
                    divRedirect.Visible = true;
                    //Label2.Visible = true;
                    //Button3.Visible = true;
                    divServisGuncelle.Visible = false;
                    divServisList.Visible = false;
                    divParcaList.Visible = false;
                    divParcaGiris.Visible = false;
                    divServisKalem.Visible = false;
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Servis Giriş Ekranına yönlendirilmek için sayfadaki butona tıklayın...')", true);
                    redirectToDefault();
                }
            }
        }

        public void redirectToDefault()
        {
            //System.Threading.Thread.Sleep(5000);
            //Response.Redirect("servisgiris.aspx");
            Response.AddHeader("refresh", "10;URL=servisgiris.aspx");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (TextBox4.Text == "" || txtDatePicker.Text == "")
            //{
            //    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Lütfen tüm alanları doldurun')", true);
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Lütfen tüm alanları doldurun', 'EKSİK GİRİŞ');", true);
            //}
            //else
            //{
              servisislem.guncelleServisKayit(Convert.ToInt32(TextBox2.Text), TextBox4.Text, txtDatePicker.Text, Convert.ToBoolean(ddlAktif.SelectedValue));

              var servislist = servisislem.getServisKayit2();
              GridViewServisList.DataSource = servislist;
              GridViewServisList.DataBind();
              //LabelBilgi2.Text = "Servis Bilgisi başarıyla güncellendi";

              bool aktifdurum = Convert.ToBoolean(ddlAktif.SelectedValue);

              if (aktifdurum == false)
              {
                  divParca.Visible = false;
                  Button4.Visible = false;
                    
                  if(txtDatePicker.Text == "")
                  {
                  servisislem.guncelleServisCikis(Convert.ToInt32(Request.QueryString["serviskod"]), DateTime.UtcNow.ToString());
                    txtDatePicker.Text = DateTime.UtcNow.ToString();
                  }

              }
              else if(aktifdurum == true)
              {
                  divParca.Visible = true;
                  Button4.Visible = true;
                  servisislem.guncelleServisCikis(Convert.ToInt32(Request.QueryString["serviskod"]), "");
                txtDatePicker.Text = null;
              }


              ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Servis Bilgisi başarıyla güncellendi', 'İŞLEM BAŞARILI');", true);
            //}

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("servisgiris.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = HttpUtility.HtmlDecode(GridViewParca.SelectedRow.Cells[1].Text);
            TextBox12.Text = HttpUtility.HtmlDecode(GridViewParca.SelectedRow.Cells[2].Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int servisid = Convert.ToInt32(Label1.Text);
            int parcaid = Convert.ToInt32(TextBox1.Text);
            int adet = Convert.ToInt32(DropDownList1.SelectedValue);
            string aciklama = TextBox13.Text;

            if (TextBox1.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Parça ID boş bırakılamaz', 'EKSİK GİRİŞ');", true);
            }
            else
            {
                List<int> ifparcaexists = db.parcas.ToList()
                        .Where(x => x.parcaID == parcaid)
                        .Select(x => x.parcaID).ToList();

                if (ifparcaexists.Count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Girilen Parça ID ile eşleşen kayıt mevcut değil ', 'HATA');", true);
                }
                else
                {
                    servisislem.ekleServisKalem(servisid, parcaid, adet, aciklama);

                    var srvkalem = servisislem.getServisKalem(servisid);

                    TextBox1.Text = String.Empty;
                    TextBox12.Text = String.Empty;
                    DropDownList1.SelectedIndex = 0;
                    TextBox13.Text = String.Empty;

                    GridViewSrKalem.DataSource = srvkalem;
                    GridViewSrKalem.DataBind();
                }
            }
        }

        protected void GridViewSrKalem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewSrKalem_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void GridViewSrKalem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string servisid = Request.QueryString["serviskod"];

            string deger = GridViewSrKalem.Rows[e.RowIndex].Cells[1].Text;
            servisislem.silServisKalem(Convert.ToInt32(deger));

            var srvkalem = servisislem.getServisKalem(Convert.ToInt32(servisid));
            GridViewSrKalem.DataSource = srvkalem;
            GridViewSrKalem.DataBind();
        }

        protected void GridViewServisList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string deger = GridViewServisList.Rows[e.RowIndex].Cells[2].Text;
            servisislem.silServisKayit(Convert.ToInt32(deger));
            GridViewServisList.DataSource= servisislem.getServisKayit2();
            GridViewServisList.DataBind();
        }

        protected void GridViewServisList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewServisList.SelectedRow;
            string serviskodu = row.Cells[2].Text;

            Response.Redirect("servis.aspx?serviskod=" + serviskodu.ToString());
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridViewParca.PageIndex = e.NewPageIndex;
            this.SearchParcas();
        }

        protected void txtSearch_OnTextChanged(object sender, EventArgs e)
        {
            this.SearchParcas();
        }

        protected void OnTextChanged(object sender, EventArgs e)
        {
            this.SearchParcas();
        }

        private void SearchParcas()
        {
            var parcalar = parcaislem.getSpesificParca(txtSearch.Text);

            GridViewParca.DataSource = parcalar;
            GridViewParca.DataBind();
        }
        protected void ButtonTemizle_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            this.SearchParcas();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            bool aktifdurum = false;
            servisislem.guncelleServisAktif(Convert.ToInt32(Request.QueryString["serviskod"]), aktifdurum);

            var query5 = db.servis.ToList()
                                    .Where(x => x.servisID == Convert.ToInt32(Request.QueryString["serviskod"]))
                                    .Select(x => x.servisAktif).Single();

            ddlAktif.SelectedValue = query5.ToString();

            servisislem.guncelleServisCikis(Convert.ToInt32(Request.QueryString["serviskod"]), DateTime.UtcNow.ToString());

            GridViewServisList.DataSource = servisislem.getServisKayit2();
            GridViewServisList.DataBind();

            divParca.Visible = false;
            Button4.Visible = false;

            //LabelBilgi.Text = "Servis Kaydı Başarıyla Kapatıldı.";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSucces('Servis Kaydı Başarıyla Kapatıldı', 'İŞLEM BAŞARILI');", true);
        }

        protected void GridViewServisList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[2].Text = "Servis ID";
                e.Row.Cells[3].Text = "Araç ID";
                e.Row.Cells[4].Text = "Plaka";
                e.Row.Cells[5].Text = "Marka";
                e.Row.Cells[6].Text = "Model";
                e.Row.Cells[7].Text = "Model Yılı";
                e.Row.Cells[8].Text = "Şase No";
                e.Row.Cells[9].Text = "Motor No";
                e.Row.Cells[10].Text = "Açıklama";
                e.Row.Cells[11].Text = "Servise Giriş";
                e.Row.Cells[12].Text = "Servis Çıkışı";
                e.Row.Cells[13].Text = "Aktiflik Durumu";
            }
        }

        protected void GridViewParca_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Text = "Parça ID";
                e.Row.Cells[2].Text = "Parça Adı";
                e.Row.Cells[3].Text = "Parça Kodu";
            }
        }

        protected void GridViewSrKalem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Text = "Servis Kalem ID";
                e.Row.Cells[2].Text = "Parça Adı";
                e.Row.Cells[3].Text = "Adet";
                e.Row.Cells[4].Text = "Açıklama";
            }
        }
    }
}