public struct Interface: Equatable, Hashable, CustomStringConvertible {
    public var number: UInt8
    public var setting: UInt8
    public var endpoints: [Endpoint]
    
    public init(number: UInt8, setting: UInt8, endpoints: [Endpoint]) {
        self.number = number
        self.setting = setting
        self.endpoints = endpoints
    }
    
    public var description: String {
        "Interface(number: \(number), setting: \(setting), endpoints: \(endpoints)"
    }
}
