using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Laboratorio
    {
        public Laboratorio()
        {
            Articulos = new HashSet<Articulo>();
        }

        public int IdLaboratorio { get; set; }
        public string? NombreLab { get; set; }

        public virtual ICollection<Articulo> Articulos { get; set; }
    }
}
