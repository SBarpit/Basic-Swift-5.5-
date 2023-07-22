import Foundation
import PlaygroundSupport

/*
 Now we'll handle the asyn call without escaping clouser
 We'll use here asyn and await to done asyn function calls.
 */

PlaygroundPage.current.needsIndefiniteExecution = true


func synFunc() -> [Double] {
    (1...10).map { _ in Double.random(in: -10...30) }
}

func fetchWeatherHistory() async -> [Double] {
    print("1")
    return (1...100_000).map { _ in Double.random(in: -10...30) }
}

func calculateAverageTemperature(for records: [Double]) async -> Double {
    let total = records.reduce(0, +)
    let average = total / Double(records.count)
    print("2")
    return average
}

func upload(result: Double) async -> String {
    print("3")
    return "OK"
}

func processWeather() async {
    let records = await fetchWeatherHistory()
    let average = await calculateAverageTemperature(for: records)
    let response = await upload(result: average)
    print("Server response: \(response)")
}

print(synFunc())
await processWeather()
await fetchWeatherHistory()
print(synFunc())
PlaygroundPage.current.finishExecution()
