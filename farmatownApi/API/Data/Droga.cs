using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Droga
    {
        public Droga()
        {
            Articulos = new HashSet<Articulo>();
        }

        public int IdDroga { get; set; }
        public string? NombreDroga { get; set; }

        public virtual ICollection<Articulo> Articulos { get; set; }
    }
}
