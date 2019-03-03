//
//  ViewController.swift
//  AlamofireIsWeird
//
//  Created by Ronak Shah on 3/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listItem(name: "Coconut Water", description: "Refreshingly Fresh", imageURLs: nil)
    }
    
    /// listItem will list a given item to ebay
    ///
    /// Note: imageURLs must contain encoded strings.
    /// To encode a string, run addingPercentEncoding
    ///
    ///     "https://somelink.com".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    ///
    /// - parameters:
    ///     - name: The name of the item
    ///     - description: The description of the item
    ///     - imageURLs: an array of urls that hold pictures of the image. URLS MUST BE ENCODED
    ///                    to encode a string, look at the code above
    func listItem(name: String, description: String, imageURLs: [String]!) {
        let sku = name.replacingOccurrences(of: " ", with: "") + "\(Int.random(in: 10..<9999))"//(name + UUID().uuidString).replacingOccurrences(of: " ", with: "")
        self.createInventoryLocation(sku: sku, productName: name, productDescription: description, price: 10.50)
//        createOffer(sku: sku, productDescription: description, price: 10.50) // this will also call publishOffer
    }
    
    /**
     * Creates an inventory location using eBayAPI
     */
    func createInventoryLocation(sku: String, productName: String, productDescription: String, price: Double) {
        let headers = EbayAPI.headers()
        let parameters = [
            "location": ["address": [
                "addressLine1": "2055 Hamilton Ave",
                "addressLine2": "Building 3",
                "city": "San Jose",
                "stateOrProvince": "CA",
                "postalCode": "95125",
                "country": "US"
                ]],
            "locationInstructions": "Items ship from here.",
            "name": "Warehouse-1",
            "merchantLocationStatus": "ENABLED",
            "locationTypes": ["WAREHOUSE"]
            ] as [String : Any]
        
        let postData: Data!
        
        do {
            postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch let error {
            print("error: \(error)")
            return
        }
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.ebay.com/sell/inventory/v1/location/\(EbayAPI.merchantName)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                
            } else {
                if let _ = response as? HTTPURLResponse {
                    self.createInventoryItem(sku: sku, productName: productName, productDescription: productDescription, price: price)
                }
            }
        })
        
        dataTask.resume()
    }
    
    func createInventoryItem(sku: String, productName: String, productDescription: String, price: Double) {
        let headers = EbayAPI.headers()
        let parameters = [
            "availability": [
                "pickupAtLocationAvailability": [
                    [
                        "availabilityType": "IN_STOCK",
                        "fulfillmentTime": [
                            "unit": "YEAR",
                            "value": "5"
                        ],
                        "merchantLocationKey": "\(EbayAPI.merchantName)",
                        "quantity": "1"
                    ]
                ],
                "shipToLocationAvailability": ["quantity": "1"]
            ],
            "condition": "NEW",
            "conditionDescription": "It's pretty nice",
            "product": [
                "title": "\(productName)",
                "description": "\(productDescription)",
                "aspects": [
                    "name": [
                        productName
                    ]
                ],
                "brand": "HackTech",
                "mpn": "CHDHX-401",
                "imageUrls": ["http://i.ebayimg.com/images/i/182196556219-0-1/s-l1000.jpg", "http://i.ebayimg.com/images/i/182196556219-0-1/s-l1001.jpg", "http://i.ebayimg.com/images/i/182196556219-0-1/s-l1002.jpg"]
            ]
            ] as [String : Any]
        
        let postData: Data!
            
        do {
            postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch let error {
            print("error: \(error)")
            return
        }
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.ebay.com/sell/inventory/v1/inventory_item/\(sku)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                let json = JSON(data)
                print(json)
                
                self.createOffer(sku: sku, productDescription: productDescription, price: price)
            }
        })
        
        dataTask.resume()
    }
    
    func createOffer(sku: String, productDescription: String, price: Double) {
        let headers = EbayAPI.headers()
        let parameters = [
            "sku": sku,
            "marketplaceId": "EBAY_US",
            "merchantLocationKey": EbayAPI.merchantName,
            "format": "FIXED_PRICE",
            "availableQuantity": 1,
            "categoryId": "30120",
            "listingDescription": productDescription,
            "listingPolicies": [
                "fulfillmentPolicyId": "142500100023",
                "paymentPolicyId": "142500097023",
                "returnPolicyId": "142500095023"
            ],
            "pricingSummary": ["price": [
                "currency": "USD",
                "value": "\(price)"
                ]],
            "quantityLimitPerBuyer": 1
            ] as [String : Any]
        
        let postData: Data!
        do {
            postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch let error {
            print("error: \(error)")
            return
        }
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.ebay.com/sell/inventory/v1/offer")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let json = JSON(data as Any)
                print("\n\n\n\n\n\n")
                print(json)
                let offerId = json["offerId"].string
                self.publishOffer(code: offerId!)
            }
        })
        
        dataTask.resume()
    }
    
    func publishOffer(code: String) {
        let headers = EbayAPI.headers()
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.ebay.com/sell/inventory/v1/offer/\(code)/publish")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let json = JSON(data)
                print(json)
                print("https://ebay.com/itm/\(json["listingId"].string!)")
                
            }
        })
        
        dataTask.resume()
    }
    


}

