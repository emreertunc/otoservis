//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Configuration;

//using Twilio;
//using Twilio.Rest.Api.V2010.Account;

//namespace smsdeneme
//{
//    public class smsverify
//    {
//        public class Authinfo
//        {
//            public string token { get; set; }
//            public DateTime time { get; set; }
//        }
        
//        public static Authinfo smsyolla()
//        {
//            Authinfo auth = new Authinfo();

//            Random rnd = new Random();
//            string rndToken = (rnd.Next(100000, 999999)).ToString();

//            var time1 = DateTime.UtcNow;

//            // Find your Account Sid and Token at twilio.com/console
//            // and set the environment variables. See http://twil.io/secure
//            string accountSid = "**********************************";
//            string authToken = "******************************";

//            TwilioClient.Init(accountSid, authToken);

//            var message = MessageResource.Create(
//                body: "Ertunç Teknik Servis doğrulama kodunuz:" + rndToken,
//                from: new Twilio.Types.PhoneNumber("+120************"),
//                to: new Twilio.Types.PhoneNumber("+90*************")
//            );

//            auth.token = rndToken;
//            auth.time = time1;

//            return auth;

//        }
//        public static string onayla(DateTime time1, string rndToken,string kod)
//        {
//            if (time1.AddMinutes(1) > DateTime.UtcNow)
//            {

//                if (rndToken == kod)
//                {
//                    return "giriş başarılı";
//                }
//                else return "giriş başarısız";
//            }
//            else return "zaman aşımı";
//        }
//    }
//}