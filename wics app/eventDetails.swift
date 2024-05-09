//
//  eventDetails.swift
//  wics app
//
//  Created by Kaushiki Singh on 3/17/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct eventDetails: View {
    //@Environment(\.dismiss) private var dismiss
    
  
    @State var student = Student()
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingSuccessAlert = false
    @ObservedObject  var eModel : EventModel
    //@StateObject var studentList = rsvpModel()
    var meeting: String
    var description: String
    var location: String
    var inst: String
    var cityName: String
   @State var isChecked = false
    @State  var nextPage = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("moth purple")
                    .resizable()
                    .scaledToFit()
                    .frame(height:70)
                
                Text(description)
                    .foregroundColor(.purple)
                    .padding()
                
                
                NavigationLink("Location: \(location)") {
                    mapView(address: location, instruction: inst, tzVM: timezoneVM(), city: cityName)
                }.buttonStyle(.bordered)
                .border(Color.black)
                .font(.title2)
                 
               
                Text("Click to view the location")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                  
                
                HStack{
                    
                    Text("Name:")
                        .foregroundColor(.blue)
                    // Spacer()
                    TextField("Enter Full Name", text: $student.name)
                        .textFieldStyle(.roundedBorder)
                    
                }.padding()
                
                HStack{
                    
                    Text("ASU email:")
                        .foregroundColor(.blue)
                    //  Spacer()
                    TextField("Enter ASU email", text: $student.email)
                        .textFieldStyle(.roundedBorder)
                    
                }.padding()
                
                HStack{
                    
                    Text("School Year:")
                        .foregroundColor(.blue)
                    // Spacer()
                    TextField("Enter School Year", text: $student.year)
                        .textFieldStyle(.roundedBorder)
                    
                }.padding()
                
                Toggle("I will be attending", isOn: $isChecked)
                    .toggleStyle(CheckToggleStyle())
                    .padding()
                   
                Button(action:
                        {
                    uploadStudent()
                
                   // print(studentList.rsvp)
                    
                },
                       label: {
                    Text("RSVP")
                }).buttonStyle(.bordered)
                    .padding()
                
                Button(action:
                        {
                    nextPage = true
                },
                       label: {
                    Text("See who's attending")
                }).buttonStyle(.bordered)
                    .padding()
                    
              
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(meeting)
            .background(
                NavigationLink(destination: rsvpListView(database: eModel.findEvent(event: meeting).database), isActive: $nextPage){
                   EmptyView()
                }
            )
        
            .alert("Success", isPresented: $showingSuccessAlert) {
                Button("Done", role: .cancel) {
                   // dismiss()
                    showingSuccessAlert = false
                }
            } message: {
                Text("\(student.name) added to the RSVP List.")
            }
            
        }
       // padding()
        
    }
    
    struct CheckToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button {
                configuration.isOn.toggle()
            } label: {
                Label {
                    configuration.label
                } icon: {
                    Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(configuration.isOn ? Color.accentColor : .secondary)
                        .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                        .imageScale(.large)
                }
            }
            .buttonStyle(.plain)
        }
    }
    
    private func uploadStudent() {
        let db = Firestore.firestore()
        db.collection(eModel.findEvent(event: meeting).database).addDocument(data: student.toDict()) { error in
            if let error {
                showAlert(title: "Network Error", message: error.localizedDescription)
                return
            }
            showingSuccessAlert = true
        }
    }
    
    private func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
       // showingProgressView = false
        showingAlert = true
    }

    
}

#Preview {
    eventDetails( student: Student(), eModel: EventModel(), meeting: "event", description: "description", location: "Brickyard Engineering", inst: "instructions", cityName: "Tempe")
}


