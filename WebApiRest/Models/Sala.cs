namespace WebApiRest.Models
{
    public class Sala
    {
        public int IdSala { get; set; }
        public string Nombre { get; set; }
        public string Imagen { get; set; }
        public string Descripcion { get; set; }
        public int IdModoJuego { get; set; }
        public string ModoJuego { get; set; }
        public int Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }

    public class SalaList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<Sala> Lista { get; set; }
    }

    public class SalaItem
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public Sala Sala { get; set; }
    }
}
