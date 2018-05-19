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
            this.UserSearchHistories = new HashSet<UserSearchHistory>();
        }
    
        public int IdPlace { get; set; }
        public int IdType { get; set; }
        public string Name { get; set; }
        public string Adress { get; set; }
        public string Telephone { get; set; }
        public string Website { get; set; }
        public Nullable<double> Rating { get; set; }
        public Nullable<int> RatingVotes { get; set; }
        public string Lat { get; set; }
        public string Long { get; set; }
        public string GoogleMapLink { get; set; }
        public Nullable<System.TimeSpan> OpenTime { get; set; }
        public Nullable<System.TimeSpan> CloseTime { get; set; }
        public Nullable<bool> Confirmed { get; set; }
        public string IdPartner { get; set; }
        public string Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MostWantedPlace> MostWantedPlaces { get; set; }
        public virtual PlacesType PlacesType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlacesPhoto> PlacesPhotos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserSearchHistory> UserSearchHistories { get; set; }
    }
}
