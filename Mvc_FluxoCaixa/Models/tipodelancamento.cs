//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Mvc_FluxoCaixa.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tipodelancamento
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tipodelancamento()
        {
            this.fluxodecaixa = new HashSet<fluxodecaixa>();
        }
    
        public int tipolancamentoId { get; set; }
        public string descrição { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<fluxodecaixa> fluxodecaixa { get; set; }
    }
}
