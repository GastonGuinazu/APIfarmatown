using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Cliente
    {
        public Cliente()
        {
            Facturas = new HashSet<Factura>();
            Tarjeta = new HashSet<Tarjeta>();
        }

        public long Dni { get; set; }
        public string? Nombre { get; set; }
        public string? Apellido { get; set; }
        public long? Telefono { get; set; }

        public virtual ICollection<Factura> Facturas { get; set; }
        public virtual ICollection<Tarjeta> Tarjeta { get; set; }
    }
}
