//
//  controllerLogic.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/13/24.
//

import Foundation

func fetchTasks() {
    let urlString = "https://jsonplaceholder.typicode.com/todos"
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        guard let data = data else {
            print("No data returned")
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print("Response JSON: \(json)")
        } catch {
            print("JSON parsing error: \(error.localizedDescription)")
        }
    }
    
    task.resume()
}


