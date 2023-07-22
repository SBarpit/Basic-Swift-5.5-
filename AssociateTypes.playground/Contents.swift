/*
 What is a protocol associated type?
 Associated types are a powerful way of making protocols generic, but they can be a bit confusing at first. In essence, they mark holes in protocols that must be filled by whatever types conform to those protocols.
*/

import Foundation


/*
 Let’s start with a simple example: an ItemStoring protocol that can store items in an array. What type those items are depends on whatever conforms to the protocol, but we can still use them inside the protocol and any extensions.

 Here’s the basic protocol:
 */

protocol ItemStoring {
    associatedtype DataType

    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

extension ItemStoring {
    mutating func add(item: DataType){
        items.append(item)
    }
}

struct NameDatabase: ItemStoring {
    
    var items = [String]()
}

var namesDatabase = NameDatabase()
namesDatabase.add(item: "Arpit")
namesDatabase.add(item: "Srivastava")

print(namesDatabase.items)

struct IDDataBase: ItemStoring {
    
    var items = [Int]()
}

var idDatabase = IDDataBase()
idDatabase.add(item: 25)
idDatabase.add(item: 36)

print(idDatabase.items)

class ExampleClass: ItemStoring {

 var items = [Double]()
    
}

var exampleClass = ExampleClass()
exampleClass.add(item: 0.0)
exampleClass.add(item: 3.4)

print(exampleClass.items)
