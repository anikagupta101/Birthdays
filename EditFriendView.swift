//
//  EditFriendView.swift
//  Birthdays
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct EditFriendView: View {
    var friend: Friend
    @State private var newName: String
    @State private var newBirthday: Date
    @Environment(\.dismiss) private var dismiss
    
    init(friend: Friend) {
        self.friend = friend
        _newName = State(initialValue: friend.name)
        _newBirthday = State(initialValue: friend.birthday)
    } //closes init (initialization function?)
    
    var body: some View {
        var body: some View {
            Form {
                TextField("Name", text: $newName)
                DatePicker("Birthday", selection: $newBirthday, displayedComponents: .date)
            } //closes Form
        } // closes var body
        .navigationTitle("Edit Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                } //closes Button
            } //closes ToolbarItem
            ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                            friend.name = newName
                                friend.birthday = newBirthday
                        dismiss()
                    } //closes Button
                } //coses ToolbarItem
        } //closes toolbar
    } //closes var body
} //closes struct

#Preview {
    NavigationStack {
        EditFriendView(friend: Friend(name: "Test", birthday: Date.now))
    } //closes NavigationStack
    
} //closes Preview
