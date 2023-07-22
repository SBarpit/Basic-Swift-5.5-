import Foundation
// import the module
import PlaygroundSupport
// write this at the beginning to inform xcode, that playground page needs to execute indefinitely.
PlaygroundPage.current.needsIndefiniteExecution = true

func fetchWeatherHistory(completion: @escaping ([Double]) -> Void) {
    // Complex networking code here; we'll just send back 100,000 random temperatures
    DispatchQueue.global().async {
        let results = (1...100_000).map { _ in Double.random(in: -10...30) }
        completion(results)
    }
}

func calculateAverageTemperature(for records: [Double], completion: @escaping (Double) -> Void) {
    // Sum our array then divide by the array size
    DispatchQueue.global().async {
        let total = records.reduce(0, +)
        let average = total / Double(records.count)
        completion(average)
    }
}

func upload(result: Double, completion: @escaping (String) -> Void) {
    // More complex networking code; we'll just send back "OK"
    DispatchQueue.global().async {
        completion("OK")
    }
}


fetchWeatherHistory { records in
    calculateAverageTemperature(for: records) { average in
        upload(result: average) { response in
            print("Server response: \(response)")
            // Instructs Xcode that the playground page has finished execution.
            PlaygroundPage.current.finishExecution()
        }
    }
}


