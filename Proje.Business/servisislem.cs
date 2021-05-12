using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proje.DataAccess;

namespace Proje.Business
{
    public class servisislem
    {

        public static object getServisKayit()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from s1 in db.servis
                            select s1;

                return sorgu.ToList();
            }
        }

        public static object getServisKayit2()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from s1 in db.servis
                            join a1 in db.aracs
                            on s1.aracID equals a1.aracID
                            join m1 in db.musteris
                            on a1.musteriID equals m1.musteriID
                            join ma in db.aracmarkas
                            on a1.markaID equals ma.markaID
                            join mo in db.aracmodels
                            on a1.modelID equals mo.modelID
                            orderby s1.servisAktif descending

                            select new { s1.servisID, s1.aracID, a1.plaka, ma.marka, mo.model, a1.modelYil, a1.saseNo, a1.motorNo, s1.aciklama, s1.servisGiris, s1.servisCikis, s1.servisAktif };

                return sorgu.ToList();
            }
        }

        public static object getSpesificServisKayit(int musteriid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from a1 in db.aracs
                            join s1 in db.servis
                            on a1.aracID equals s1.aracID
                            join m1 in db.aracmodels
                            on a1.modelID equals m1.modelID
                            join m2 in db.aracmarkas
                            on m1.markaID equals m2.markaID
                            where (a1.musteriID == musteriid)
                            orderby s1.servisAktif descending

                            select new { s1.servisID, a1.plaka, m2.marka, m1.model, a1.modelYil, a1.saseNo, a1.motorNo, s1.aciklama, s1.servisGiris, s1.servisCikis, s1.servisAktif};

                return sorgu.ToList();
            }
        }

        public static object getAktifServisKayit()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from a1 in db.aracs
                            join s1 in db.servis
                            on a1.aracID equals s1.aracID
                            join m1 in db.aracmodels
                            on a1.modelID equals m1.modelID
                            join m2 in db.aracmarkas
                            on m1.markaID equals m2.markaID
                            where (s1.servisAktif == true)

                            select new { s1.servisID, a1.plaka, m2.marka, m1.model, a1.modelYil, a1.saseNo, a1.motorNo, s1.aciklama, s1.servisGiris, s1.servisCikis, s1.servisAktif };

                return sorgu.ToList();
            }
        }

        public static int ekleServisKayit(int aracid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var tarih = DateTime.Today;
                servi yenikayit = new servi();
                yenikayit.aracID = aracid;
                yenikayit.servisGiris = tarih;
                 db.servis.Add(yenikayit);
                 db.SaveChanges();

                return yenikayit.servisID;
            }
        }

        //public static void guncelleServisKayit(int servisid, string aciklama, string cikistarih)
        //{
        //    otoservisdbEntities db = new otoservisdbEntities();
        //    using (db)
        //    {
        //        var x = db.servis.Find(servisid);
        //        x.aciklama = aciklama;
        //        x.servisCikis = Convert.ToDateTime(cikistarih);
        //        db.SaveChanges();
        //    }
        //}

        public static void guncelleServisKayit(int servisid, string aciklama, string cikistarih, bool aktif)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.servis.Find(servisid);
                x.aciklama = aciklama;
                if (cikistarih == "")
                {
                    x.servisCikis = null;
                }
                else x.servisCikis = Convert.ToDateTime(cikistarih);

                x.servisAktif = aktif;
                db.SaveChanges();
            }
        }

        public static void guncelleServisCikis(int servisid, string cikistarih)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.servis.Find(servisid);
                if (cikistarih == "")
                {
                    x.servisCikis = null;
                }
                else x.servisCikis = Convert.ToDateTime(cikistarih);
                db.SaveChanges();
            }
        }
        public static void guncelleServisAktif(int servisid, bool aktif)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.servis.Find(servisid);
                x.servisAktif = aktif;
                db.SaveChanges();
            }
        }

        public static void silServisKayit(int servisid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<int> query1 = (from sv in db.serviskalems
                                    where sv.servisID == servisid
                                    select sv.serviskalemID).ToList();

                if (query1.Count == 0)
                {
                    var x = db.servis.Find(servisid);
                    db.servis.Remove(x);
                    db.SaveChanges();
                }

                else if (query1.Count != 0)
                {
                    int count1 = query1.Count;

                    for (int i = 0; i < count1; i++)
                    {
                        silServisKalem(query1[i]);
                    }

                    var x = db.servis.Find(servisid);
                    db.servis.Remove(x);
                    db.SaveChanges();
                }
            }
        }

        public static object getServisKalem(int servisid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from s1 in db.serviskalems
                            join s2 in db.parcas
                            on s1.parcaID equals s2.parcaID
                            where s1.servisID == servisid
                            select new { s1.serviskalemID, s2.parcaAdi, s1.adet, s1.aciklama };

                return sorgu.ToList();
            }
        }
        public static void ekleServisKalem(int servisid, int parcaid, int adet, string aciklama)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();
                using (db)
                {
                    serviskalem yenikayit = new serviskalem();
                    yenikayit.servisID = servisid;
                    yenikayit.parcaID = parcaid;
                    yenikayit.adet = adet;
                    yenikayit.aciklama = aciklama;

                    db.serviskalems.Add(yenikayit);
                    db.SaveChanges();
                }
            }
            catch(Exception ex)
            {

            }
        }

        public static void silServisKalem(int kalemid)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();
                using (db)
                {
                    var svkalem = db.serviskalems.Find(kalemid);
                    db.serviskalems.Remove(svkalem);
                    db.SaveChanges();
                }
            }
            catch(Exception ex)
            {

            }
            
        }

        public static bool getAktifDurum(int servisid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = (from s1 in db.servis
                            where s1.servisID == servisid
                            select s1.servisAktif).Single();

                return Convert.ToBoolean(sorgu);
            }
        }
    }
}
