using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Articulo
    {
        public Articulo()
        {
            DetalleLotes = new HashSet<DetalleLote>();
            DetallesFacturas = new HashSet<DetallesFactura>();
        }

        public int IdArticulo { get; set; }
        public string? Nombre { get; set; }
        public int? Stock { get; set; }
        public decimal? PrecioUnitario { get; set; }
        public int? IdTipoArticulo { get; set; }
        public int? IdDroga { get; set; }
        public int? IdLaboratorio { get; set; }

        public virtual Droga? IdDrogaNavigation { get; set; }
        public virtual Laboratorio? IdLaboratorioNavigation { get; set; }
        public virtual TipoArticulo? IdTipoArticuloNavigation { get; set; }
        public virtual ICollection<DetalleLote> DetalleLotes { get; set; }
        public virtual ICollection<DetallesFactura> DetallesFacturas { get; set; }
    }
}
