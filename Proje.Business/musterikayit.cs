using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proje.DataAccess;

namespace Proje.Business
{
    public class musterikayit
    {
        otoservisdbEntities db = new otoservisdbEntities();
        public static List<string> getMusteri()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from x in db.musteris
                            select x.adSoyad;

                List<string> liste = sorgu.ToList();

                return liste;
            }
        }

        public static int ekleMusteri(string tc, string isim)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                List<int> query1 = (from a in db.musteris
                                    where a.tckn.Contains(tc)
                                    select a.musteriID).ToList();

                if (query1.Count == 0)
                {
                    musteri musteriekle = new musteri();
                    musteriekle.tckn = tc;
                    musteriekle.adSoyad = isim;

                    db.musteris.Add(musteriekle);
                    db.SaveChanges();

                    return 1;
                }

                else return 2;

            }
        }
    }
}
