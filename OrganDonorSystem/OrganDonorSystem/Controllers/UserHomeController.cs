using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;

namespace OrganDonorSystem.Controllers
{
    public class UserHomeController : Controller
    {
        //
        // GET: /UserHome/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /UserHome/UserHomeDonors
        public ActionResult UserHomeDonors()
        {
            //creating test objects to pass into viewModel
            var donors = new List<int> { 123, 123, 432, 4324,356 };

            //passing donor object into View
             var viewModel = new UserHomeViewModel
            {
                numberOfDonors = donors.Count(),
                DonorsIDs = donors,
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
