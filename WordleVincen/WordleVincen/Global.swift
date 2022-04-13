//
//  Global.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/10.
//

import UIKit
enum Global {
    static var screenWidth: CGFloat{
        UIScreen.main.bounds.size.width
    }
    static var screenHeight: CGFloat{
        UIScreen.main.bounds.size.height
    }
    static var minDimension: CGFloat{
        min(screenWidth,screenHeight)
    }
    static var boardwidth: CGFloat{
        switch minDimension{
        case 0...320:
            return screenWidth - 55
        case 321...430:
            return screenWidth - 50
        case 431...1000:
            return 350
        default:
            return 500
        }
    }
    static var keyboardScale : CGFloat{
        switch minDimension{
        case 0...430:
            return screenWidth/390
        case 431...1000:
            return CGFloat(1.2)
        default:
            return CGFloat(1.6)
            
        }
    }
    
    static let commonWords = ["ACKEE", // di tambahin si katanya
                              "APPLE",
                              "ARECA",
                              "BETEL",
                              "CHARD",
                              "CHIVE",
                              "CHOKO",
                              "CRESS",
                              "CUBEB",
                              "DRUPE",
                              "EATER",
                              "ENOKI",
                              "GALIA",
                              "GOURD",
                              "GRAPE",
                              "GUAVA",
                              "JAFFA",
                              "LAVER",
                              "LEMON",
                              "MANGO",
                              "MELON",
                              "MOOLI",
                              "MOREL",
                              "OLIVE",
                              "ONION",
                              "PAPAW",
                              "PEACH",
                              "PECAN",
                              "PRUNE",
                              "PULSE",
                              "SAVOY",
                              "SWEDE"
]
    static let commonWords2 = ["BABOON", "BADGER", "BEAGLE", "BEAVER", "BEETLE", "BIRMAN", "BOMBAY", "BONOBO", "CAIMAN", "COLLIE", "COUGAR", "COYOTE", "CUSCUS", "DISCUS", "DONKEY", "DRIVER", "DUGONG", "DUNKER", "EARWIG", "FALCON", "FERRET", "GERBIL", "GIBBON", "GOPHER", "GROUSE", "IGUANA", "IMPALA", "INSECT", "JACKAL", "JAGUAR", "KAKAPO", "LIZARD", "MAGPIE", "MAYFLY", "MONKEY", "NUMBAT", "OCELOT", "OYSTER", "PARROT", "POODLE", "POSSUM", "PUFFIN", "QUOKKA", "RABBIT", "SERVAL", "SHRIMP", "SOMALI", "SPONGE", "TOUCAN", "TURKEY", "UAKARI", "UGUISU", "WALRUS", "WEASEL", "WOMBAT", "WRASSE", "ZONKEY"]
    static let commonWords3 = ["Aurochs", "Banteng", "Banting", "Bettong", "Bighorn", "Caracal", "Caribou", "Cattalo", "Chamois", "Cheetah", "Colobus", "Epizoon", "Finback", "Gazelle", "Gelding", "Gemsbok", "Genette", "Giraffe", "Glutton", "Gorilla", "Grampus", "Grizzly", "Grysbok", "Guanaco", "Hamster", "Hanuman", "Klipdas", "Lambkin", "Lemming", "Leopard", "Leveret", "Linsang", "Lioness", "Macaque", "Madoqua", "Mammoth", "Manatee", "Manx cat", "Markhor", "Meerkat", "Minever", "Miniver", "Moonrat", "Mouflon", "Muntjak", "Muskrat", "Mustela", "Mylodon", "Nandine", "Narwhal", "Ondatra", "Opossum", "Packrat", "Painter", "Panther", "Peccary", "Polecat", "Pricket", "Primate", "Raccoon", "Roebuck", "Roofrat", "Rorqual", "Sagouin", "Saimiri", "Sapajou", "Siamang", "Sjambok", "Sondeli", "Sounder", "Spitter", "Stembok", "Sumpter", "Tamarau", "Tamarin", "Tarsier", "Tigress", "Unicorn", "Vampire", "Wallaby", "Warthog"]
}
