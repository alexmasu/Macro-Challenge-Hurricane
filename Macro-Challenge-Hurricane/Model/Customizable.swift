//
//  Customizable.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 31/05/22.
//

import Foundation
import CloudKit

class customizable {
    
    var id: Int
    var type: String
    
    var name: String
    var descr: String
    
    var priceBite: Int
    var price: Int
    
    var requirement: Int
    
    
    
    init (Id: Int, Type: String, Name :String,Descr : String, PriceBite: Int, Price: Int, Requirement : Int ){
        
        id = Id
        type = Type
        name = Name
        descr = Descr
        priceBite = PriceBite
        price = Price
        requirement = Requirement
    }
    
}
let ventilatoreZephir = customizable(Id : 0, Type: "ventilatore", Name: "Ventilatore malfunzionante", Descr: "It doesn't seem to work well", PriceBite: 0, Price : 100, Requirement: 0)
let standardMonitor = customizable(Id: 1, Type: "monitor", Name: "monitor semplice", Descr: "non si vede molto bene ma fa il suo lavoro", PriceBite: 0, Price: 0, Requirement: 0)
let standardTappeto = customizable(Id: 2, Type: "tappeto", Name: "tappeto generico", Descr: "Abbastanza anonimo", PriceBite: 0, Price: 0, Requirement: 0)
let standardSedia = customizable(Id: 3, Type: "sedia", Name: "sedia scomoda", Descr: "can't stay on it for too long", PriceBite: 0, Price: 0, Requirement: 0)
let standardLampadaStreaming = customizable(Id: 4, Type: "lampadaStreaming", Name: "Lampada da Streaming", Descr: "non il massimo per lo streaming ma fa il suo lavoro", PriceBite: 0, Price: 0, Requirement: 0)
let lampadaDaLetto = customizable(Id: 5, Type: "lampadaLetto", Name: "Lampada da letto", Descr: "Una semplice luce per la notte", PriceBite: 0, Price: 0, Requirement: 0)
let LettoStandard = customizable(Id: 6, Type: "letto", Name: "letto Vecchio", Descr: "perfetto per svegliarsi stanchi", PriceBite: 0, Price: 0, Requirement: 0)
let accessoriStandard = customizable(Id: 7, Type: "accessoriStreaming", Name: "piantina e oggetti a caso", Descr: "erano lì prima che nascessi, non mi piacciono molto", PriceBite: 0, Price: 0, Requirement: 0)
let vascaStandard = customizable(Id: 8, Type: "vasca", Name: "Vasca vecchia", Descr: "mia nonna ne aveva una uguale", PriceBite: 0, Price: 0, Requirement: 0)
let tendaStandard = customizable(Id: 9, Type: "tenda", Name: "Tenda mediocre", Descr: "schizza fuori un sacco d'acqua", PriceBite: 0, Price: 0, Requirement: 0)
let saponiStandard = customizable(Id: 10, Type: "accessoriDaBagno", Name: "bagnoschiuma sottomarca", Descr: "non puoi rischiare di perdere i capelli se non li hai", PriceBite: 0, Price: 0, Requirement: 0)


let customizableV = [ventilatoreZephir,standardMonitor,standardTappeto,standardSedia,standardLampadaStreaming,lampadaDaLetto,LettoStandard,accessoriStandard,vascaStandard,tendaStandard,saponiStandard]


let mochicraft = customizable(Id: 0, Type: "Content", Name: "Mochicraft", Descr: "qualsiasi pc può runnarlo", PriceBite: 0, Price: 0, Requirement: 0)
let streamingV = [mochicraft]
