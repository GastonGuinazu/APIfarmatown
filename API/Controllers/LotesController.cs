using API.Data;
using API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class LotesController : ControllerBase
{
    private readonly farmatown3Context _context;

    public LotesController(farmatown3Context context)
    {
        _context = context;
    }

    [HttpGet("obtenerLotes")]
    public async Task<ActionResult<List<LoteModel>>> Lotes()
    {
        var lotes = await _context.Lotes
                          .Join(_context.Proveedores,
                          l => l.IdProveedor,
                          p => p.IdProveedor,
                          (l, p) => new LoteModel
                          {
                              IdLote = l.IdLote,
                              FechaLote = l.FechaLote,
                              Total = l.Total,
                              idProveedor = p.IdProveedor
                          }).ToListAsync();


        return Ok(lotes);
    }

    [HttpGet("obtenerDetalles")]
    public async Task<ActionResult<List<DetalleLoteCreateModel>>> DetallesPorId(int idLote)
    {
        var detalles = await _context.DetalleLotes
                            .Join(_context.Articulos,
                            dl => dl.IdArticulo,
                            a => a.IdArticulo,
                            (dl, a) => new DetalleLoteCreateModel
                            {
                                IdLote = dl.IdLote,                                
                                CantidadComprada = dl.CantidadComprada,
                                PrecioCompra = dl.PrecioCompra,
                                idArticulo = a.IdArticulo
                            }).Where(x => x.IdLote == idLote)
                            .ToListAsync();

        return Ok(detalles);
    }


    [HttpPut("ModificarDetalle")]
    public async Task<ActionResult<DetalleLoteModel>> ModificarDetalle(DetalleModificarModel det)
    {
        var detalle = await _context.DetalleLotes.FirstOrDefaultAsync(x => x.IdDetalleLote == det.IdDetalle);

        if (detalle == null)
        {
            return NotFound("No se encontro el detalle");
        }
        else
        {
            detalle.CantidadComprada = det.cantidad;
            await _context.SaveChangesAsync();
            return Ok();
        }
    }

    [HttpPut("ModificarTotalLote")]
    public async Task<ActionResult<LoteTotalModel>> ModificarTotalLote(LoteTotalModel det)
    {
        var detalle = await _context.Lotes.FirstOrDefaultAsync(x => x.IdLote == det.IdLote);

        if (detalle == null)
        {
            return NotFound("No se encontro el lote");
        }
        else
        {
            detalle.Total = det.Total;
            await _context.SaveChangesAsync();
            return Ok();
        }
    }

    [HttpDelete("BorrarDetalles{idLote}")]
    public async Task<ActionResult> DeleteDetalles(int idLote)
    {
        List<DetalleLote> detalles = (from d in _context.DetalleLotes.Where(x => x.IdLote == idLote) select d).ToList();
        if (detalles.Count == 0)
        {
            return NotFound($"No se encontro el detalle {idLote}");
        }
        foreach (DetalleLote det in detalles)
        {
            _context.DetalleLotes.Remove(det);

        }
        await _context.SaveChangesAsync();
        return Ok();
    }


    [HttpDelete("BorrarLote{idLote}")]
    public async Task<ActionResult> DeleteLote(int idLote)
    {
        var lote = await _context.Lotes.FirstOrDefaultAsync(x => x.IdLote == idLote);

        if (lote == null)
        {
            return NotFound("No se encontro el lote");
        }
        else
        {
            _context.Lotes.Remove(lote);
            await _context.SaveChangesAsync();
            return Ok();
        }
    }

    // [HttpPost]
    // public async Task<ActionResult<LoteModel>> Create(LoteCreateModel lote)
    // {
    //     var newLote = new Lote
    //     {            
    //         FechaLote = lote.FechaLote,
    //         Total = lote.Total,
    //         IdProveedor = lote.Proveedor.IdProveedor

    //     };
    //     _context.Lotes.Add(newLote);
    //     await _context.SaveChangesAsync();

    //     var loteCreado = new LoteModel
    //     {   
    //         IdLote = newLote.IdLote,
    //         FechaLote = newLote.FechaLote,
    //         Total = newLote.Total         

    //     };
    //     return Ok(loteCreado);
    // }

    [HttpPost("InsertarLote")]
    public async Task<ActionResult<int>> InsertarLote(LoteCreateModel lote)
    {
        var newLote = new Lote
        {            
            FechaLote = lote.FechaLote,
            Total = lote.Total,
            IdProveedor = lote.idProveedor

        };
        _context.Lotes.Add(newLote);
        await _context.SaveChangesAsync();
        var idLote=newLote.IdLote;

        
        return Ok(idLote);
    }

    [HttpPost("InsertarDetalleLote{idLote}")]
    public async Task<ActionResult<DetalleLoteModel>> InsertarDetalleLote(DetalleLoteCreateModel detalle, int idLote)
    {
        var newDetalleLote = new DetalleLote
        {            
            IdLote = idLote,
            CantidadComprada = detalle.CantidadComprada,
            PrecioCompra = detalle.PrecioCompra,
            IdArticulo = detalle.idArticulo

        };
        _context.DetalleLotes.Add(newDetalleLote);
        await _context.SaveChangesAsync();

        var detalleLoteCreado = new DetalleLoteModel
        {   
            IdDetalleLote = newDetalleLote.IdDetalleLote,
            IdLote = newDetalleLote.IdLote,
            CantidadComprada = newDetalleLote.CantidadComprada,
            PrecioCompra = newDetalleLote.PrecioCompra
            //NombreArticulo = newDetalleLote.IdArticuloNavigation.Nombre      

        };
        return Ok(detalleLoteCreado);
    }

}
