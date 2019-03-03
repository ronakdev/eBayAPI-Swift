//
//  EbayAPI.swift
//  eBayLister
//
//  Created by Ronak Shah on 3/2/19.
//  Copyright © 2019 Ronak Shah. All rights reserved.
//

import Foundation
import Alamofire

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
}
