﻿using System;
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

        public static List<PlacesPhoto> GetPlacePhotos(int placeId)
        {
            using (var db = new EntitiesContext())
            {
                return db.PlacesPhotos.Where(x => x.IdPlace == placeId).ToList();
            }
        }

        public static List<PlacesReview> GetReviews(int placeId)
        {
            using (var db = new EntitiesContext())
            {
                return db.PlacesReviews.Where(x => x.IdPlace == placeId).OrderBy(x => x.Date).ToList();
            }
        }

        public static void AddReview(int idPlace, string idUser, string email, string review, int rating, DateTime date)
        {
            PlacesReview rev = new PlacesReview{
                IdPlace = idPlace,
                IdUser = idUser,
                EmailUser = email,
                Review = review,
                Rating = rating,
                Date = date };

            using (var db = new EntitiesContext())
            {
                db.PlacesReviews.Add(rev);
                db.SaveChanges();
            }
            UpdateRatingAfterReview(idPlace);
        }

        public static void DeleteReview(int idReview)
        {
            using (var db = new EntitiesContext())
            {
                var review = db.PlacesReviews.Where(x => x.IdReview == idReview).SingleOrDefault();
                if (review != null)
                {
                    db.PlacesReviews.Remove(review);
                    db.SaveChanges();
                }
                UpdateRatingAfterReview(review.IdPlace);
            }
        }

        public static void UpdateRatingAfterReview(int idPlace)
        {
            using (var db = new EntitiesContext())
            {
                List<PlacesReview> reviews = db.PlacesReviews.Where(x => x.IdPlace == idPlace).ToList();
                int sum = 0;
                foreach (var review in reviews)
                {
                    sum = sum + review.Rating;
                }
                float ratingFloat = (float)sum / reviews.Count;
                int rating = (int)Math.Round(ratingFloat);
                Place place = db.Places.SingleOrDefault(x => x.IdPlace == idPlace);
                place.Rating = rating;
                place.RatingFloat = Convert.ToDouble(ratingFloat.ToString("0.0"));
                db.SaveChanges();

            }
        }
        
        public static bool UserReviewedBefore(int idPlace, string userId)
        {
            using (var db = new EntitiesContext())
            {
                var reviews = db.PlacesReviews.Where(x => x.IdPlace == idPlace && x.IdUser == userId).ToList();
                if (reviews.Count > 0)
                    return true;
                return false;
            }
        }

    }
}
