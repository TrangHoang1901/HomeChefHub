//
//  User.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/12/23.
//

import Foundation

struct UserData: Codable, Equatable {
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}



extension UserData {
    static let userDataKey = "userData"

    static func saveUser(_ users: [UserData], forKey key: String) {
        let defaults = UserDefaults.standard
        let encodedData = try? JSONEncoder().encode(users)
        defaults.set(encodedData, forKey: key)
    }

    static func getUsers() -> [UserData] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: UserData.userDataKey),
           let decodedUsers = try? JSONDecoder().decode([UserData].self, from: data) {
            return decodedUsers
        } else {
            return []
        }
    }

    func addUserProfile() {
        var addUser = UserData.getUsers()
        addUser.append(self)
        UserData.saveUser(addUser, forKey: UserData.userDataKey)
    }

    func removeUserProfile() {
        var removeUser = UserData.getUsers()
        removeUser.removeAll { user in
            return self == user
        }
        UserData.saveUser(removeUser, forKey: UserData.userDataKey)
    }

    func printAllUsers() {
        let allUsers = UserData.getUsers()
        for (index, user) in allUsers.enumerated() {
            print("User \(index + 1):")
            print("First Name: \(user.firstName)")
            print("Last Name: \(user.lastName)")
            print("Email: \(user.email)")
            print("------------")
        }
    }

    
    static var addtoFavorites: String {
        return "Favorites"
    }

    static var addtoCookBookKey: String {
        return "MyCookBook"
    }
    
    func addtoCookBookKeyMeals(meal: Meal) {
        var cookbookMeals = Meal.getMeals(forKey: UserData.addtoCookBookKey)
        cookbookMeals.append(meal)
        Meal.save(cookbookMeals, forKey: UserData.addtoCookBookKey)
    }

    func removeFromAddtoCookBookKeyMeals(meal: Meal) {
        var cookbookMeals = Meal.getMeals(forKey: UserData.addtoCookBookKey)
        cookbookMeals.removeAll { $0 == meal }
        Meal.save(cookbookMeals, forKey: UserData.addtoCookBookKey)
    }
}
