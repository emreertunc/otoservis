using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proje.DataAccess;

namespace Proje.Business
{
    public class kullanicibilgi
    {
        public static object GetKullanici()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var query = from c in db.kullanicis
                            select c;
                return query.ToList();
            }
        }

        public static kullanici getKullaniciAsClass(string tc)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                kullanici k = new kullanici();
                
                var query = (from c in db.kullanicis
                             where c.tckn==tc
                            select new {c.kullaniciID, c.kullaniciAdi, c.parola, c.tckn, c.adSoyad, c.iseGirisTarihi, c.bolumID, c.pozisyonID, c.telno}).Single();

                k.kullaniciID = query.kullaniciID;
                k.kullaniciAdi = query.kullaniciAdi;
                k.parola = query.parola;
                k.tckn = query.tckn;
                k.adSoyad = query.adSoyad;
                k.iseGirisTarihi = query.iseGirisTarihi;
                k.bolumID = query.bolumID;
                k.pozisyonID = query.pozisyonID;
                k.telno = query.telno;
                
                return k;
            }
        }

        public static void AddKullanici(string kullaniciAdi, string parola, string tckn, string adSoyad, string iseGirisTarihi, int bolumID, int pozisyonID, string telno)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {

                kullanici k = new kullanici();
                k.kullaniciAdi = kullaniciAdi;
                k.parola = parola;
                k.tckn = tckn;
                k.adSoyad = adSoyad;
                k.iseGirisTarihi = Convert.ToDateTime(iseGirisTarihi);
                k.bolumID = bolumID;
                k.pozisyonID = pozisyonID;
                k.telno = telno;

                db.kullanicis.Add(k);
                db.SaveChanges();
            }

        }

        public static void silKullanici(int id)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var x = db.kullanicis.Find(id);
                db.kullanicis.Remove(x);
                db.SaveChanges();
            }
        }

        public static void guncelleKullanici(int kullaniciID, string kullaniciAdi, string parola, string tckn, string adSoyad, string iseGirisTarihi, int bolumID, int pozisyonID, string telno)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();
                using (db)
                {
                    var k = db.kullanicis.Find(kullaniciID);

                    k.kullaniciAdi = kullaniciAdi;
                    k.parola = parola;
                    k.tckn = tckn;
                    k.adSoyad = adSoyad;
                    k.iseGirisTarihi = Convert.ToDateTime(iseGirisTarihi);
                    k.bolumID = bolumID;
                    k.pozisyonID = pozisyonID;
                    k.telno = telno;
                    db.SaveChanges();
                }
            }
            catch(Exception ex)
            {

            }
        }

        public static object getBolumIDList()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from b1 in db.bolumlers
                            select b1;

                return sorgu.ToList();
            }
        }
        public static object getPozisyonIDList()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from d1 in db.pozisyonlars
                            select d1;

                return sorgu.ToList();
            }
        }
    }
}
