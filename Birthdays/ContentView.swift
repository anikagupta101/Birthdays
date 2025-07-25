//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends : [Friend]
    //= [Friend(name: "Sana", birthday: .now), Friend(name: "Anika", birthday: Date(timeIntervalSince1970: 1227550000))] //instead of holding strings or doubles, this array is going to hold Friends
    
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        NavigationStack {
            List {
                ForEach(friends) { friend in
                    HStack {
                        HStack {
                            Text(friend.name)
                            Spacer()
                            Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                        } //closes HStack
                    } //closes other HStack
                } //closes ForEach
                .onDelete(perform: deleteFriend)
            } //closes List
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    } //closes DatePicker
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        //friends.append(newFriend)
                        context.insert(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                } //closes VStack
                .padding()
                .background(.bar)
            } //closes safeAreaInset
        } //closes NavigationStack
    } //closes body
    //step 7: add functionality to delete a friend
    func deleteFriend(at offsets: IndexSet) {
        for index in offsets {
            let friendToDelete = friends[index]
            context.delete(friendToDelete)
        } //closes for loop
    } //closes deleteFriend function
} //closes struct

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory : true)
}
