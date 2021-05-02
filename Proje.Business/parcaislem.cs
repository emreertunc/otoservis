using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proje.DataAccess;

namespace Proje.Business
{
    public class parcaislem
    {

        public static object getParcaBilgi()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from d1 in db.parcas
                            select new { d1.parcaID, d1.parcaAdi,d1.parcaKodu };

                return sorgu.ToList();
            }
        }

        public static object getParcaBilgiAll()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from d1 in db.parcas
                            select d1;

                return sorgu.ToList();
            }
        }

        public static object getSpesificParca(string anahtardeger)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from d1 in db.parcas
                            where d1.parcaAdi.Contains(anahtardeger)
                            select new { d1.parcaID, d1.parcaAdi, d1.parcaKodu };

                return sorgu.ToList();
            }
        }

        public static List<string> getSpesificParca2(string anahtardeger)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<string> sorgu = (from d1 in db.parcas
                            where d1.parcaAdi.Contains(anahtardeger)
                            select d1.parcaAdi).ToList();

                return sorgu.ToList();
            }
        }

        public static object getSpesificParcaAll(string anahtardeger)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from d1 in db.parcas
                            where d1.parcaAdi.Contains(anahtardeger)
                            select d1;

                return sorgu.ToList();
            }
        }
        public static void AddParca(string parcaKodu, string parcaAdi, decimal fiyatAlis, decimal fiyatSatis, int stok)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();
                using (db)
                {
                    parca p = new parca();
                    p.parcaKodu = parcaKodu;
                    p.parcaAdi = parcaAdi;
                    p.fiyatAlis = fiyatAlis;
                    p.fiyatSatis = fiyatSatis;
                    p.stok = stok;

                    db.parcas.Add(p);
                    db.SaveChanges();
                }
            }
            
            catch(Exception ex)
            {
                
            }
        }

        public static void silParca(int id)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();
                using (db)
                {
                    var x = db.parcas.Find(id);
                    db.parcas.Remove(x);
                    db.SaveChanges();
                }
            }
            
            catch(Exception ex)
            {

            }
        }
        public static void guncelleParca(int parcaID, string parcaKodu, string parcaAdi, decimal fiyatAlis, decimal fiyatSatis, int stok)
        {
            try
            {
                otoservisdbEntities db = new otoservisdbEntities();
                using (db)
                {
                    var p = db.parcas.Find(parcaID);

                    p.parcaKodu = parcaKodu;
                    p.parcaAdi = parcaAdi;
                    p.fiyatAlis = fiyatAlis;
                    p.fiyatSatis = fiyatSatis;
                    p.stok = stok;
                    db.SaveChanges();
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}
