//
//  rsvpListView.swift
//  wics app
//
//  Created by Kaushiki Singh on 3/17/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct rsvpListView: View {
    @Environment(\.dismiss) private var dismiss
   
    var database = String()
   
    @State private var rsvp = [Student]()

    
    var body: some View {
        
        
        List {
            ForEach(rsvp) { s in
                
             //   HStack{
                    
                    VStack (alignment: .leading, spacing: 5){
                    
                        Text("Name: \(s.name)")
                            .fontWeight(.semibold)
                            .minimumScaleFactor(0.5)
                        Text("Year: \(s.year)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        // }
                    }
             //  }
              
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("List of Attendees")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("moth purple")
                    .resizable()
                    .scaledToFit()
                    .frame(height:70)
            }
            
        }
        .task {
           
            await fetchRSVPs()
         
        }
    
    }
    
    private func fetchRSVPs() async  {
        
        let db = Firestore.firestore()
        guard let snapshot = try? await db.collection(database).getDocuments() else {
            return
        }
        
        // convert each document to a Person object
        // and sort them all in ascending order of name
        self.rsvp = snapshot.documents
            .map { Student(id: $0.documentID, data: $0.data()) }
            .sorted { $0.name < $1.name }
    
    }
    
}

struct rsvpListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            rsvpListView(database: "rsvps")
        }
    }
}
