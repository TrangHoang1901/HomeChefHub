//
//  DetailViewController.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/10/23.
//

import UIKit
import NukeExtensions



class IngredientTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
}

class DetailViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("🍏 numberOfRowsInSection called with ingredients count: \(ingredients.count)")
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTableViewCell
        let ingredient = ingredients[indexPath.row]
        cell.ingredientLabel.text = ingredient.nameIngredient
        cell.measurementLabel.text = ingredient.measurement
        
        return cell
    }
    

    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    @IBOutlet weak var areaNameLabel: UILabel!
    
    @IBOutlet weak var mealInstructions: UITextView!
    
    var meal: Meal!
    var ingredients: [Ingredient] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            // 1.
            meal.addtoFavorites()
        } else {
            // 2.
            meal.removeFromAddtoFavorites()
        }
    }
    
    
    @IBOutlet weak var addtoCookBook: UIButton!
    @IBAction func didTapAddtoCookBook(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            // 1.
            meal.addtoCookBookKeyMeals()
        } else {
            // 2.
            meal.removeFromAddtoCookBookKeyMeals()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        // MARK: - Fetch and set images for image views
        if let posterPath = meal.strMealThumb,

            // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
           let imageUrl = URL(string: posterPath) {
               
               // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
               NukeExtensions.loadImage(with: imageUrl, into: backdropImageView)
           }
        mealNameLabel.text = meal.strMeal
        categoryNameLabel.text = meal.strCategory
        areaNameLabel.text = meal.strArea
        mealInstructions.text = meal.strInstructions
        addIngredient()
        tableView.dataSource = self
        
        //favoriteButton.layer.cornerRadius = min(favoriteButton.frame.width, favoriteButton.frame.height) / 2

        // 1.
        let favorites = Meal.getMeals(forKey: Meal.addtoFavorites)
        // 2.
        if favorites.contains(meal) {
            // 3.
            favoriteButton.isSelected = true
        } else {
            // 4.
            favoriteButton.isSelected = false
        }
        
        addtoCookBook.layer.cornerRadius = 0.05 * addtoCookBook.frame.size.width
        
        // 1.
        let addtoCookBooks = Meal.getMeals(forKey: Meal.addtoCookBookKey)
        // 2.
        if addtoCookBooks.contains(meal) {
            // 3.
            addtoCookBook.isSelected = true
        } else {
            // 4.
            addtoCookBook.isSelected = false
        }
    }
    
    func addIngredient() {
        let mealData = meal.toDictionary()
        for i in 1...20 {
            let ingredientKey = "strIngredient\(i)"
            let measureKey = "strMeasure\(i)"

            if let ingredientName = mealData[ingredientKey], let measurement = mealData[measureKey],
               let unwrappedIngredientName = ingredientName, !unwrappedIngredientName.isEmpty,
               let unwrappedMeasurement = measurement, !unwrappedMeasurement.isEmpty {
                    let ingredient = Ingredient(nameIngredient: unwrappedIngredientName, measurement: unwrappedMeasurement)
                    ingredients.append(ingredient)
            }
        }

    }

}

