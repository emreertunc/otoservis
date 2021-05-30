using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Proje.DataAccess;
using System.Data.Entity;

namespace Proje.API
{
    public class aracapiController : ApiController
    {
        public List<arac> Get()
        {
            otoservisdbEntities db = new otoservisdbEntities();
            using (db)
            {
                db.Configuration.ProxyCreationEnabled = false;

                arac yeniarac = new arac();
                List<arac> aracliste = new List<arac>();


                aracliste = db.aracs.ToList();
                return aracliste;
            }
        }
    }
}