public struct Interface: Equatable, Hashable, CustomStringConvertible {
    public var number: UInt8
    public var setting: UInt8
    public var endpoints: [Endpoint]
    
    public var description: String {
        "Interface(number: \(number), setting: \(setting), endpoints: \(endpoints)"
    }
}
