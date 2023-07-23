import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
// Refrence: https://www.hackingwithswift.com/quick-start/concurrency/what-is-an-actor-and-why-does-swift-have-them
actor User {
    
    let constant = "I'm Immortal"
    var score: Int
    
    init(val: Int) {
        score = val
    }
    
    func updateScore(to value: Int) {
        score = value
    }

    func printScore() {
        print("My score is \(score)")
    }

    func copyScore(from other: User) async {
        score = await other.score
    }
}

let actor1 = User(val: 12)
let actor2 = User(val: 20)

await print(actor1.score)
await actor1.copyScore(from: actor2)
await print(actor1.score)
await actor1.updateScore(to: 45)
await print(actor1.score)

print(actor1.constant)

PlaygroundPage.current.finishExecution()
