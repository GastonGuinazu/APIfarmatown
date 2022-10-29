namespace API.Models;

public class DetalleLoteCreateModel
{  
  public int? IdLote { get; set; }
  public int? CantidadComprada { get; set; }
  public decimal? PrecioCompra { get; set; }
  public int? idArticulo { get; set; }
}
