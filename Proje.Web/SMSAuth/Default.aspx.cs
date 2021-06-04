//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using Twilio;
//using Twilio.Rest.Api.V2010.Account;
//using smsdeneme;

//namespace smsdeneme
//{
//    public partial class _Default : Page
//    {
//        public static DateTime time1;
//        public static string rndToken;
//        protected void Page_Load(object sender, EventArgs e)
//        {
            
//        }

//        protected void Button1_Click(object sender, EventArgs e)
//        {

//            smsverify.Authinfo auth = new smsverify.Authinfo();

//            auth = smsverify.smsyolla();

//            time1 = auth.time;
//            rndToken = auth.token;

//            //time1 = smsverify.smsyolla();

//        }

//        protected void TextBox1_TextChanged(object sender, EventArgs e)
//        {

//        }

//        protected void Button2_Click(object sender, EventArgs e)
//        {
//            string kod = TextBox1.Text;
//            string giris = smsverify.onayla(time1, rndToken, kod);
//            Label1.Text = giris;
//        }
//    }
//}