import Foundation

@main
struct Generator {
    static func main() throws {
        let directory = CommandLine.arguments[1]
        try? FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)
        try """
        public struct Product {
            public static let string = "product"
        }
        """.write(toFile: directory + "/Product.swift", atomically: false, encoding: .utf8)
    }
}
