//
//  WeatherAPI.swift
//  macro
//
//  Created by Meichel Rendio on 24/11/21.
//

import Foundation

class WeatherAPI{
    func getForecast(){
        

        let request = NSMutableURLRequest(url: NSURL(string: "http://api.weatherapi.com/v1/current.json?key=e8b4010e864d473e9c3202246212311&q=London&aqi=no")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
       
       

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                
                //print(String(bytes: httpResponse?.value(forHTTPHeaderField: "Content-Type") ?? "nil", encoding: String.Encoding.utf8))
            }
        })

        dataTask.resume()
    }

    
}
