using Mvc_FluxoCaixa.Models;
using PagedList;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mvc_FluxoCaixa.Controllers
{
    public class RelatorioController : Controller
    {
        private FluxoCaixaEntities db = new FluxoCaixaEntities();
        // GET: Relatorio
        public ActionResult RelatorioFluxodecaixa(int? pagina, Boolean? pdf)
        {
            var listaFluxodecaixa = db.fluxodecaixa.OrderBy(f => f.fluxodecaixaid).ToList();

            if (pdf != true)
            {
                int numeroRegistros = 3;
                int numeroPagina = (pagina ?? 1);
                return View(listaFluxodecaixa.ToPagedList(numeroPagina, numeroRegistros));
            }
            else
            {
                int pagNumero = 1;

                var relatorioPDF = new ViewAsPdf
                {
                    ViewName = "RelatorioFluxodecaixa",
                    IsGrayScale = true,
                    Model = listaFluxodecaixa.ToPagedList(pagNumero, listaFluxodecaixa.Count)
                };
                return relatorioPDF;
            }
        }
    }
}