using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Managers
{
    [DataObject]
    public class PlacesController
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

        public static List<Place> GetAllPlacesByAPartner(string userId)
        {
            using (var db = new EntitiesContext())
            {
                return db.Places.Where(x => x.IdPartner == userId).OrderBy(x => x.Name).ToList();
            }
        }

        public static Place GetPlaceByID(int placeId)
        {
            using (var db = new EntitiesContext())
            {
                return (from place in db.Places where place.IdPlace == placeId select place).SingleOrDefault();
            }
        }

        public static void UpdatePlace(Place updatedPlace)
        {
            using (var db = new EntitiesContext())
            {
                var place = GetAllPlaces().Where(x => x.IdPlace == updatedPlace.IdPlace).SingleOrDefault();
                if (place == null)
                    return;
                place.Adress = updatedPlace.Adress;
                place.CloseTime = updatedPlace.CloseTime;
                place.Confirmed = updatedPlace.Confirmed;
                place.Description = updatedPlace.Description;
                place.GoogleMapLink = updatedPlace.GoogleMapLink;
                place.IdPartner = updatedPlace.IdPartner;
                place.IdPlace = updatedPlace.IdPlace;
                place.IdType = updatedPlace.IdType;
                place.Lat = updatedPlace.Lat;
                place.Long = updatedPlace.Long;
                place.Name = updatedPlace.Name;
                place.OpenTime = updatedPlace.OpenTime;
                place.Rating = updatedPlace.Rating;
                place.RatingVotes = updatedPlace.RatingVotes;
                place.Telephone = updatedPlace.Telephone;
                place.Website = updatedPlace.Website;
                db.SaveChanges();
            }
                
        }

    }
}
