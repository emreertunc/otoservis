//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proje.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class parca
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public parca()
        {
            this.serviskalems = new HashSet<serviskalem>();
        }
    
        public int parcaID { get; set; }
        public string parcaKodu { get; set; }
        public string parcaAdi { get; set; }
        public decimal fiyatAlis { get; set; }
        public decimal fiyatSatis { get; set; }
        public int stok { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<serviskalem> serviskalems { get; set; }
    }
}
