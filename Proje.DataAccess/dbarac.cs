using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proje.DataAccess
{
    public class dbarac
    {
        // ÖNEMLİ NOT!! eğer linq değil aşağıdaki gibi procedure ile direkt sorgu çalıştırıyorsan bunu
        // direkt bir objeye ya da listeye atamıyosun, önce aşağıdaki gibi bir var tipine atıp listeye dönüştürmen lazım.
        /* public static object GetMarkaModels1()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var liste = db.MARKAMODELLISTESI();
                return liste.ToList();
            }
        } */



        /*public object GetMarkaModels2()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                //return db.aracmodels.Where(x => x.model == "Clio" || x.model =="Megane").ToList();
                return db.aracmodels.Where(x => x.model.Contains("Cl") || x.model.Contains("Meg")).ToList();
            }
        }*/



        //Bazılarında referans 0 gözüküyor ancak başta listelerin için doldurmak için kullanılıyor, silme.
        public object GetMarkaModels()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from d1 in db.aracmarkas
                            join d2 in db.aracmodels
                            on d1.markaID equals d2.markaID
                            select new { d1.marka, d2.model };

                //into tumsutunlar
                //from x in tumsutunlar
                //select x;

                return sorgu.ToList();
            }
        }


        //*****************************************************************************************
        //arac modelde çift primary key olduğu için var y'de sırayla önce model id sonra marka id yolladık
        public static void guncelleMarkaModel(int m1id, int m2id, string m1, string m2)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.aracmarkas.Find(m1id);
                x.marka = m1;
                db.SaveChanges();

                var y = db.aracmodels.Find(m2id, m1id);
                y.model = m2;
                db.SaveChanges();


            }
        }


        //*************************sadece modeldeki islemler*****************************

        public static void silModel(int m1id, int m2id)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.aracmodels.Find(m2id, m1id);
                db.aracmodels.Remove(x);
                db.SaveChanges();
            }
        }
        
        public static int ekleModel(string m1, string m2)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<int> query1 = (from ma in db.aracmarkas
                                    where ma.marka.Contains(m1)
                                    select ma.markaID).ToList();

                int m1id = Convert.ToInt32(query1[0]);

                List<string> query2 = (from mo in db.aracmodels
                                       where mo.model.Contains(m2)
                                       select mo.model).ToList();

                if (query2.Count == 0)
                {

                    aracmodel y = new aracmodel();
                    y.model = m2;
                    y.markaID = m1id;

                    //db.aracmarkas.Add(x);
                    db.aracmodels.Add(y);
                    db.SaveChanges();

                    return 1;
                }
                else return 2;
            }
        }

        public static void guncelleModel(int m1id, int m2id, string m2)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var y = db.aracmodels.Find(m2id, m1id);
                y.model = m2;
                db.SaveChanges();
            }
        }



        //*************************sadece markadaki islemler*****************************
        public static int ekleMarka(string m1)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<int> query1 = (from ma in db.aracmarkas
                                    where ma.marka.Contains(m1)
                                    select ma.markaID).ToList();

                if (query1.Count == 0)
                {
                    aracmarka markaekle = new aracmarka();
                    markaekle.marka = m1;

                    db.aracmarkas.Add(markaekle);
                    db.SaveChanges();

                    return 1;
                }

                else return 2;

            }
        }

        public static void silMarka(int m1id)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<int> query1 = (from mo in db.aracmodels
                                    where mo.markaID == m1id
                                    select mo.modelID).ToList();

                if (query1.Count == 0)
                {
                    var x = db.aracmarkas.Find(m1id);
                    db.aracmarkas.Remove(x);
                    db.SaveChanges();
                }

                else if (query1.Count != 0)
                {
                    int count1 = query1.Count;

                    for (int i = 0; i < count1; i++)
                    {
                        silModel(m1id, query1[i]);
                    }

                    var x = db.aracmarkas.Find(m1id);
                    db.aracmarkas.Remove(x);
                    db.SaveChanges();
                }
            }
        }

        public static void guncelleMarka(int m1id, string m1)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.aracmarkas.Find(m1id);

                x.marka = m1;
                db.SaveChanges();
            }
        }

        public static List<string> getMarkaListe()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from x in db.aracmarkas
                            select x.marka;

                List<string> liste = sorgu.ToList();

                return liste;
            }
        }

        public static object GetMarkas()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from x in db.aracmarkas
                            select new { x.marka };

                return sorgu.ToList();
            }
        }


    }
}
