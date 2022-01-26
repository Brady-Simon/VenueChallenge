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

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternet: return "No internet available."
        case .unavailable: return "Data is unavailable."
        case .decodingFailure: return "Data could not be processed."
        case .other(let message): return message
        }
    }
}
