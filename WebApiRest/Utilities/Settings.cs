namespace WebApiRest.Utilities
{
    public class Settings
    {
        public string SecretKey { get; set; }
        public int TimeExpTokenMin { get; set; }
        public bool HttpsClient { get; set; }
        public bool Production { get; set; }
    }
}
