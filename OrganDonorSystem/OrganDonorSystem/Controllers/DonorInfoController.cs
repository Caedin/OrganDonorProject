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
        //
        // GET: /DonorInfo/

        public ActionResult Index()
        {
            var viewModel = new DonorInfoIndexViewModel
            {
                
            donorID = 34,
            age = 23, gender = "Male", phone = "233-222-1411"
            }; //registration = 

        

            return View(viewModel);

        }
            
            
            
           
        }

    }
           