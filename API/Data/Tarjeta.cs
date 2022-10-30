using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Tarjeta
    {
        public long NroTarjeta { get; set; }
        public int? CodSeguridad { get; set; }
        public DateTime? FechaVenc { get; set; }
        public long? Dni { get; set; }

        public virtual Cliente? DniNavigation { get; set; }
    }
}
