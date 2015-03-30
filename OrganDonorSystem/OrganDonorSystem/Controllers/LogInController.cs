using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class LogInController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();

        //
        // GET: /LogIn/
        public ActionResult Index()
        {
            var viewModel = new UserLogInViewModel
            {
             
            };

            return View(viewModel);
        }
    }
}
