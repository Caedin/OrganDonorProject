using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.Models
{
    static public class CurrentlyLoggedIn
    {
        static private int userID = -1;

        public static int getUserID()
        {
            return userID;
        }
        public static void setUserID(int user)
        {
            userID = user;

        }
 
    }
}