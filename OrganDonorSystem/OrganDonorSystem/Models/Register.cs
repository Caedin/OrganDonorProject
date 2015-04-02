using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.Models
{
    public class Register
    {
        public string userName { get; set; }
        public string userPassword { get; set; }
        public string medicalFacility { get; set; }
        public string contactEmail { get; set; }
        public string phoneNumer { get; set; }
        public string state { get; set; }
        public string city { get; set; }
    }
}