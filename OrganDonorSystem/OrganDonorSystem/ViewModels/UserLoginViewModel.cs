using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    //test class for dummy data
    public class UserLogInViewModel
    {
        public UserLogInViewModel()
        {
            //getting logged in infromation
            loggedIn = CurrentlyLoggedIn.getUserID();
            firstName = CurrentlyLoggedIn.getFirstName();
            lastName = CurrentlyLoggedIn.getLastName();
        }
        public int loggedIn { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public void SomeMethod_Click(object sender, EventArgs e)
        {

        }
    }
}