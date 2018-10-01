//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Arslan Saeed on 9/30/18.
//  Copyright © 2018 Arslan Saeed. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.dataSource = self
    
    tableView.rowHeight = 200
        
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a5e1894a916adacf4ef0c0e2758f8dcd")!
        
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // normally wouldn't want to use reloadIgnoringLocalCacheData, only used here for testing.
        
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    
        let task = session.dataTask(with: request) { (data, response, error) in
            // the following code runs once the network request returns
            if let error = error {
                    print(error.localizedDescription)
            }
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String : Any]]
        
                for movie in movies{
                    let title = movie["title"] as! String
                    //print(title)
                    
                }
            }
            
        }
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        return cell
    }
    
    
}
