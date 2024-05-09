//
//  ContentView.swift
//  wics app
//
//  Created by Kaushiki Singh on 3/17/24.
//

import SwiftUI

struct ContentView: View {
  
 //   @StateObject  var eventModel = EventModel()
    
    var body: some View {
        
        NavigationStack{
            Text("  Welcome!")
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5)
                .font(.title)
                .foregroundColor(.black)
                .frame(alignment: .center)
            
            NavigationLink(destination: menuView()) {
                 
                 HStack{ 
                  
                     VStack (alignment: .leading, spacing: 5){
                           
                             Image("moth purple")
                                 .resizable()
                                 .scaledToFit()
                                 .frame(height:200)
                             
                             Text("            Next")
                                 .fontWeight(.semibold)
                                 .minimumScaleFactor(0.5)
                                 .font(.title)
                                 .foregroundColor(.blue)
                                 .frame(alignment: .center)
                       
                     }
                 }
                 
            }
        }
    }
    
  
    
}

#Preview {
    ContentView()
}
