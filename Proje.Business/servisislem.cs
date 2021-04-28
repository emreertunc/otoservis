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

        public static void guncelleServisKayit(int servisid, string aciklama, string cikistarih)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.servis.Find(servisid);
                x.aciklama = aciklama;
                x.servisCikis = Convert.ToDateTime(cikistarih);
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

        public static void silServisKalem(int kalemid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var svkalem = db.serviskalems.Find(kalemid);
                db.serviskalems.Remove(svkalem);
                db.SaveChanges();
            }
        }
    }
}
