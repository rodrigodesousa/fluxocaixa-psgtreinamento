﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class FluxoCaixaEntities : DbContext
    {
        public FluxoCaixaEntities()
            : base("name=FluxoCaixaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<cliente> cliente { get; set; }
        public virtual DbSet<despesa> despesa { get; set; }
        public virtual DbSet<fluxodecaixa> fluxodecaixa { get; set; }
        public virtual DbSet<fornecedor> fornecedor { get; set; }
        public virtual DbSet<produto> produto { get; set; }
        public virtual DbSet<tipodelancamento> tipodelancamento { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
    }
}
