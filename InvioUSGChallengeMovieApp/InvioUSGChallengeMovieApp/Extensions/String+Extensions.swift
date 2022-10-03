//
//  String+Extensions.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
           return self.prefix(1).uppercased() + self.lowercased().dropFirst()
       }
}
