
@resultBuilder
public struct StringBuilder {
    public static func buildBlock(_ components: StringBuilderItem...) -> String {
        return components.map({$0.formattableRepresentation}).reduce("", +)
    }
}

public protocol StringBuilderItem {
    var formattableRepresentation: String { get }
}

extension String: StringBuilderItem {
    public var formattableRepresentation: String { return self }
}

public struct Format: StringBuilderItem {
    public var formattableRepresentation: String {
        return String(describing: self.value)
    }
    private var value: Any?
    init(_ value: Any?) {
        self.value = value
    }
}

public extension String {
    init(@StringBuilder _ builder: () -> String) {
        self.init(builder())
    }
}
