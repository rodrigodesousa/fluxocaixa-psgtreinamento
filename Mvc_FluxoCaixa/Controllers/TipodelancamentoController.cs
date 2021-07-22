using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Mvc_FluxoCaixa.Models;

namespace Mvc_FluxoCaixa.Controllers
{
    public class TipodelancamentoController : Controller
    {
        private FluxoCaixaEntities db = new FluxoCaixaEntities();

        // GET: Tipodelancamentoes
        public ActionResult Index()
        {
            return View(db.tipodelancamento.ToList());
        }

        // GET: Tipodelancamentoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipodelancamento tipodelancamento = db.tipodelancamento.Find(id);
            if (tipodelancamento == null)
            {
                return HttpNotFound();
            }
            return View(tipodelancamento);
        }

        // GET: Tipodelancamentoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Tipodelancamentoes/Create
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "tipolancamentoId,descrição")] tipodelancamento tipodelancamento)
        {
            if (ModelState.IsValid)
            {
                db.tipodelancamento.Add(tipodelancamento);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tipodelancamento);
        }

        // GET: Tipodelancamentoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipodelancamento tipodelancamento = db.tipodelancamento.Find(id);
            if (tipodelancamento == null)
            {
                return HttpNotFound();
            }
            return View(tipodelancamento);
        }

        // POST: Tipodelancamentoes/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "tipolancamentoId,descrição")] tipodelancamento tipodelancamento)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipodelancamento).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tipodelancamento);
        }

        // GET: Tipodelancamentoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tipodelancamento tipodelancamento = db.tipodelancamento.Find(id);
            if (tipodelancamento == null)
            {
                return HttpNotFound();
            }
            return View(tipodelancamento);
        }

        // POST: Tipodelancamentoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tipodelancamento tipodelancamento = db.tipodelancamento.Find(id);
            db.tipodelancamento.Remove(tipodelancamento);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
