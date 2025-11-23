public extension Array {
    func mapReduce<R, T>(into initialResult: R, _ transform: (inout R, Element) throws -> T) rethrows -> [T] {
        var result = initialResult
        return try self.map { try transform(&result, $0) }
    }
}
