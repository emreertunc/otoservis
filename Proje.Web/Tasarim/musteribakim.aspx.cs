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
    public partial class musteribakim : System.Web.UI.Page
    {
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
            else if (Session["role"].Equals(3) || Session["role"].Equals(4))
            {
                this.MasterPageFile = "~/unauthorized.Master";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = ObjectDataSource1;
                GridView1.DataBind();
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();

                TextBox musteriID = GridView1.FooterRow.FindControl("TextBox3") as TextBox;
                TextBox tckn = GridView1.FooterRow.FindControl("TextBox4") as TextBox;
                TextBox adSoyad = GridView1.FooterRow.FindControl("TextBox5") as TextBox;

                //int deneme1 = Convert.ToInt32(musteriID.Text);
                string tckimlik = Convert.ToString(tckn.Text);
                string isim = Convert.ToString(adSoyad.Text);

                if (tckimlik != "" && isim != "")
                {
                    if(tckimlik.Length != 11)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('TC Kimlik No 11 haneli olmalı', '');", true);
                    }
                    else
                    {
                        List<string> ifmusteriexists = db.musteris.ToList()
                                .Where(x => x.tckn == tckimlik)
                                .Select(x => x.tckn).ToList();

                        if (ifmusteriexists.Count == 0)
                        {
                            dbmusteri2.AddMusteri(tckimlik, isim);
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Müşteri eklendi', '');", true);
                        }
                        else
                        {
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Müşteri mevcut, lütfen kontrol ediniz')", true);
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Müşteri mevcut, lütfen kontrol ediniz', 'HATA');", true);
                        }

                        ObjectDataSource1.DataBind();
                        GridView1.DataSource = ObjectDataSource1;
                        GridView1.DataBind();
                    }
                    
                }
                else ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentWarning('Eksik girişler mevcut', 'HATA');", true);

            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentError('Ekleme başarısız', 'HATA');", true);
            }
            
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label musteriID = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;

            //string mid = musteriID.Text;

            int deneme1 = Convert.ToInt32(musteriID.Text);

            dbmusteri2.silMusteri(deneme1);
            ObjectDataSource1.DataBind();
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
            //LabelBilgi.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
            //LabelBilgi.Text = "";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label musteriID = GridView1.Rows[e.RowIndex].FindControl("Label4") as Label;
            TextBox tckn = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox adSoyad = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;

            int deneme1 = Convert.ToInt32(musteriID.Text);
            string deneme2 = tckn.Text;
            string deneme3 = adSoyad.Text;

            dbmusteri2.guncelleMusteri(deneme1, deneme2, deneme3);
            //LabelBilgi.Text = "Satır bilgisi başarıyla güncellendi";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "showContentSuccess('Satır bilgisi başarıyla güncellendi', 'İŞLEM BAŞARILI');", true);

            GridView1.EditIndex = -1;
            ObjectDataSource1.DataBind();
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

            ObjectDataSource1.DataBind();
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }
    }
}