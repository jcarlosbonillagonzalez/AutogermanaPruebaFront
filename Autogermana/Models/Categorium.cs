using System;
using System.Collections.Generic;

namespace Autogermana.Models
{
    public partial class Categorium
    {
        public Categorium()
        {
            Productos = new HashSet<Producto>();
        }

        public int Idcategoria { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Descripcion { get; set; }
        public bool? Estado { get; set; }

        public virtual ICollection<Producto> Productos { get; set; }
    }
}
