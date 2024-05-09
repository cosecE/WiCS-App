//
//  eventView.swift
//  wics app
//
//  Created by Kaushiki Singh on 4/15/24.
//

import SwiftUI

struct eventView: View {
    @StateObject  var eventModel = EventModel()
    
    var body: some View {
        
        NavigationStack{
          
            List {
             
               ForEach(eventModel.data, id: \.id) { event in
                   NavigationLink(destination: eventDetails(eModel: eventModel, meeting: event.name, description: event.details, location: event.location, inst: event.instruction, cityName: event.city)) {
                        
                        HStack{
                          
                            VStack (alignment: .leading, spacing: 5){
                                
                                Text(event.name)
                                    .fontWeight(.semibold)
                                    .minimumScaleFactor(0.5)
                             
                            }
                        }
                        
                    }
               } 
            }
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Upcoming Events")
            .toolbar {
               
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("moth purple")
                        .resizable()
                        .scaledToFit()
                        .frame(height:70)
                       // .cornerRadius(20)
                   
                }
            }
        }
    }
    
  
    
}

#Preview {
    eventView()
}
