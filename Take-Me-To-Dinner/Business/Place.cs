//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Business
{
    using System;
    using System.Collections.Generic;
    
    public partial class Place
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Place()
        {
            this.MostWantedPlaces = new HashSet<MostWantedPlace>();
            this.PlacesPhotos = new HashSet<PlacesPhoto>();
            this.PlacesReviews = new HashSet<PlacesReview>();
            this.UserSearchHistories = new HashSet<UserSearchHistory>();
        }
    
        public int IdPlace { get; set; }
        public string Type { get; set; }
        public Nullable<int> IdCity { get; set; }
        public string Name { get; set; }
        public string Adress { get; set; }
        public string Telephone { get; set; }
        public string Website { get; set; }
        public Nullable<int> Rating { get; set; }
        public Nullable<double> RatingFloat { get; set; }
        public string Lat { get; set; }
        public string Long { get; set; }
        public Nullable<System.TimeSpan> OpenTime { get; set; }
        public Nullable<System.TimeSpan> CloseTime { get; set; }
        public Nullable<bool> Confirmed { get; set; }
        public string IdPartner { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }
        public Nullable<int> AveragePrice { get; set; }
    
        public virtual City City { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MostWantedPlace> MostWantedPlaces { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlacesPhoto> PlacesPhotos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlacesReview> PlacesReviews { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserSearchHistory> UserSearchHistories { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
    }
}
