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
                              Proveedor = new ProveedorModel(p.IdProveedor, p.NombreProveedor, p.Cuit)
                          }).ToListAsync();


        return Ok(lotes);
    }

    [HttpGet("obtenerDetalles")]
    public async Task<ActionResult<List<DetalleLoteModel>>> DetallesPorId(int idLote)
    {
        var detalles = await _context.DetalleLotes
                            .Join(_context.Articulos,
                            dl => dl.IdArticulo,
                            a => a.IdArticulo,
                            (dl, a) => new DetalleLoteModel
                            {
                                IdLote = dl.IdLote,
                                IdDetalleLote = dl.IdDetalleLote,
                                CantidadComprada = dl.CantidadComprada,
                                PrecioCompra = dl.PrecioCompra,
                                NombreArticulo = a.Nombre
                            }).Where(x => x.IdLote == idLote)
                            .ToListAsync();

        return Ok(detalles);
    }


    [HttpPut("ModificarDetalle")]
    public async Task<ActionResult<DetalleLoteModel>> ModificarDetalle(DetalleLoteModel det)
    {
        var detalle = await _context.DetalleLotes.FirstOrDefaultAsync(x => x.IdDetalleLote == det.IdDetalleLote);

        if (detalle == null)
        {
            return NotFound("No se encontro el detalle");
        }
        else
        {
            detalle.CantidadComprada = det.CantidadComprada;
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
    public async Task<ActionResult<LoteModel>> InsertarLote(LoteCreateModel lote)
    {
        var newLote = new Lote
        {            
            FechaLote = lote.FechaLote,
            Total = lote.Total,
            IdProveedor = lote.idProveedor

        };
        _context.Lotes.Add(newLote);
        await _context.SaveChangesAsync();

        var loteCreado = new LoteModel
        {   
            IdLote = newLote.IdLote,
            FechaLote = newLote.FechaLote,
            Total = newLote.Total         

        };
        return Ok(loteCreado);
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
