//
//  AddtoCookBookViewController.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/11/23.
//

import UIKit
import NukeExtensions

class AddtoCookBookViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var emptyCookBook: UILabel!
    var addtoCookBooks: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        defer {
            // Show the "Empty Favorites" label if there are no favorite movies
            if addtoCookBooks.isEmpty {
                emptyCookBook.isHidden = false
            }
            else {
                emptyCookBook.isHidden = true
            }
        }
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 1.
        let meals = Meal.getMeals(forKey: Meal.addtoCookBookKey)
        // 2.
        self.addtoCookBooks = meals
        // 3.
        tableView.reloadData()


    }

    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addtoCookBooks.count
    }

    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCellCookBook", for: indexPath) as! MealCell

        // Get the movie associated table view row
        let meal = addtoCookBooks[indexPath.row]

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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }

        // Get the selected movie from the movies array using the selected index path's row
        let selectedMeal = addtoCookBooks[selectedIndexPath.row]

        // Get access to the detail view controller via the segue's destination. (guard to unwrap the optional)
        guard let detailViewController = segue.destination as? DetailViewController else { return }

        detailViewController.meal = selectedMeal
    }

}
