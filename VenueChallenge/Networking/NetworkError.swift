//
//  NetworkError.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation

/// An error that occurs  during a network operation.
enum NetworkError: Error {
    case noInternet
    case unavailable
    case decodingFailure
    case other(message: String)
}
