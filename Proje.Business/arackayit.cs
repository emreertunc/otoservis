using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proje.DataAccess;

namespace Proje.Business
{
    public class arackayit
    {
        otoservisdbEntities db = new otoservisdbEntities();
        public static List<string> getPlaka()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from x in db.aracs
                            select x.plaka;

                List<string> liste = sorgu.ToList();

                return liste;
            }
        }

        public static List<string> getSpesificModel(int maid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from x in db.aracmodels
                            where x.markaID == maid
                            select x.model;

                List<string> liste = sorgu.ToList();

                return liste;
            }
        }

        public static int getAracID(string pl)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<int> query1 = (from x in db.aracs
                            where x.plaka.Contains(pl)
                            select x.aracID).ToList();

                int aracid = Convert.ToInt32(query1[0]);

                return aracid;
            }
        }

        public static List<arac> getAracBilgi(int aracid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from x in db.aracs
                            where x.aracID.Equals(aracid)
                            select x;

                List<arac> liste = sorgu.ToList();

                return liste;
            }
        }

        public static string getAracMusteri(int aracid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = db.aracs.Where(x => x.aracID == aracid).Select(x => x.musteriID).Single();
                int mustid = Convert.ToInt32(sorgu);
                var sorgu2 = db.musteris.Where(y => y.musteriID == mustid).Select(y => y.adSoyad).Single();

                return sorgu2;
            }
        }

        public static string getAracMarkaAdi(int aracid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = db.aracs.Where(x => x.aracID == aracid).Select(x => x.markaID).Single();
                int mrkid = Convert.ToInt32(sorgu);
                var sorgu2 = db.aracmarkas.Where(y => y.markaID == mrkid).Select(y => y.marka).Single();

                return sorgu2;
            }
        }

        public static string getAracModelAdi(int aracid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = db.aracs.Where(x => x.aracID == aracid).Select(x => x.modelID).Single();
                int mdlid = Convert.ToInt32(sorgu);
                var sorgu2 = db.aracmodels.Where(y => y.modelID == mdlid).Select(y => y.model).Single();

                return sorgu2;
            }
        }

        public static int getAracModelYili(int aracid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = db.aracs.Where(x => x.aracID == aracid).Select(x => x.modelYil).Single();

                return Convert.ToInt32(sorgu);
            }
        }

        public static int ekleArac(string pl, int maid, int moid, int musid, int yil, string ruhsat, string sase, string motor)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<int> query1 = (from a in db.aracs
                                    where a.plaka.Contains(pl)
                                    select a.aracID).ToList();

                if (query1.Count == 0)
                {
                    arac aracekle = new arac();
                    aracekle.plaka = pl;
                    aracekle.markaID = maid;
                    aracekle.modelID = moid;
                    aracekle.musteriID = musid;
                    aracekle.modelYil = yil;
                    aracekle.ruhsatNo = ruhsat;
                    aracekle.saseNo = sase;
                    aracekle.motorNo = motor;

                    db.aracs.Add(aracekle);
                    db.SaveChanges();

                    return 1;
                }

                else return 2;

            }
        }

        public static void silAracKayit(int aracid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.aracs.Find(aracid);
                db.aracs.Remove(x);
                db.SaveChanges();
            }
        }
    }
}
