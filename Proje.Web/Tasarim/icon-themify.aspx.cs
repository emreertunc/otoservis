using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proje.DataAccess;
using System.Data;
using System.Data.SqlClient;

namespace Proje.Web.Tasarim
{
    public partial class icon_themify : System.Web.UI.Page
    {
        /// <summary>
        /// Shows a basic MessageBox on the passed in page
        /// </summary>
        /// <param name="page">The Page object to show the message on</param>
        /// <param name="message">The message to show</param>
        /// <returns></returns>
        public static void ShowMessageBox(Page page, string message)
        {
            Type cstype = page.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = page.ClientScript;

            // Find the first unregistered script number
            int ScriptNumber = 0;
            bool ScriptRegistered = false;
            do
            {
                ScriptNumber++;
                ScriptRegistered = cs.IsStartupScriptRegistered(cstype, "PopupScript" + ScriptNumber);
            } while (ScriptRegistered == true);

            //Execute the new script number that we found
            cs.RegisterStartupScript(cstype, "PopupScript" + ScriptNumber, "alert('" + message + "');", true);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = ObjectDataSource1;
                GridView1.DataBind();

                GridView2.DataSource = ObjectDataSource2;
                GridView2.DataBind();
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
            Label5.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
            Label5.Text = "";
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            //TextBox marka = GridView1.FooterRow.FindControl("TextBox1") as TextBox;
            TextBox model = GridView1.FooterRow.FindControl("TextBox2") as TextBox;
            DropDownList ddl = GridView1.FooterRow.FindControl("DropDownList1") as DropDownList;

            string m1 = ddl.SelectedValue;
            string m2 = model.Text;

            int donendeger = dbarac.ekleModel(m1, m2);
            if (donendeger == 1)
            {
                ObjectDataSource1.DataBind();
                GridView1.DataSource = ObjectDataSource1;
                GridView1.DataBind();
            }
            else if (donendeger == 2)
            {
                ShowMessageBox(Page, "Model listede bulunmakta, lütfen tekrar deneyin");
            }

        }

        //*******************************************************************************************
        //Textboxın içindeki değerin değişmeden önceki halini almak için tek yapılması gereken
        //altına visible=false olan bir label ekleyip eval tagini sütundaki normal labelların
        //Eval("") tagi ile aynı vermek.
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            TextBox marka = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            TextBox model = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;

            Label marka2 = GridView1.Rows[e.RowIndex].FindControl("Label6") as Label;
            Label model2 = GridView1.Rows[e.RowIndex].FindControl("Label7") as Label;

            string m1 = marka.Text;
            string m2 = model.Text;

            string m3 = marka2.Text;
            string m4 = model2.Text;

            otoservisdbEntities db = new otoservisdbEntities();

            List<int> query1 = db.aracmarkas.ToList()
                         .Where(x => x.marka == m1)
                         .Select(x => x.markaID).ToList();

            List<int> query2 = db.aracmodels.ToList()
                         .Where(x => x.model == m2)
                         .Select(x => x.modelID).ToList();

            //int m1id = Convert.ToInt32(query1[0]);
            //int m2id = Convert.ToInt32(query2[0]);

            List<int> query5a = db.aracmarkas.ToList()
                         .Where(x => x.marka == m3)
                         .Select(x => x.markaID).ToList();

            List<int> query5b = db.aracmodels.ToList()
                     .Where(x => x.model == m4)
                     .Select(x => x.modelID).ToList();

            int m5id = Convert.ToInt32(query5a[0]);
            int m6id = Convert.ToInt32(query5b[0]);

            if (query2.Count != 0)
            {
                int m1id = Convert.ToInt32(query1[0]);
                int m2id = Convert.ToInt32(query2[0]);


                List<string> sorgu1 = db.aracmodels.ToList()
                    .Where(x => x.markaID == m1id & x.model.Contains(m2))
                    .Select(x => x.model).ToList();

                if (sorgu1.Count != 0)
                {
                    ShowMessageBox(Page, "" + m1 + " markasının " + m2 + " modeli zaten mevcut");
                }

                else
                {
                    dbarac.guncelleModel(m5id, m6id, m2);
                }
            }

            else
            {
                dbarac.guncelleModel(m5id, m6id, m2);
            }

            Label5.Text = "Satır bilgisi başarıyla güncellendi";

            GridView1.EditIndex = -1;
            ObjectDataSource1.DataBind();
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            otoservisdbEntities db = new otoservisdbEntities();

            Label marka = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
            Label model = GridView1.Rows[e.RowIndex].FindControl("Label2") as Label;

            string m1 = marka.Text;
            string m2 = model.Text;

            List<int> query1 = db.aracmarkas.ToList()
                         .Where(x => x.marka == m1)
                         .Select(x => x.markaID).ToList();

            int m1id = Convert.ToInt32(query1[0]);

            List<int> query2 = db.aracmodels.ToList()
                         .Where(x => x.model == m2 && x.markaID == m1id)
                         .Select(x => x.modelID).ToList();

            int m2id = Convert.ToInt32(query2[0]);

            dbarac.silModel(m1id, m2id);
            ObjectDataSource1.DataBind();
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            GridView2.DataSource = ObjectDataSource2;
            GridView2.DataBind();
            Label9.Text = "";
            GridView2.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            GridView2.DataSource = ObjectDataSource2;
            GridView2.DataBind();
            Label9.Text = "";
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox marka = GridView2.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
            Label marka2 = GridView2.Rows[e.RowIndex].FindControl("Label10") as Label;

            string m1 = marka.Text;
            string m2 = marka2.Text;

            otoservisdbEntities db = new otoservisdbEntities();

            List<int> query1 = db.aracmarkas.ToList()
                         .Where(x => x.marka == m1)
                         .Select(x => x.markaID).ToList();

            if (query1.Count != 0)
            {
                Label9.Text = "Marka zaten mevcut, ekleme işlemi gerçekleştirilemedi..";
            }

            else if (query1.Count == 0)
            {
                List<int> query2 = db.aracmarkas.ToList()
                         .Where(x => x.marka == m2)
                         .Select(x => x.markaID).ToList();

                int m2id = Convert.ToInt32(query2[0]);

                dbarac.guncelleMarka(m2id, m1);

                Label9.Text = "Marka Başarıyla eklendi";
            }

            GridView2.EditIndex = -1;
            ObjectDataSource2.DataBind();
            GridView2.DataSource = ObjectDataSource2;
            GridView2.DataBind();

            ObjectDataSource1.DataBind();
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            TextBox model = GridView2.FooterRow.FindControl("TextBox6") as TextBox;
            string m1 = model.Text;

            int donendeger = dbarac.ekleMarka(m1);

            if (donendeger == 1)
            {
                ObjectDataSource2.DataBind();
                GridView2.DataSource = ObjectDataSource2;
                GridView2.DataBind();

                ObjectDataSource1.DataBind();
                GridView1.DataSource = ObjectDataSource1;
                GridView1.DataBind();
            }
            else if (donendeger == 2)
            {
                ShowMessageBox(Page, "Marka listede bulunmakta, lütfen tekrar deneyin");
            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            otoservisdbEntities db = new otoservisdbEntities();

            Label marka = GridView2.Rows[e.RowIndex].FindControl("Label8") as Label;

            string m1 = marka.Text;

            List<int> query1 = db.aracmarkas.ToList()
                         .Where(x => x.marka == m1)
                         .Select(x => x.markaID).ToList();

            int m1id = Convert.ToInt32(query1[0]);

            dbarac.silMarka(m1id);

            ObjectDataSource2.DataBind();
            GridView2.DataSource = ObjectDataSource2;
            GridView2.DataBind();

            ObjectDataSource1.DataBind();
            GridView1.DataSource = ObjectDataSource1;
            GridView1.DataBind();
        }
    }
}