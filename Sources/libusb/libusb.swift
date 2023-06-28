import clibusb

private func wrap(handle: OpaquePointer?, closure: (OpaquePointer) -> Int32) throws {
    guard let handle = handle else {
        print("no handle")
        throw Error.other
    }
    try execute {
        closure(handle)
    }
}

private func execute(task: () -> Int32) throws {
    let result = task()
    guard result == 0 else {
        guard let error = Error(rawValue: result) else { return }
        throw error
    }
}

public func open(device: OpaquePointer, handle: inout OpaquePointer?) throws {
    guard handle == nil else { throw Error.other }
    try execute {
        libusb_open(device, &handle)
    }
}
public func close(handle: inout OpaquePointer?) throws {
    guard handle != nil else { throw Error.other }
    libusb_close(handle)
    handle = nil
}

public func get(handle: OpaquePointer?, configuration: inout Int32) throws {
    try execute {
        libusb_get_configuration(handle, &configuration)
    }
}
public func set(handle: OpaquePointer?, configuration: Int32) throws {
    try wrap(handle: handle) { handle in
        libusb_set_configuration(handle, configuration)
    }
}

public func detach(handle: OpaquePointer?, auto: Int32) throws {
    try wrap(handle: handle) { handle in
        libusb_set_auto_detach_kernel_driver(handle, auto)
    }
}
public func detach(handle: OpaquePointer?, interface: Int32) throws {
    try wrap(handle: handle) { handle in
        libusb_detach_kernel_driver(handle, interface)
    }
}
public func attach(handle: OpaquePointer?, interface: Int32) throws {
    try wrap(handle: handle) { handle in
        libusb_attach_kernel_driver(handle, interface)
    }
}
public func kernel(handle: OpaquePointer?, interface: Int32) throws -> Bool {
    guard handle != nil else { throw Error.other }
    return libusb_kernel_driver_active(handle, interface) == 1
}
public func setting(handle: OpaquePointer?, interface: Int32, setting: Int32) throws {
    try wrap(handle: handle) { handle in
        libusb_set_interface_alt_setting(handle, interface, setting)
    }
}

public func claim(handle: OpaquePointer?, interface: Int32) throws {
    try wrap(handle: handle) { handle in
        libusb_claim_interface(handle, interface)
    }
}

public func release(handle: OpaquePointer?, interface: Int32) throws {
    try wrap(handle: handle) { handle in
        libusb_release_interface(handle, interface)
    }
}

public func port(device: OpaquePointer) throws -> [UInt8] {
    let depth: Int32 = 7
    var numbers: [UInt8] = [UInt8](repeating: 0, count: Int(depth))
    try execute {
        libusb_get_port_numbers(device, &numbers, depth)
    }
    return numbers
}

public func address(device: OpaquePointer) -> UInt8 {
    libusb_get_device_address(device)
}
/*
public func speed(device: OpaquePointer) -> Speed? {
    let speed = libusb_get_device_speed(device)
    return Speed(rawValue: UInt8(speed))
}
*/

public func reset(device: OpaquePointer) throws {
    try execute {
        libusb_reset_device(device)
    }
}

public func string(device: OpaquePointer, index: UInt8) throws -> [UInt8] {
    var array = [UInt8](repeating: 0, count: 256)
    try execute {
        libusb_get_string_descriptor(device, index, 0, &array, 256)
    }
    return array
}

public func maxPacketSize(device: OpaquePointer, endpoint: UInt8) throws -> Int32 {
    let result = libusb_get_max_packet_size(device, endpoint)
    try execute {
        result
    }
    return result
}

public func maxIsoPacketSize(device: OpaquePointer, endpoint: UInt8) throws -> Int32 {
    let result = libusb_get_max_iso_packet_size(device, endpoint)
    try execute {
        result
    }
    return result
}
