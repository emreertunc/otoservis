using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proje.DataAccess;

namespace Proje.Business
{
    public class dbmusteri2
    {
        Proje.DataAccess.otoservisdbEntities db = new Proje.DataAccess.otoservisdbEntities();
        public List<aracmodel> GetAracmodels()
        {
            using (db)
            {
                return (from aracmodel in db.aracmodels select aracmodel).ToList();
            }
        }

        //üsttekinde list döndürüyoduk
        //ancak altta query.tolist döndürdüğümüz için public list değil public object tanımladım.
        //böyle yapınca çalıştı
        public object GetAracmodels2()
        {
            using (db)
            {
                var query = from c in db.aracmodels
                            select new { c.model };
                return query.ToList();
            }

        }


        public object GetMusteris()
        {
            using (db)
            {
                var query = from c in db.musteris
                            select new { c.musteriID, c.adSoyad, c.tckn };
                return query.ToList();
            }
        }
        public static void AddMusteri(string tc, string ad)
        {
            Proje.DataAccess.otoservisdbEntities db = new Proje.DataAccess.otoservisdbEntities();
            using (db)
            {
                musteri m = new musteri();
                //m.musteriID = id;
                m.tckn = tc;
                m.adSoyad = ad;
                db.musteris.Add(m);
                db.SaveChanges();
            }

        }

        public static void silMusteri(int id)
        {
            Proje.DataAccess.otoservisdbEntities db = new Proje.DataAccess.otoservisdbEntities();
            using (db)
            {

                List<int> query1 = (from arac in db.aracs
                                    where arac.musteriID == id
                                    select arac.aracID).ToList();

                if (query1.Count == 0)
                {
                    musteri m = new musteri();
                    var x = db.musteris.Find(id);
                    db.musteris.Remove(x);
                    db.SaveChanges();
                }

                else if (query1.Count != 0)
                {
                    int count1 = query1.Count;

                    for (int i = 0; i < count1; i++)
                    {

                        arackayit.silAracKayit(query1[i]);
                    }

                    var x = db.musteris.Find(id);
                    db.musteris.Remove(x);
                    db.SaveChanges();
                }
            }
        }

        public static void guncelleMusteri(int id, string tc, string ad)
        {
            Proje.DataAccess.otoservisdbEntities db = new Proje.DataAccess.otoservisdbEntities();
            using (db)
            {
                var x = db.musteris.Find(id);

                x.tckn = tc;
                x.adSoyad = ad;
                db.SaveChanges();
            }
        }

        public static object getMusteriID()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var query = from musteri in db.musteris
                            select new { musteri.musteriID, musteri.adSoyad };
                return query.ToList();
            }
        }
    }
}
