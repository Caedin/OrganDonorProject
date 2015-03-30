using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OrganDonorSystem.Controllers
{
    public class DonorInfoController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        //
        // GET: /DonorInfo/

        public ActionResult Index()
        {
            var viewModel = new DonorInfoIndexViewModel
            {


                donorID = 3,
                age = (from Donor in OrganDonorSystemDatabase.Donors
                       where Donor.DonorID == 3
                       select Donor.age).Single(),

                gender = (from Donor in OrganDonorSystemDatabase.Donors
                          where Donor.DonorID == 3
                          select Donor.gender).Single(),

                phone = (from Donor in OrganDonorSystemDatabase.Donors
                         where Donor.DonorID == 3
                         select Donor.phoneNumber).Single(),
                registration = (from Donor in OrganDonorSystemDatabase.Donors
                                where Donor.DonorID == 3
                                select Donor.registrationDate).Single(),
            };

        

            return View(viewModel);

        }
            
            
            
           
        }

    }
           