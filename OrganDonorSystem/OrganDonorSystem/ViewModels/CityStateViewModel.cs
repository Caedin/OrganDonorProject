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
        public List<City> TheCities { get; set; }
        public List<SelectListItem> listStates  {get;set;}
        public List<SelectListItem> listCities {get;set;}
        public CityStateViewModel()
        {
           this.listCities = new List<SelectListItem>();
           this.listStates = new List<SelectListItem>();

           TheStates = (from State in OrganDonorSystemDB.States
                         select State).ToList();

           TheCities = (from City in OrganDonorSystemDB.Cities
                        select City).ToList();

           for(int i=0;i<TheStates.Count();i++)
           {
               SelectListItem tempState = new SelectListItem{ Text = TheStates[i].state1, Value = TheStates[i].stateID.ToString() };
               listStates.Add(tempState);
           }
           for (int i = 0; i < TheCities.Count(); i++)
           {
               SelectListItem tempCity = new SelectListItem { Text = TheCities[i].city1, Value = TheCities[i].cityID.ToString() };
               listCities.Add(tempCity);
           }
        }

        //method to change cities on dropdownlist select (currently not working)
        public void changeCities(int ID)
        {
           List<SelectListItem> tempList = new List<SelectListItem>();
           TheCities = (from City in OrganDonorSystemDB.Cities
                         where City.stateStateID == ID
                         select City).ToList();
           for(int i=0;i<TheCities.Count();i++)
           {
               SelectListItem tempCity = new SelectListItem{ Text = TheCities[i].city1, Value = TheCities[i].cityID.ToString() };
               tempList.Add(tempCity);
           }
           this.listCities = tempList;
        }

        public bool checkCityState(int cityID, int stateID)
        {
            foreach(City city in TheCities)
            {
                if (city.stateStateID == stateID && city.cityID == cityID)
                {
                    return (true);
                }
            }
            return(false);
        }
    }
}

