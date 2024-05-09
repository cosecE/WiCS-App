//
//  mapView.swift
//  wics app
//
//  Created by Kaushiki Singh on 3/28/24.
//




import CoreLocation
import MapKit
import SwiftUI
import Foundation

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct mapView: View {
     
    @State private static var defaultLocation = CLLocationCoordinate2D(
        latitude: 33.4255,
        longitude: -111.9400
    )

    // state property that represents the current map region
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    // state property that stores marker locations in current map region
    @State private var markers = [
        Location(name: "", coordinate: CLLocationCoordinate2D())
    ]
    @State var address:String
   
    @State var instruction: String
   @State private var searchText = ""
    @ObservedObject var tzVM:timezoneVM
    @State var city:String
    var body: some View {
        VStack {
          
            Map(coordinateRegion: $region,
                interactionModes: .all,
                annotationItems: markers
                
            ){ location in
                MapMarker(coordinate: location.coordinate)
        
            }.frame(height: 400)
            
           
           // Spacer()
            Text(address)
                .onAppear{
                    forwardGeocoding(addressStr:city)
                }
                .padding()
          
            searchBar
            
            Text("Current Time at the Location")
                .font(.title2)
                .foregroundColor(.teal)
                .bold()
            
            Text("Time:           \(tzVM.timeT!)")
            Text("Time Zone: \(tzVM.tzID!)")
           
            
        } 
        .padding()
        
       
    }
    

    
    func forwardGeocoding(addressStr: String)
    {
        let geoCoder = CLGeocoder();
        let addressString = addressStr
        CLGeocoder().geocodeAddressString(addressString, completionHandler:
                                            {(placemarks, error) in
            
            if error != nil {
                print("Geocode failed: \(error!.localizedDescription)")
            } else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
               
                print(coords.latitude)
                print(coords.longitude)
                //self.lon = String(coords.longitude)
               // self.lat = String(coords.latitude)
                self.tzVM.getJsonData(long: coords.longitude, lat: coords.latitude)
                DispatchQueue.main.async
                    {
                        region.center = coords
                        markers[0].name = placemark.locality!
                        markers[0].coordinate = coords
                    }
            }
        })
        
        
    }
    
    
    private var searchBar: some View {
        HStack {
            //Button {
            Text(instruction)
                .onAppear(){
                    let searchRequest = MKLocalSearch.Request()
                    searchRequest.naturalLanguageQuery = address
                    searchRequest.region = region
                    
                    MKLocalSearch(request: searchRequest).start { response, error in
                        guard let response = response else {
                            print("Error: \(error?.localizedDescription ?? "Unknown error").")
                            return
                        }
                        region = response.boundingRegion
                        markers = response.mapItems.map { item in
                            Location(
                                
                                name: item.name ?? "",
                                coordinate: item.placemark.coordinate
                            )
                        }
                    }
                }
         //   } label: {
               
           // }
            
        }
        .padding()
        
        
    }
    
    
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView(address: "Maggiano's Little Italy, Orlando", instruction: "inst", tzVM: timezoneVM(), city: "Orlando")
    }
}

 
