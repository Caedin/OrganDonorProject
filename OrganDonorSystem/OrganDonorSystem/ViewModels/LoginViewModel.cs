using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    //test class for dummy data
    public class LoginViewModel
    {

        public LoginViewModel()
        {
            //getting logged in infromation
            responseMessage = "";
        }

        public string responseMessage { get; set; }
    }
}