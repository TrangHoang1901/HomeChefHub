//
//  ViewController.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/7/23.
//

import UIKit
import Nuke
import NukeExtensions

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("🍏 numberOfRowsInSection called with meals count: \(meals.count)")
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("🍏 cellForRowAt called for row: \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
        let meal = meals[indexPath.row]
        
        if let posterPath = meal.strMealThumb,

            // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
           let imageUrl = URL(string: posterPath) {

            // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
            NukeExtensions.loadImage(with: imageUrl, into: cell.mealImageView)
            
        }
        
        cell.mealNameLabel.text = meal.strMeal
        cell.mealTagsLabel.text = meal.strTags
        return cell
    }
    
    
    
    // Table view outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    private var meals: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        fetchMeals()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // MARK: - Pass the selected movie to the Detail View Controller

        // Get the index path for the selected row.
        // `indexPathForSelectedRow` returns an optional `indexPath`, so we'll unwrap it with a guard.
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }

        // Get the selected movie from the movies array using the selected index path's row
        let selectedMeal = meals[selectedIndexPath.row]

        // Get access to the detail view controller via the segue's destination. (guard to unwrap the optional)
        guard let detailViewController = segue.destination as? DetailViewController else { return }

        detailViewController.meal = selectedMeal
    }
    
    private func fetchMeals() {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=b")!
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                print("❌ Response error: \(String(describing: response))")
                return
            }
            
            guard let data = data else {
                print("❌ Data is NIL")
                return
            }
            //if let dataString = String(data: data, encoding: .utf8) {
            //    print("Data Content: \(dataString)")
            //}
                
            do {
                let decoder = JSONDecoder()
                
                let mealResponse = try decoder.decode(Response.self, from: data)
                // Access the array of movies
                let meals = mealResponse.meals
                
                DispatchQueue.main.async { [weak self] in
                    
                    print("✅ We got \(meals.count) meals!")
                    for meal in meals {
                        print("🍏 Meal Name: \(meal.strMeal)")
                    }
                    self?.meals = meals
                    self?.tableView.reloadData()
                }
            } catch {
                print("❌ Error decoding JSON: \(error.localizedDescription)")
            }
        }
        session.resume()
    }
        
}
    

