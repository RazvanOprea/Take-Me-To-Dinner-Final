using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Managers
{
    [DataObject]
    public class PlacesManager
    {
        public static List<Place> GetAllPlaces()
        {
            using (var db = new EntitiesContext())
            {
                return db.Places.OrderBy(x => x.Name).ToList();
            }
        }

        public static List<Place> GetAllConfirmedPlaces()
        {
            using (var db = new EntitiesContext())
            {
                return db.Places.Where(x => x.Confirmed == true).OrderBy(x => x.Name).ToList();
            }
        }

        public static Place GetPlaceByID(int placeId)
        {
            using (var db = new EntitiesContext())
            {
                return (from place in db.Places where place.IdPlace == placeId select place).SingleOrDefault();
            }
        }

        public static List<Place> GetAllPlacesByCityId(int cityId, int rating)
        {
            using (var db = new EntitiesContext())
            {
                // TO DO: Check if confirmed == true
                return db.Places.Where(x => x.IdCity == cityId && x.Rating >= rating).ToList();
            }
        }

        public static String GetGoogleMapsQuery(int idPlace)
        {
            using (var db = new EntitiesContext())
            {
                Place place = db.Places.Where(x => x.IdPlace == idPlace).SingleOrDefault();
                string city = db.Cities.SingleOrDefault(x =>x.IdCity == place.IdCity).Name;
                return place.Name + " " + city;
            }
        }

    }
}
