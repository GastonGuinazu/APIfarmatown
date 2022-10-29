using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class DetallesFactura
    {
        public int IdDetalle { get; set; }
        public int? IdFactura { get; set; }
        public int? IdArticulo { get; set; }
        public int? Descuento { get; set; }
        public decimal? MontoDescontado { get; set; }
        public decimal? Subtotal { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Precio { get; set; }

        public virtual Articulo? IdArticuloNavigation { get; set; }
        public virtual Factura? IdFacturaNavigation { get; set; }
    }
}
