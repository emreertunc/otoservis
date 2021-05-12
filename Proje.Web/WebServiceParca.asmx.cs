using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Proje.Business;
using Proje.DataAccess;

namespace Proje.Web
{
    /// <summary>
    /// Summary description for WebServiceParca
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebServiceParca : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public object getParcaAd(string prefixText)
        {
            return parcaislem.getSpesificParca2(prefixText);
        }

        //[WebMethod]
        //public object getParcaAd2(string prefixText)
        //{
        //    return parcaislem.getSpesificParca3(Convert.ToInt32(prefixText));
        //}
    }
}
