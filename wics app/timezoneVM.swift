//
//  weatherVM.swift
//  wics app
//
//  Created by Kaushiki Singh on 4/16/24.
//

import Foundation


struct timezone : Decodable
{
   
    let sunrise:String
    let lng:Double
    let countryCode: String
    let gmtOffset: Int
    let rawOffset: Int
    let sunset: String
    let timezoneId: String
    let dstOffset: Int
    let countryName: String
    let time: String
    let lat:Double
}



class timezoneVM : ObservableObject
{
    @Published var timeT:String?
    @Published var tzID:String?
   
    init()
    {
        timeT = "fetching data..."
        tzID = "fetching data..."
        
    }
    func getJsonData(long: Double, lat: Double) {
       
        
        /* make sure to add the user name to change your user name once you have registered in
           http://api.geonames.org/
        */
        let urlAsString =
        "http://api.geonames.org/timezoneJSON?lat="+String(lat)+"&lng="+String(long)+"&username=kaushiki"
      //  "http://api.geonames.org/timezoneJSON?lat=33.425504&lng=-111.938474&username=kaushiki"
        

   
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var err: NSError?
            
            do {
                let decodedData = try JSONDecoder().decode(timezone.self, from: data!)
               // let eqItems = decodedData.earthquakes
               // print(eqItems.count)
                
                DispatchQueue.main.async {
                    self.timeT = decodedData.time
                    self.tzID = decodedData.timezoneId
                  
                  print(decodedData.timezoneId)
                    //self.latitude = String(decodedData.postalcodes[0].lat)
                 
                    
                }
                
            } catch {
                print("error: \(error)")
            }
        })
        jsonQuery.resume()
    }
    
    
    
}
