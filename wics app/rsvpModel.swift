//
//  rsvpModel.swift
//  wics app
//
//  Created by Kaushiki Singh on 3/17/24.
//

import Foundation

struct Student: Identifiable{
    var id: String
    var name: String
    var email: String
    var year: String
    
    
    init(){
        id = ""
        name = ""
        email = ""
        year = ""
    }
    
    // initializer used when parsing data received from firestore
    init(id: String, data: [String: Any]){
        self.id = id
        self.name = data["name"] as! String
        self.email = data["email"] as! String
        self.year = data["year"] as! String
    }
    
    // utility function used when uploading a new rsvpt to firestore
    func toDict() -> [String: Any] {
        [
            "name": name,
            "email": email,
            "year": year
        ]
    }
    
    
}
