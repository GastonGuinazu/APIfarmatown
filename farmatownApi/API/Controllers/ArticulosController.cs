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

  [HttpGet("obtenerArticuloDeDetalle")]
  public async Task<ActionResult<DetalleLoteModel>>ArticuloDelDetalle(int idDetalle){
    var articulos = await _context.DetalleLotes
                        .Join(_context.Articulos,
                        dl => dl.IdArticulo,
                        a => a.IdArticulo,
                        (dl,a) => new DetalleLoteModel{
                          IdDetalleLote = dl.IdDetalleLote,
                          NombreArticulo = a.Nombre,
                          CantidadComprada = dl.CantidadComprada
                        })
                        .Where(x => x.IdDetalleLote == idDetalle)
                        .ToListAsync();
    
    return Ok(articulos);
  }



}