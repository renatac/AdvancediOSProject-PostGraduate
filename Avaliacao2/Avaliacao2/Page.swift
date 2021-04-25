//
//  Page.swift
//  Avaliacao2
//
//  Created by RENATA on 15/04/21.
//

import Foundation

enum Page: Int, CaseIterable {
    case pageOne
    case pageTwo
    case pageThree

    var index: Int {
        return rawValue
    }
        
    var subtitle: String {
        switch self {
        case .pageOne:
            return "No App você irá escolher os segundos."
        case .pageTwo:
            return "Para começar a contagem regressiva clique em Começar."
        case .pageThree:
            return "A contagem pode ser cancelada ao clicar em Cancelar."
        }
    }
}
