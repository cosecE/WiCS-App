//
//  EventModel.swift
//  wics app
//
//  Created by Kaushiki Singh on 3/17/24.
//

import Foundation
/* ViewModel, No model in this application*/
struct Event: Identifiable{
    var id = UUID()
    var name = String()
    var details = String()
    var location = String()
    var instruction = String()
    var database = String()
    //var date = Date()
    var city = String()
    
}
public class EventModel: ObservableObject {
  
    @Published var data = [Event(name: "Grace Hopper WiCS Dinner 09/26/23", details: "Join us for a relaxing dinner with WiCS GHC scholarship holders!", location: "Maggiano's Little Italy, Orlando", instruction: "Please ask for WiCS at the reception.", database: "rsvps", city: "Orlando"), Event(name:"Tech Talk with Chime on 11/15/23", details: "Join us for free pizza and a presentation from Chime to learn abour their technology roles!", location: "Brickyard Engineering", instruction: "Room 209: Please take the elevator in front of Bank of America to second floor.", database: "chime", city: "Tempe"),
                           Event(name: "Mentorship Meeting on 01/19/24", details: "Join us for the first meeting of our mentorship program and meet your teammates!", location: "Hayden Library", instruction: "Room C5: If you enter through the door accross MU, take the stairs or elevator to the basement.", database: "mentorship", city: "Tempe")]
    
    var count: Int {
        data.count
    }
    
    func getEvent(at index: Int) -> Event {
        return data[index]
    }
    
    func add(event: Event) {
        data.append(event)
    }
    
    func findEvent(event: String) -> Event{
        var loc:Int = 0
        var ev: Event = Event()
        print(event)
        for e in data
        {
            if e.name == event
            {
                ev = e
                break;
                
            }
            loc = loc + 1
            print(ev.database)
        }
        return ev
    }
    
}

