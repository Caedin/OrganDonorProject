using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class CityStateViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();

        public List<State> TheStates {get;set;}
        public List<SelectListItem> listStates  {get;set;}
        public CityStateViewModel()
        {
           TheStates = (from State in OrganDonorSystemDB.States
                         select State).ToList();
           foreach(State singleState in TheStates)
           {
               listStates.Add(new SelectListItem { Text = singleState.state1, Value = singleState.stateID.ToString() });
           }
        }
    }
}

