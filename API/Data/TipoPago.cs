using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class TipoPago
    {
        public TipoPago()
        {
            Facturas = new HashSet<Factura>();
        }

        public bool TipoPago1 { get; set; }
        public string? Descripcion { get; set; }

        public virtual ICollection<Factura> Facturas { get; set; }
    }
}
