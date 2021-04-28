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
    }
}
