//
//  Friend.swift
//  Birthdays
//
//  Created by Scholar on 7/25/25.
//

import Foundation

class Friend {
    var name : String
    //to assign the variable to something (e.g. "" or "cat"), use =
    //to set a variable to a datatype (not a value), use :
    var birthday : Date
    
    init(name: String, birthday: Date) {
        self.name = name //self. refers to the variables in the object. so self.name is the var name created earlier in the object, name is the name passed when creating the object outside the function
        self.birthday = birthday
    }
}
