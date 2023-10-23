namespace WebApiRest.Models
{
    public class JuegoChallenger
    {
        public int IdSala { get; set; }
        public int IdJugador { get; set; }
        public string Iniciales { get; set; }
        public int Posicion { get; set; }
    }

    public class JuegoChallengerList
    {
        public string Info { get; set; }
        public int Error { get; set; }
        public List<JuegoChallenger> Lista { get; set; }
    }
}
