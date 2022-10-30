using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class TipoArticulo
    {
        public TipoArticulo()
        {
            Articulos = new HashSet<Articulo>();
        }

        public int IdTipoArticulo { get; set; }
        public string? Descripcion { get; set; }

        public virtual ICollection<Articulo> Articulos { get; set; }
    }
}
