using System.Xml.Schema;
using API.Data;
using API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ArticulosController : ControllerBase
{
  private readonly farmatown3Context _context;

  public ArticulosController(farmatown3Context context)
  {
    _context=context;
  }

  [HttpGet("obtenerArticulos")]
  public async Task<ActionResult<ArticuloModel>>Articulos(){
    var articulos = await _context.Articulos
                    .Select(x => new ArticuloModel {
                      idArticulo = x.IdArticulo,
                      nombreArticulo = x.Nombre,
                      precioUnitario = x.PrecioUnitario
                    })
                    .ToListAsync();
    
    return Ok(articulos);
  }


//asdasdasd
}