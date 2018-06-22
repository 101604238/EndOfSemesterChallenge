using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrapeVineWPF.Models
{
    class jsonplaceholder
    {
        class TourEvent
        {
            public string TourName { get; set; }
            public string EventDate { get; set; }
            public string EventFee { get; set; }
        }

        class TourEvents
        {
            public List<TourEvent> TourEventList { get; set; }
        }
    }
}
