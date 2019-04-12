// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



#if MockyCustom
import SwiftyMocky
@testable import MaultaschenDomain

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
@testable import MaultaschenDomain

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif


// MARK: - ImageServiceProtocol
open class ImageServiceProtocolMock: ImageServiceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func getImage(for meal: Meal) -> UIImage {
        addInvocation(.m_getImage__for_meal(Parameter<Meal>.value(`meal`)))
		let perform = methodPerformValue(.m_getImage__for_meal(Parameter<Meal>.value(`meal`))) as? (Meal) -> Void
		perform?(`meal`)
		var __value: UIImage
		do {
		    __value = try methodReturnValue(.m_getImage__for_meal(Parameter<Meal>.value(`meal`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getImage(for meal: Meal). Use given")
			Failure("Stub return value not specified for getImage(for meal: Meal). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getImage__for_meal(Parameter<Meal>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getImage__for_meal(let lhsMeal), .m_getImage__for_meal(let rhsMeal)):
                guard Parameter.compare(lhs: lhsMeal, rhs: rhsMeal, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getImage__for_meal(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        public static func getImage(for meal: Parameter<Meal>, willReturn: UIImage...) -> MethodStub {
            return Given(method: .m_getImage__for_meal(`meal`), products: willReturn.map({ Product.return($0) }))
        }
        public static func getImage(for meal: Parameter<Meal>, willProduce: (Stubber<UIImage>) -> Void) -> MethodStub {
            let willReturn: [UIImage] = []
			let given: Given = { return Given(method: .m_getImage__for_meal(`meal`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (UIImage).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getImage(for meal: Parameter<Meal>) -> Verify { return Verify(method: .m_getImage__for_meal(`meal`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getImage(for meal: Parameter<Meal>, perform: @escaping (Meal) -> Void) -> Perform {
            return Perform(method: .m_getImage__for_meal(`meal`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MealDetailsInteractorDelegate
open class MealDetailsInteractorDelegateMock: MealDetailsInteractorDelegate, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func didLoad(image: UIImage, forMeal: Meal) {
        addInvocation(.m_didLoad__image_imageforMeal_forMeal(Parameter<UIImage>.value(`image`), Parameter<Meal>.value(`forMeal`)))
		let perform = methodPerformValue(.m_didLoad__image_imageforMeal_forMeal(Parameter<UIImage>.value(`image`), Parameter<Meal>.value(`forMeal`))) as? (UIImage, Meal) -> Void
		perform?(`image`, `forMeal`)
    }


    fileprivate enum MethodType {
        case m_didLoad__image_imageforMeal_forMeal(Parameter<UIImage>, Parameter<Meal>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_didLoad__image_imageforMeal_forMeal(let lhsImage, let lhsFormeal), .m_didLoad__image_imageforMeal_forMeal(let rhsImage, let rhsFormeal)):
                guard Parameter.compare(lhs: lhsImage, rhs: rhsImage, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsFormeal, rhs: rhsFormeal, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_didLoad__image_imageforMeal_forMeal(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func didLoad(image: Parameter<UIImage>, forMeal: Parameter<Meal>) -> Verify { return Verify(method: .m_didLoad__image_imageforMeal_forMeal(`image`, `forMeal`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func didLoad(image: Parameter<UIImage>, forMeal: Parameter<Meal>, perform: @escaping (UIImage, Meal) -> Void) -> Perform {
            return Perform(method: .m_didLoad__image_imageforMeal_forMeal(`image`, `forMeal`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MealDetailsInteractorProtocol
open class MealDetailsInteractorProtocolMock: MealDetailsInteractorProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func loadImage(forMeal: Meal) {
        addInvocation(.m_loadImage__forMeal_forMeal(Parameter<Meal>.value(`forMeal`)))
		let perform = methodPerformValue(.m_loadImage__forMeal_forMeal(Parameter<Meal>.value(`forMeal`))) as? (Meal) -> Void
		perform?(`forMeal`)
    }

    open func save(meal: Meal) {
        addInvocation(.m_save__meal_meal(Parameter<Meal>.value(`meal`)))
		let perform = methodPerformValue(.m_save__meal_meal(Parameter<Meal>.value(`meal`))) as? (Meal) -> Void
		perform?(`meal`)
    }

    open func set(delegate: MealDetailsInteractorDelegate) {
        addInvocation(.m_set__delegate_delegate(Parameter<MealDetailsInteractorDelegate>.value(`delegate`)))
		let perform = methodPerformValue(.m_set__delegate_delegate(Parameter<MealDetailsInteractorDelegate>.value(`delegate`))) as? (MealDetailsInteractorDelegate) -> Void
		perform?(`delegate`)
    }


    fileprivate enum MethodType {
        case m_loadImage__forMeal_forMeal(Parameter<Meal>)
        case m_save__meal_meal(Parameter<Meal>)
        case m_set__delegate_delegate(Parameter<MealDetailsInteractorDelegate>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_loadImage__forMeal_forMeal(let lhsFormeal), .m_loadImage__forMeal_forMeal(let rhsFormeal)):
                guard Parameter.compare(lhs: lhsFormeal, rhs: rhsFormeal, with: matcher) else { return false } 
                return true 
            case (.m_save__meal_meal(let lhsMeal), .m_save__meal_meal(let rhsMeal)):
                guard Parameter.compare(lhs: lhsMeal, rhs: rhsMeal, with: matcher) else { return false } 
                return true 
            case (.m_set__delegate_delegate(let lhsDelegate), .m_set__delegate_delegate(let rhsDelegate)):
                guard Parameter.compare(lhs: lhsDelegate, rhs: rhsDelegate, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_loadImage__forMeal_forMeal(p0): return p0.intValue
            case let .m_save__meal_meal(p0): return p0.intValue
            case let .m_set__delegate_delegate(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func loadImage(forMeal: Parameter<Meal>) -> Verify { return Verify(method: .m_loadImage__forMeal_forMeal(`forMeal`))}
        public static func save(meal: Parameter<Meal>) -> Verify { return Verify(method: .m_save__meal_meal(`meal`))}
        public static func set(delegate: Parameter<MealDetailsInteractorDelegate>) -> Verify { return Verify(method: .m_set__delegate_delegate(`delegate`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func loadImage(forMeal: Parameter<Meal>, perform: @escaping (Meal) -> Void) -> Perform {
            return Perform(method: .m_loadImage__forMeal_forMeal(`forMeal`), performs: perform)
        }
        public static func save(meal: Parameter<Meal>, perform: @escaping (Meal) -> Void) -> Perform {
            return Perform(method: .m_save__meal_meal(`meal`), performs: perform)
        }
        public static func set(delegate: Parameter<MealDetailsInteractorDelegate>, perform: @escaping (MealDetailsInteractorDelegate) -> Void) -> Perform {
            return Perform(method: .m_set__delegate_delegate(`delegate`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - MealServiceProtocol
open class MealServiceProtocolMock: MealServiceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func getAllMeals() -> [Meal] {
        addInvocation(.m_getAllMeals)
		let perform = methodPerformValue(.m_getAllMeals) as? () -> Void
		perform?()
		var __value: [Meal]
		do {
		    __value = try methodReturnValue(.m_getAllMeals).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getAllMeals(). Use given")
			Failure("Stub return value not specified for getAllMeals(). Use given")
		}
		return __value
    }

    open func save(meal: Meal) {
        addInvocation(.m_save__meal_meal(Parameter<Meal>.value(`meal`)))
		let perform = methodPerformValue(.m_save__meal_meal(Parameter<Meal>.value(`meal`))) as? (Meal) -> Void
		perform?(`meal`)
    }


    fileprivate enum MethodType {
        case m_getAllMeals
        case m_save__meal_meal(Parameter<Meal>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getAllMeals, .m_getAllMeals):
                return true 
            case (.m_save__meal_meal(let lhsMeal), .m_save__meal_meal(let rhsMeal)):
                guard Parameter.compare(lhs: lhsMeal, rhs: rhsMeal, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getAllMeals: return 0
            case let .m_save__meal_meal(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        public static func getAllMeals(willReturn: [Meal]...) -> MethodStub {
            return Given(method: .m_getAllMeals, products: willReturn.map({ Product.return($0) }))
        }
        public static func getAllMeals(willProduce: (Stubber<[Meal]>) -> Void) -> MethodStub {
            let willReturn: [[Meal]] = []
			let given: Given = { return Given(method: .m_getAllMeals, products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: ([Meal]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getAllMeals() -> Verify { return Verify(method: .m_getAllMeals)}
        public static func save(meal: Parameter<Meal>) -> Verify { return Verify(method: .m_save__meal_meal(`meal`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getAllMeals(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getAllMeals, performs: perform)
        }
        public static func save(meal: Parameter<Meal>, perform: @escaping (Meal) -> Void) -> Perform {
            return Perform(method: .m_save__meal_meal(`meal`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NearbyMealsInteractorDelegate
open class NearbyMealsInteractorDelegateMock: NearbyMealsInteractorDelegate, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func didFind(_: [(meal: Meal, image: UIImage)]) {
        addInvocation(.m_didFind)
		let perform = methodPerformValue(.m_didFind) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_didFind

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_didFind, .m_didFind):
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_didFind: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func didFind() -> Verify { return Verify(method: .m_didFind)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func didFind(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_didFind, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NearbyMealsInteractorProtocol
open class NearbyMealsInteractorProtocolMock: NearbyMealsInteractorProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func findMeals() {
        addInvocation(.m_findMeals)
		let perform = methodPerformValue(.m_findMeals) as? () -> Void
		perform?()
    }

    open func set(delegate: NearbyMealsInteractorDelegate) {
        addInvocation(.m_set__delegate_delegate(Parameter<NearbyMealsInteractorDelegate>.value(`delegate`)))
		let perform = methodPerformValue(.m_set__delegate_delegate(Parameter<NearbyMealsInteractorDelegate>.value(`delegate`))) as? (NearbyMealsInteractorDelegate) -> Void
		perform?(`delegate`)
    }


    fileprivate enum MethodType {
        case m_findMeals
        case m_set__delegate_delegate(Parameter<NearbyMealsInteractorDelegate>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_findMeals, .m_findMeals):
                return true 
            case (.m_set__delegate_delegate(let lhsDelegate), .m_set__delegate_delegate(let rhsDelegate)):
                guard Parameter.compare(lhs: lhsDelegate, rhs: rhsDelegate, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findMeals: return 0
            case let .m_set__delegate_delegate(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findMeals() -> Verify { return Verify(method: .m_findMeals)}
        public static func set(delegate: Parameter<NearbyMealsInteractorDelegate>) -> Verify { return Verify(method: .m_set__delegate_delegate(`delegate`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findMeals(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findMeals, performs: perform)
        }
        public static func set(delegate: Parameter<NearbyMealsInteractorDelegate>, perform: @escaping (NearbyMealsInteractorDelegate) -> Void) -> Perform {
            return Perform(method: .m_set__delegate_delegate(`delegate`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NearbyVenuesInteractorDelegate
open class NearbyVenuesInteractorDelegateMock: NearbyVenuesInteractorDelegate, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func didFind(venues: [Venue]) {
        addInvocation(.m_didFind__venues_venues(Parameter<[Venue]>.value(`venues`)))
		let perform = methodPerformValue(.m_didFind__venues_venues(Parameter<[Venue]>.value(`venues`))) as? ([Venue]) -> Void
		perform?(`venues`)
    }


    fileprivate enum MethodType {
        case m_didFind__venues_venues(Parameter<[Venue]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_didFind__venues_venues(let lhsVenues), .m_didFind__venues_venues(let rhsVenues)):
                guard Parameter.compare(lhs: lhsVenues, rhs: rhsVenues, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_didFind__venues_venues(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func didFind(venues: Parameter<[Venue]>) -> Verify { return Verify(method: .m_didFind__venues_venues(`venues`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func didFind(venues: Parameter<[Venue]>, perform: @escaping ([Venue]) -> Void) -> Perform {
            return Perform(method: .m_didFind__venues_venues(`venues`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NearbyVenuesInteractorProtocol
open class NearbyVenuesInteractorProtocolMock: NearbyVenuesInteractorProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func findVenues() {
        addInvocation(.m_findVenues)
		let perform = methodPerformValue(.m_findVenues) as? () -> Void
		perform?()
    }

    open func set(delegate: NearbyVenuesInteractorDelegate) {
        addInvocation(.m_set__delegate_delegate(Parameter<NearbyVenuesInteractorDelegate>.value(`delegate`)))
		let perform = methodPerformValue(.m_set__delegate_delegate(Parameter<NearbyVenuesInteractorDelegate>.value(`delegate`))) as? (NearbyVenuesInteractorDelegate) -> Void
		perform?(`delegate`)
    }


    fileprivate enum MethodType {
        case m_findVenues
        case m_set__delegate_delegate(Parameter<NearbyVenuesInteractorDelegate>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_findVenues, .m_findVenues):
                return true 
            case (.m_set__delegate_delegate(let lhsDelegate), .m_set__delegate_delegate(let rhsDelegate)):
                guard Parameter.compare(lhs: lhsDelegate, rhs: rhsDelegate, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findVenues: return 0
            case let .m_set__delegate_delegate(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findVenues() -> Verify { return Verify(method: .m_findVenues)}
        public static func set(delegate: Parameter<NearbyVenuesInteractorDelegate>) -> Verify { return Verify(method: .m_set__delegate_delegate(`delegate`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findVenues(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findVenues, performs: perform)
        }
        public static func set(delegate: Parameter<NearbyVenuesInteractorDelegate>, perform: @escaping (NearbyVenuesInteractorDelegate) -> Void) -> Perform {
            return Perform(method: .m_set__delegate_delegate(`delegate`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

