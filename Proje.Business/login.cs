using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Proje.DataAccess;

namespace Proje.Business
{
    public class login
    {

        public static int getLoginRole(string uname, string pw)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                try{
                    int sorgu = (from role in db.kullanicis
                                 where role.kullaniciAdi == uname && role.parola == pw
                                 select role.pozisyonID).Single();
                    return sorgu;
                }


                catch
                {
                    return 00404;
                }
            }
        }

        public static List<kullanici> getLoginCredentials(string uname, string pw)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                var sorgu = from cr in db.kullanicis
                                where cr.kullaniciAdi == uname && cr.parola == pw
                                select cr;

                                //select new { cr.kullaniciID, cr.kullaniciAdi, cr.tckn, cr.bolumID, cr.pozisyonID };
                                //select (cr.kullaniciID, cr.kullaniciAdi, cr.tckn, cr.bolumID, cr.pozisyonID)).ToList();


                    /*var credentials = from cr in db.kullanicis
                                      where cr.kullaniciAdi.Equals(uname) && cr.parola.Equals(pw)
                                      select cr;*/

                    List<kullanici> credentials = sorgu.ToList();
                    return credentials;
            }
        }

        public static string getPozisyonAd(int pozid)
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                string sorgu = (from pid in db.pozisyonlars
                                 where pid.pozisyonID == pozid
                                 select pid.pozisyon).Single();
                   return sorgu;
            }
        }

    }
}
