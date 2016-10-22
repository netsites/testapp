namespace WebApi.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Empleados")]
    public partial class Empleado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Empleado()
        {
            Areas = new HashSet<Area>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(64)]
        public string Nombre { get; set; }

        [Required]
        [StringLength(64)]
        public string SegundoNombre { get; set; }

        [Required]
        [StringLength(64)]
        public string ApellidoPaterno { get; set; }

        [Required]
        [StringLength(64)]
        public string PaellidoMaterno { get; set; }

        public DateTime FechaNacimiento { get; set; }

        public bool Genero { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Area> Areas { get; set; }
    }
}
