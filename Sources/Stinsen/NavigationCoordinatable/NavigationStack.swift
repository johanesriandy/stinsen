import Foundation
import Combine
import SwiftUI

public struct NavigationRootItem {
    let keyPath: Int
    let input: Any?
    public let child: ViewPresentable
}

/// Wrapper around childCoordinators
/// Used so that you don't need to write @Published
public class NavigationRoot: ObservableObject {
    @Published public var item: NavigationRootItem
    
    init(item: NavigationRootItem) {
        self.item = item
    }
}

/// Represents a stack of routes
public class NavigationStack<T: NavigationCoordinatable> {
    public var dismissalAction: [Int: () -> Void] = [:]
    
    weak var parent: ChildDismissable?
    public var poppedTo = PassthroughSubject<Int, Never>()
    let initial: PartialKeyPath<T>
    let initialInput: Any?
    public var root: NavigationRoot!
    
    @Published public var value: [NavigationStackItem]
    
    public init(initial: PartialKeyPath<T>, _ initialInput: Any? = nil) {
        self.value = []
        self.initial = initial
        self.initialInput = initialInput
        self.root = nil
    }
}

public struct NavigationStackItem {
    public let presentationType: PresentationType
    public let presentable: ViewPresentable
    let keyPath: Int
    let input: Any?
}
