namespace WebApi.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class WebApiContext : DbContext
    {
        public WebApiContext()
            : base("name=WebApiContext")
        {
            this.Configuration.LazyLoadingEnabled = true;
        }

        public virtual DbSet<Area> Areas { get; set; }
        public virtual DbSet<Empleado> Empleados { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Area>()
                .HasMany(e => e.Empleados)
                .WithMany(e => e.Areas)
                .Map(m => m.ToTable("AreasEmpleado").MapLeftKey("AreaId").MapRightKey("EmpleadoId"));
        }
    }
}
