//
//  Meal.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/7/23.
//

import Foundation

struct Response: Decodable {
    let meals: [Meal]
}

struct Meal: Codable, Equatable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSources: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    func toDictionary() -> [String: String?] {
        var mealData: [String: String?] = [:]

        // Assuming your mealData dictionary has a fixed number of ingredients and measurements
        for i in 1...20 {
            let ingredientKey = "strIngredient\(i)"
            let measureKey = "strMeasure\(i)"

            mealData[ingredientKey] = ""
            mealData[measureKey] = ""
        }
        
        mealData["strIngredient1"] = self[keyPath: \Meal.strIngredient1]
        mealData["strIngredient2"] = self[keyPath: \Meal.strIngredient2]
        mealData["strIngredient3"] = self[keyPath: \Meal.strIngredient3]
        mealData["strIngredient4"] = self[keyPath: \Meal.strIngredient4]
        mealData["strIngredient5"] = self[keyPath: \Meal.strIngredient5]
        mealData["strIngredient6"] = self[keyPath: \Meal.strIngredient6]
        mealData["strIngredient7"] = self[keyPath: \Meal.strIngredient7]
        mealData["strIngredient8"] = self[keyPath: \Meal.strIngredient8]
        mealData["strIngredient9"] = self[keyPath: \Meal.strIngredient9]
        mealData["strIngredient10"] = self[keyPath: \Meal.strIngredient10]
        mealData["strIngredient11"] = self[keyPath: \Meal.strIngredient11]
        mealData["strIngredient12"] = self[keyPath: \Meal.strIngredient12]
        mealData["strIngredient13"] = self[keyPath: \Meal.strIngredient13]
        mealData["strIngredient14"] = self[keyPath: \Meal.strIngredient14]
        mealData["strIngredient15"] = self[keyPath: \Meal.strIngredient15]
        mealData["strIngredient16"] = self[keyPath: \Meal.strIngredient16]
        mealData["strIngredient17"] = self[keyPath: \Meal.strIngredient17]
        mealData["strIngredient18"] = self[keyPath: \Meal.strIngredient18]
        mealData["strIngredient19"] = self[keyPath: \Meal.strIngredient19]
        mealData["strIngredient20"] = self[keyPath: \Meal.strIngredient20]
        
        mealData["strMeasure1"] = self[keyPath: \Meal.strMeasure1]
        mealData["strMeasure2"] = self[keyPath: \Meal.strMeasure2]
        mealData["strMeasure3"] = self[keyPath: \Meal.strMeasure3]
        mealData["strMeasure4"] = self[keyPath: \Meal.strMeasure4]
        mealData["strMeasure5"] = self[keyPath: \Meal.strMeasure5]
        mealData["strMeasure6"] = self[keyPath: \Meal.strMeasure6]
        mealData["strMeasure7"] = self[keyPath: \Meal.strMeasure7]
        mealData["strMeasure8"] = self[keyPath: \Meal.strMeasure8]
        mealData["strMeasure9"] = self[keyPath: \Meal.strMeasure9]
        mealData["strMeasure10"] = self[keyPath: \Meal.strMeasure10]
        mealData["strMeasure11"] = self[keyPath: \Meal.strMeasure11]
        mealData["strMeasure12"] = self[keyPath: \Meal.strMeasure12]
        mealData["strMeasure13"] = self[keyPath: \Meal.strMeasure13]
        mealData["strMeasure14"] = self[keyPath: \Meal.strMeasure14]
        mealData["strMeasure15"] = self[keyPath: \Meal.strMeasure15]
        mealData["strMeasure16"] = self[keyPath: \Meal.strMeasure16]
        mealData["strMeasure17"] = self[keyPath: \Meal.strMeasure17]
        mealData["strMeasure18"] = self[keyPath: \Meal.strMeasure18]
        mealData["strMeasure19"] = self[keyPath: \Meal.strMeasure19]
        mealData["strMeasure20"] = self[keyPath: \Meal.strMeasure20]

        return mealData
    }
    
}

struct Photo: Decodable {
     let originalSize: PhotoInfo

    enum CodingKeys: String, CodingKey {

        // Maps API key name to a more "swifty" version (i.e. lowerCamelCasing and no `_`)
        case originalSize = "original_size"
    }
}

struct PhotoInfo: Decodable {
    let url: URL
}

/*
"idMeal": "52768",
            "strMeal": "Apple Frangipan Tart",
            "strDrinkAlternate": null,
            "strCategory": "Dessert",
            "strArea": "British",
            "strInstructions": "Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
            "strTags": "Tart,Baking,Fruity",
            "strYoutube": "https://www.youtube.com/watch?v=rp8Slv4INLk",
            "strIngredient1": "digestive biscuits",
            "strIngredient2": "butter",
            "strIngredient3": "Bramley apples",
            "strIngredient4": "butter, softened",
            "strIngredient5": "caster sugar",
            "strIngredient6": "free-range eggs, beaten",
            "strIngredient7": "ground almonds",
            "strIngredient8": "almond extract",
            "strIngredient9": "flaked almonds",
            "strIngredient10": "",
            "strIngredient11": "",
            "strIngredient12": "",
            "strIngredient13": "",
            "strIngredient14": "",
            "strIngredient15": "",
            "strIngredient16": null,
            "strIngredient17": null,
            "strIngredient18": null,
            "strIngredient19": null,
            "strIngredient20": null,
            "strMeasure1": "175g/6oz",
            "strMeasure2": "75g/3oz",
            "strMeasure3": "200g/7oz",
            "strMeasure4": "75g/3oz",
            "strMeasure5": "75g/3oz",
            "strMeasure6": "2",
            "strMeasure7": "75g/3oz",
            "strMeasure8": "1 tsp",
            "strMeasure9": "50g/1¾oz",
            "strMeasure10": "",
            "strMeasure11": "",
            "strMeasure12": "",
            "strMeasure13": "",
            "strMeasure14": "",
            "strMeasure15": "",
            "strMeasure16": null,
            "strMeasure17": null,
            "strMeasure18": null,
            "strMeasure19": null,
            "strMeasure20": null,
            "strSource": null,
            "strImageSource": null,
            "strCreativeCommonsConfirmed": null,
            "dateModified": null
 

 
*/

struct Ingredient {
    var nameIngredient: String
    var measurement: String
}


// Methods for saving, retrieving and removing movies from favorites
extension Meal {
    static var addtoCookBookKey: String {
        return "My CookBook"
    }

    static func save(_ meals: [Meal], forKey key: String) {
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        let encodedData = try! JSONEncoder().encode(meals)
        // 3.
        defaults.set(encodedData, forKey: key)
    }

    static func getMeals(forKey key: String) -> [Meal] {
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        if let data = defaults.data(forKey: key) {
            // 3.
            let decodedMeals = try! JSONDecoder().decode([Meal].self, from: data)
            // 4.
            return decodedMeals
        } else {
            // 5.
            return []
        }
    }
    
    func addtoCookBookKeyMeals() {
        // 1.
        var addtoCookBookKeyMeals = Meal.getMeals(forKey: Meal.addtoCookBookKey)
        // 2.
        addtoCookBookKeyMeals.append(self)
        // 3.
        Meal.save(addtoCookBookKeyMeals, forKey: Meal.addtoCookBookKey)
    }

    func removeFromAddtoCookBookKeyMeals() {
        // 1.
        var addtoCookBookKeyMeals = Meal.getMeals(forKey: Meal.addtoCookBookKey)
        // 2.
        addtoCookBookKeyMeals.removeAll { meal in
            // 3.
            return self == meal
        }
        // 4.
        Meal.save(addtoCookBookKeyMeals, forKey: Meal.addtoCookBookKey)
    }
    static var addtoFavorites: String {
        return "Favorites"
    }
    
    func addtoFavorites() {
        // 1.
        var addtoFavorites = Meal.getMeals(forKey: Meal.addtoFavorites)
        // 2.
        addtoFavorites.append(self)
        // 3.
        Meal.save(addtoFavorites, forKey: Meal.addtoFavorites)
    }

    func removeFromAddtoFavorites() {
        // 1.
        var addtoFavorites = Meal.getMeals(forKey: Meal.addtoFavorites)
        // 2.
        addtoFavorites.removeAll { meal in
            // 3.
            return self == meal
        }
        // 4.
        Meal.save(addtoFavorites, forKey: Meal.addtoFavorites)
    }
}
