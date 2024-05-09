

//  wics app
//
//  Created by Kaushiki Singh on 3/17/24.
//

import SwiftUI

struct menuView: View {
   // @StateObject  var menuModel = MenuModel()
    
    var body: some View {
       
        
        NavigationStack{
                
            
            List {
                Image("wics purple")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
              
                   NavigationLink(destination: eventView()) {
                        
                        HStack{
                         
                            VStack (alignment: .leading, spacing: 5){
                                
                                HStack{
                                    
                                    Image("moth purple")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:50)
                                    
                                    Text("Upcoming Events")
                                        .fontWeight(.semibold)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        }
                        
                    }
                
                NavigationLink(destination: contactView()) {
                     
                     HStack{
                      
                         VStack (alignment: .leading, spacing: 5){
                             
                             HStack{
                                 
                                 Image("contacts")
                                     .resizable()
                                     .scaledToFit()
                                     .frame(height:50)
                                 
                                 Text("Contacts")
                                     .fontWeight(.semibold)
                                     .minimumScaleFactor(0.5)
                             }
                         }
                     }
                     
                 }
                
                
              
            }
            .navigationBarTitleDisplayMode(.automatic)
            
            
          
        }
        
        
        
  
    }
    
  
    
}

#Preview {
    menuView()
}
