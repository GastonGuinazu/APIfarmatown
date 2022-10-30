using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class DetalleLote
    {
        public int IdDetalleLote { get; set; }
        public int? IdArticulo { get; set; }
        public int? IdLote { get; set; }
        public int? CantidadComprada { get; set; }
        public decimal? PrecioCompra { get; set; }

        public virtual Articulo? IdArticuloNavigation { get; set; }
        public virtual Lote? IdLoteNavigation { get; set; }
    }
}
