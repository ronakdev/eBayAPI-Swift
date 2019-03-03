//
//  EbayAPI.swift
//  eBayLister
//
//  Created by Ronak Shah on 3/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class EbayAPI {
    static let merchantName = "HackTechEbayMerchantKey"

    class func headers() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-EBAY-C-MARKETPLACE-ID" : "EBAY_US",
            "Content-Language" : "en-US",
            "Authorization" : "Bearer v^1.1#i^1#p^3#r^0#I^3#f^0#t^H4sIAAAAAAAAAOVYa2wUVRRmu20RS0EJgkGEdYAqkNm989idnYFdWbotNJR26ZZX0TR3Z+60Q+exnbnTdqMJtSZANJIYo2IURRNJ6g9F1Cj+MEEhEY0x4RFMNGICiaiEJiICGhPvbB9sSwTaktDE3U02c+55fd85586dAd2lU5ZsX739crlvctHebtBd5PMxZWBKacnSaf6iOSWTQIGCb2/3wu7iHv+55Q409KzUgJysZToo0GXopiPlhTHKtU3Jgo7mSCY0kCNhWUon1tZKbBBIWdvClmzpVKAmGaPUiBzNZMIKqypACIs8kZqDPhstsi4LAHKiAjkWqCoMk3XHcVGN6WBo4hjFAkakAUd+jSAscYLE8EGGizZRgQ3IdjTLJCpBQMXz6Up5W7sg1xunCh0H2Zg4oeI1iep0faImWVXXuDxU4Cs+wEMaQ+w6w68qLQUFNkDdRTcO4+S1pbQry8hxqFC8P8Jwp1JiMJkxpJ+nOiMISjSMBJYPM2FRBreFymrLNiC+cR6eRFNoNa8qIRNrOHczRgkbma1IxgNXdcRFTTLg/a1zoa6pGrJjVNXKxOb16aoGKpBOpWyrQ1OQ4iFlBFbkQIRjRSpuW6ZtOTRqzwIXDQTq9zZA84hIlZapaB5pTqDOwisRyRqN5IYt4IYo1Zv1dkLFXkaFekKeQy4oclyTV9T+Krq41fTqigxCRCB/efMKDLbEtSa4XU0RhRGAGIaXYZiNKmHuuqbwZn0MjRH3apNIpUJeLigDc7QB7TaEszqUES0Tel0D2ZoicWGV5aIqopWIqNK8qKo02Q4iNKMiBBDKZGQx+n/qD4xtLeNiNNQjIxfyIGOUx6mkQVXCVhsyG3NZRI3UzG89A43R5cSoVoyzUijU2dkZ7OSClt0SYgFgQpvW1qblVmRAakhXu7kyreVbREbEytEkTBKIUV2kA0lws4WKN1RVN1SlVzc31q+pqhvs3mGZxUdK/wNpWrayKGXpmpybWBA5W0lBG+fSSNeJYFwgHQ/knYbnzfpwiJ4PhziBWS3odVxQtoyQBcmu5Yma81kHbkUp5BCSgv17APEctBFULFPPjcV4FDaa2UFGyLJzYwk4ZDwKGyjLlmvisYQbMB2Fherqqqbr3i4xloAF5qNJ04R6DmuyMxRyXI2fyGZrDMPFMKOjGuVOT8CIAY+SmyI/bngTDFWDZcK2tDfrrZBOaTJbqzmYTjUkachElIwgiwwtczzgWCiMC/vaFm2CQWcigijyEU6MAMCNC1sSdUy0ukYBiHIyB2hVzACaZ1CYhjIToUVVZMUMjwSeiY4Lc6Wuka1i4h01VlsORsr4oJEz8cQC5c3j4DhCJcrQEYGcG3k1qtAwAhk6A8K3XM3iZSNEBYfL654rQsMf7OOT8h+mx/cR6PG9X+TzgRBYxCwAD5X61xf7p85xNIyC5CAadLQWkzyv2ijYhnJZqNlFpb4tc/f3Nhe8Stj7OLh/6GXCFD9TVvBmAcy9tlLCTJ9dzoiAI98wJzB8E1hwbbWYmVU88xz3xoG3l83YPJ/ad9eJPdQvB3ef3wLKh5R8vpJJxT2+SS+uuriv6Gnq9LfrTs177PjKnVd/y1Zuyc0LdC6adewbg13R8eVXTZd2PfDEubujyQ/2n/lhxjHhoDnvgr+iceuK8p27f3rqvYUvfT89+ePnanHKPXrE7nnwOeXPI29u6zvceW9j7+Zj1j0Vr8yvXd73TP2hD69cerl+9uttgD15qqpi04L2R37f1vqFkfz5u3fPZz/beOLKqgP/LD57+XTF/Be4Cx//9Qn+O1nd3ddc3xU79GurwV9N8oufPevuu7jQv2fd0ifj4qLDF9rLTjK08aq//Z3WaT1/HD762qn2rxf7p4M1fTNLkf38p0t7j5c0TRYe9Z3pXWJNRWWTd+5gmh8+uWPXnN0bL7e/NZu+r798/wLnv/g45BEAAA=="
        ]
        // normally, it's a terrible idea to back up ur bearer token to github. This will expire soon though.
        return headers
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
    class func listItem(name: String, description: String, imageURLs: [String]!) {
        let sku = name.replacingOccurrences(of: " ", with: "") + "\(Int.random(in: 10..<9999))"//(name + UUID().uuidString).replacingOccurrences(of: " ", with: "")
        self.createInventoryLocation(sku: sku, productName: name, productDescription: description, price: 10.50, images: imageURLs)
        //        createOffer(sku: sku, productDescription: description, price: 10.50) // this will also call publishOffer
    }
    
    /**
     * Creates an inventory location using eBayAPI
     */
    class func createInventoryLocation(sku: String, productName: String, productDescription: String, price: Double, images: [String]) {
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
                    self.createInventoryItem(sku: sku, productName: productName, productDescription: productDescription, price: price, images: images)
                }
            }
        })
        
        dataTask.resume()
    }
    
    class func createInventoryItem(sku: String, productName: String, productDescription: String, price: Double, images: [String]) {
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
                "imageUrls": images
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
    
    class func createOffer(sku: String, productDescription: String, price: Double) {
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
    
    class func publishOffer(code: String) {
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
