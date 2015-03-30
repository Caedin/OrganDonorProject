using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.Models
{
    static public class CurrentlyLoggedIn
    {
        static private int userID = 2;
        static private string firstName = "Lisa";
        static private string lastName = "Gonzalez";

        public static int getUserID()
        {
            return userID;
        }
        public static void setUserID(int user)
        {
            userID = user;
        }
        public static string getFirstName()
        {
            return firstName;
        }
        public static void setFirstName(string first)
        {
            firstName = first;
        }
        public static string getLastName()
        {
            return lastName;
        }
        public static void setLastName(string last)
        {
            lastName = last;
        }
 
    }
}