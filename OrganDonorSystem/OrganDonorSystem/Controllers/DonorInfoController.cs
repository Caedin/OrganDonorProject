using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class DonorInfoController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        //
        // GET: /DonorInfo/

        public ActionResult Index()
        {
            int number;
            string blah = Request.QueryString["dID"];
            bool result = Int32.TryParse(blah, out number);
            int dID = number;
            var viewModel = new DonorInfoIndexViewModel
            {

                donorID = dID,
                age = (from Donor in OrganDonorSystemDatabase.Donors
                       where Donor.DonorID == dID
                       select Donor.age).Single(),

                gender = (from Donor in OrganDonorSystemDatabase.Donors
                          where Donor.DonorID == dID
                          select Donor.gender).Single(),

                phone = (from Donor in OrganDonorSystemDatabase.Donors
                         where Donor.DonorID == dID
                         select Donor.phoneNumber).Single(),
                registration = (from Donor in OrganDonorSystemDatabase.Donors
                                where Donor.DonorID == dID
                                select Donor.registrationDate).Single(),
            };

        

            return View(viewModel);

        }
            
            
            
           
        }

    }
           