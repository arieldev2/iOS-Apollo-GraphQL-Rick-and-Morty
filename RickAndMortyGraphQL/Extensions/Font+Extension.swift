//
//  Font+Extension.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/15/23.
//

import SwiftUI

enum FontTypes: String{
    case RobotoMonoBold = "RobotoMono-Bold"
    case robotoMonoRegular = "RobotoMono-Regular"
}

extension Font{
    static let titleNavigation = Font.custom(FontTypes.RobotoMonoBold.rawValue, size: 30)
    static let titleFont = Font.custom(FontTypes.RobotoMonoBold.rawValue, size: 25)
    static let subtitleFont = Font.custom(FontTypes.robotoMonoRegular.rawValue, size: 18)
}
