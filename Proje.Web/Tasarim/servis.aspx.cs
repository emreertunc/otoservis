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

                        string aracid = query1.ToString();
                        string giristarih = query2.ToString();

                        TextBox2.Text = servisid;
                        TextBox3.Text = aracid;
                        TextBox5.Text = giristarih;

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

                        var servislist = servisislem.getServisKayit();

                        GridViewServisList.DataSource = servislist;
                        GridViewServisList.DataBind();

                        var srvkalem = servisislem.getServisKalem(Convert.ToInt32(servisid));
                        GridViewSrKalem.DataSource = srvkalem;
                        GridViewSrKalem.DataBind();
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
            if (TextBox4.Text == "" || txtDatePicker.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Lütfen tüm alanları doldurun')", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "popup yazisi", "mesaj");
                servisislem.guncelleServisKayit(Convert.ToInt32(TextBox2.Text), TextBox4.Text, txtDatePicker.Text);

                var servislist = servisislem.getServisKayit();
                GridViewServisList.DataSource = servislist;
                GridViewServisList.DataBind();
            }

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

            servisislem.ekleServisKalem(servisid, parcaid, adet, aciklama);

            var srvkalem = servisislem.getServisKalem(servisid);

            TextBox1.Text = String.Empty;
            TextBox12.Text = String.Empty;
            DropDownList1.SelectedIndex = 0;
            TextBox13.Text = String.Empty;

            GridViewSrKalem.DataSource = srvkalem;
            GridViewSrKalem.DataBind();
        }

        protected void GridViewSrKalem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewSrKalem_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void GridViewSrKalem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string deger = GridViewSrKalem.Rows[e.RowIndex].Cells[1].Text;
            servisislem.silServisKalem(Convert.ToInt32(deger));
        }

        protected void GridViewServisList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string deger = GridViewServisList.Rows[e.RowIndex].Cells[1].Text;
            servisislem.silServisKayit(Convert.ToInt32(deger));
        }

        protected void GridViewServisList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewServisList.SelectedRow;
            string serviskodu = row.Cells[1].Text;

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

    }
}