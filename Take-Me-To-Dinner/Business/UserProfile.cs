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
    
    public partial class UserProfile
    {
        public int Id { get; set; }
        public string IdUser { get; set; }
        public Nullable<int> IdCity { get; set; }
        public string City { get; set; }
        public Nullable<int> MinRating { get; set; }
        public Nullable<int> MinPrice { get; set; }
        public Nullable<int> MaxPrice { get; set; }
    
        public virtual City City1 { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
    }
}
