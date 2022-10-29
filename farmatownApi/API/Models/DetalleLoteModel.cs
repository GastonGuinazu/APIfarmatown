namespace API.Models;

public class DetalleLoteModel
{
  public int? IdDetalleLote { get; set; }
  public int? IdLote { get; set; }
  public int? CantidadComprada { get; set; }
  public decimal? PrecioCompra { get; set; }
  public string? NombreArticulo { get; set; }
}
