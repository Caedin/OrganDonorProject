using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class UserHomeController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();
        //
        // GET: /UserHome/

        public ActionResult Index()
        {
            //temp until database is available
            var donorIDs = from Donor in OrganDonorSystemDB.Donors
                         select Donor.DonorID;

            //temp until database is available
            var reps = new List<int> { 000, 001, 003, 0045, 555 };
            var organs = new List<int> { 999, 998, 997, 6445 };

            //passing number of donors,reps and organs into View
            var viewModel = new UserHomeViewModel
            {
                numberOfDonors = donorIDs.Count(),
                numberOfRecipients = reps.Count(),
                numberOfOrgans = organs.Count(),
            };

            return View(viewModel);
        }

        //
        // GET: /UserHome/UserHomeDonors
        public ActionResult UserHomeDonors()
        {
            //getting data from database
            var donorIDs = from Donor in OrganDonorSystemDB.Donors
                         select Donor.DonorID;
            var donorOriginalID = from Donor in OrganDonorSystemDB.Donors
                                  select Donor.originalID;
            var donorPhone = from Donor in OrganDonorSystemDB.Donors
                                  select Donor.phoneNumber;


            //passing donor object into View
             var viewModel = new UserHomeViewModel
            {
                numberOfDonors = donorIDs.Count(),
                Donors = donorIDs.ToList(),
                OriginalIDs = donorOriginalID.ToList(),
                PhoneNumbers = donorPhone.ToList(),
            };

             return View(viewModel);
        }

        //
        // GET: /UserHome/UserHomeRecipients
        public ActionResult UserHomeRecipients()
        {
            //creating test objects to pass into viewModel
            var reps = new List<int> { 000, 001, 003, 0045,555 };

            //passing rep object into View
             var viewModel = new UserHomeViewModel
            {
                numberOfRecipients=reps.Count(),
                RecipientsIDs=reps,
            };

             return View(viewModel);
        }

        //
        // GET: /UserHome/UserHomeOrgans
        public ActionResult UserHomeOrgans()
        {
            //creating test objects to pass into viewModel
            var organs = new List<int> { 999, 998, 997, 6445 };

            //passing organ object into View
            var viewModel = new UserHomeViewModel
            {
                numberOfOrgans=organs.Count(),
                OrganIDs = organs

            };

            return View(viewModel);
        }

    }
}
