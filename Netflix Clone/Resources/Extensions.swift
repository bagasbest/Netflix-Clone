//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Bagas Pangestu on 21/08/25.
//

extension String {
    func capitalizeFirstLetter() -> String {
        guard let firstCharacter = first else {
            return self
        }
        return String(firstCharacter).uppercased() + dropFirst()
    }
}
