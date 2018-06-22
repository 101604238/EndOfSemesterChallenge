using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using GrapeVineAPI.Models;

namespace GrapeVineWPF
{
    /// <summary>
    /// Interaction logic for MainMenu.xaml
    /// </summary>
    public partial class MainMenu : Page
    {
        HttpClient client = new HttpClient();
        public MainMenu()
        {
            InitializeComponent();
            List<TourEvents> tourEvents = new List<TourEvents>();

            //resultsLV.Items.Add(new GameResults() { GameNo = "1", HomeTeam = "Boxhill Stags", HomeGoals = "0", AwayTeam = "Kew Knights", AwayGoals = "2" });
        }

        class TourEvents
        {
            public string TourName { get; set; }
            public string EventDate { get; set; }
            public string EventFee { get; set; }
        }

        private async void ViewData_Click(object sender, RoutedEventArgs e)
        {
            client.BaseAddress = new Uri("http://localhost:50622/api/");

            HttpResponseMessage httpResponseMessage = await client.GetAsync("api/TourEvents");

            var content = await httpResponseMessage.Content.ReadAsStringAsync();

            var tourEvents = JsonConvert.DeserializeObject<List<TourEvent>>(content);

            string json = JsonConvert.SerializeObject(tourEvents);

            TourEventsLV.ItemsSource = json;

            //TourEventsLV.Items.Add(new TourEvent() { tourName = "This actually worked", eventDate = Convert.ToDateTime("13/2/2016"), eventFee = Convert.ToDecimal(250.00) });

        }
    }
}
