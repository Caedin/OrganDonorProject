using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.Models
{
    static public class CurrentlyLoggedIn
    {
        static private int? userID;

        public static void setUserID(int? user)
        {
            userID = user;
        }

        public static int? getUserID()
        {
            return userID;
        }
    }
}