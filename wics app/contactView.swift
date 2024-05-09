//
//  contactView.swift
//  wics app
//
//  Created by Kaushiki Singh on 4/15/24.
//

import Foundation
import SwiftUI

struct contactView: View {
   
    
    var body: some View {
        
        // padding()
        VStack{
            Image("moth purple")
                .resizable()
                .scaledToFit()
                .frame(height:70)
            
            HStack{
                Text("Website: ")
                    .foregroundColor(.purple)
                    .padding()
                Text("asuwics.org")
                    .padding()
            }
            
            HStack{
                Text("Instagram: ")
                    .foregroundColor(.purple)
                    .padding()
                Text("@wics.asu")
                    .padding()
            }
            HStack{
            Text("Email: ")
                .foregroundColor(.purple)
                .padding()
                
                Text("wics.asu@gmail.com")
                    .padding()
            }
        }
        
    }
    
}
    #Preview {
       contactView()
    }
