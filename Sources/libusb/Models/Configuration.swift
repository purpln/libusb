public struct Configuration: Equatable, Hashable, CustomStringConvertible {
    public var interfaces: [Interface]
    
    public var description: String {
        "Configuration(interfaces: [\n\("\t" + interfaces.map(\.description).joined(separator: "\n\t"))\n]"
    }
}
