// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



#if MockyCustom
import SwiftyMocky
import CoreLocation
import MaultaschenDomain
@testable import MaultaschenData

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
import CoreLocation
import MaultaschenDomain
@testable import MaultaschenData

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

// MARK: - LocalDatabaseProtocol
open class LocalDatabaseProtocolMock: LocalDatabaseProtocol, Mock {
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





    open func bootstrap() {
        addInvocation(.m_bootstrap)
		let perform = methodPerformValue(.m_bootstrap) as? () -> Void
		perform?()
    }

    open func findAllMeals() -> [Meal] {
        addInvocation(.m_findAllMeals)
		let perform = methodPerformValue(.m_findAllMeals) as? () -> Void
		perform?()
		var __value: [Meal]
		do {
		    __value = try methodReturnValue(.m_findAllMeals).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAllMeals(). Use given")
			Failure("Stub return value not specified for findAllMeals(). Use given")
		}
		return __value
    }

    open func save(meal: Meal) {
        addInvocation(.m_save__meal_meal(Parameter<Meal>.value(`meal`)))
		let perform = methodPerformValue(.m_save__meal_meal(Parameter<Meal>.value(`meal`))) as? (Meal) -> Void
		perform?(`meal`)
    }

    open func findAllVenues(near position: CLLocationCoordinate2D, maxDistance: CLLocationDistance) -> [Venue] {
        addInvocation(.m_findAllVenues__near_positionmaxDistance_maxDistance(Parameter<CLLocationCoordinate2D>.value(`position`), Parameter<CLLocationDistance>.value(`maxDistance`)))
		let perform = methodPerformValue(.m_findAllVenues__near_positionmaxDistance_maxDistance(Parameter<CLLocationCoordinate2D>.value(`position`), Parameter<CLLocationDistance>.value(`maxDistance`))) as? (CLLocationCoordinate2D, CLLocationDistance) -> Void
		perform?(`position`, `maxDistance`)
		var __value: [Venue]
		do {
		    __value = try methodReturnValue(.m_findAllVenues__near_positionmaxDistance_maxDistance(Parameter<CLLocationCoordinate2D>.value(`position`), Parameter<CLLocationDistance>.value(`maxDistance`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findAllVenues(near position: CLLocationCoordinate2D, maxDistance: CLLocationDistance). Use given")
			Failure("Stub return value not specified for findAllVenues(near position: CLLocationCoordinate2D, maxDistance: CLLocationDistance). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_bootstrap
        case m_findAllMeals
        case m_save__meal_meal(Parameter<Meal>)
        case m_findAllVenues__near_positionmaxDistance_maxDistance(Parameter<CLLocationCoordinate2D>, Parameter<CLLocationDistance>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_bootstrap, .m_bootstrap):
                return true 
            case (.m_findAllMeals, .m_findAllMeals):
                return true 
            case (.m_save__meal_meal(let lhsMeal), .m_save__meal_meal(let rhsMeal)):
                guard Parameter.compare(lhs: lhsMeal, rhs: rhsMeal, with: matcher) else { return false } 
                return true 
            case (.m_findAllVenues__near_positionmaxDistance_maxDistance(let lhsPosition, let lhsMaxdistance), .m_findAllVenues__near_positionmaxDistance_maxDistance(let rhsPosition, let rhsMaxdistance)):
                guard Parameter.compare(lhs: lhsPosition, rhs: rhsPosition, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsMaxdistance, rhs: rhsMaxdistance, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_bootstrap: return 0
            case .m_findAllMeals: return 0
            case let .m_save__meal_meal(p0): return p0.intValue
            case let .m_findAllVenues__near_positionmaxDistance_maxDistance(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        public static func findAllMeals(willReturn: [Meal]...) -> MethodStub {
            return Given(method: .m_findAllMeals, products: willReturn.map({ Product.return($0) }))
        }
        public static func findAllVenues(near position: Parameter<CLLocationCoordinate2D>, maxDistance: Parameter<CLLocationDistance>, willReturn: [Venue]...) -> MethodStub {
            return Given(method: .m_findAllVenues__near_positionmaxDistance_maxDistance(`position`, `maxDistance`), products: willReturn.map({ Product.return($0) }))
        }
        public static func findAllMeals(willProduce: (Stubber<[Meal]>) -> Void) -> MethodStub {
            let willReturn: [[Meal]] = []
			let given: Given = { return Given(method: .m_findAllMeals, products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: ([Meal]).self)
			willProduce(stubber)
			return given
        }
        public static func findAllVenues(near position: Parameter<CLLocationCoordinate2D>, maxDistance: Parameter<CLLocationDistance>, willProduce: (Stubber<[Venue]>) -> Void) -> MethodStub {
            let willReturn: [[Venue]] = []
			let given: Given = { return Given(method: .m_findAllVenues__near_positionmaxDistance_maxDistance(`position`, `maxDistance`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: ([Venue]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func bootstrap() -> Verify { return Verify(method: .m_bootstrap)}
        public static func findAllMeals() -> Verify { return Verify(method: .m_findAllMeals)}
        public static func save(meal: Parameter<Meal>) -> Verify { return Verify(method: .m_save__meal_meal(`meal`))}
        public static func findAllVenues(near position: Parameter<CLLocationCoordinate2D>, maxDistance: Parameter<CLLocationDistance>) -> Verify { return Verify(method: .m_findAllVenues__near_positionmaxDistance_maxDistance(`position`, `maxDistance`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func bootstrap(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_bootstrap, performs: perform)
        }
        public static func findAllMeals(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findAllMeals, performs: perform)
        }
        public static func save(meal: Parameter<Meal>, perform: @escaping (Meal) -> Void) -> Perform {
            return Perform(method: .m_save__meal_meal(`meal`), performs: perform)
        }
        public static func findAllVenues(near position: Parameter<CLLocationCoordinate2D>, maxDistance: Parameter<CLLocationDistance>, perform: @escaping (CLLocationCoordinate2D, CLLocationDistance) -> Void) -> Perform {
            return Perform(method: .m_findAllVenues__near_positionmaxDistance_maxDistance(`position`, `maxDistance`), performs: perform)
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

// MARK: - MealEntityMapperProtocol
open class MealEntityMapperProtocolMock: MealEntityMapperProtocol, Mock {
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





    open func map(entity: MealEntity) -> Meal {
        addInvocation(.m_map__entity_entity(Parameter<MealEntity>.value(`entity`)))
		let perform = methodPerformValue(.m_map__entity_entity(Parameter<MealEntity>.value(`entity`))) as? (MealEntity) -> Void
		perform?(`entity`)
		var __value: Meal
		do {
		    __value = try methodReturnValue(.m_map__entity_entity(Parameter<MealEntity>.value(`entity`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for map(entity: MealEntity). Use given")
			Failure("Stub return value not specified for map(entity: MealEntity). Use given")
		}
		return __value
    }

    open func map(meal: Meal) -> MealEntity {
        addInvocation(.m_map__meal_meal(Parameter<Meal>.value(`meal`)))
		let perform = methodPerformValue(.m_map__meal_meal(Parameter<Meal>.value(`meal`))) as? (Meal) -> Void
		perform?(`meal`)
		var __value: MealEntity
		do {
		    __value = try methodReturnValue(.m_map__meal_meal(Parameter<Meal>.value(`meal`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for map(meal: Meal). Use given")
			Failure("Stub return value not specified for map(meal: Meal). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_map__entity_entity(Parameter<MealEntity>)
        case m_map__meal_meal(Parameter<Meal>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_map__entity_entity(let lhsEntity), .m_map__entity_entity(let rhsEntity)):
                guard Parameter.compare(lhs: lhsEntity, rhs: rhsEntity, with: matcher) else { return false } 
                return true 
            case (.m_map__meal_meal(let lhsMeal), .m_map__meal_meal(let rhsMeal)):
                guard Parameter.compare(lhs: lhsMeal, rhs: rhsMeal, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_map__entity_entity(p0): return p0.intValue
            case let .m_map__meal_meal(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        public static func map(entity: Parameter<MealEntity>, willReturn: Meal...) -> MethodStub {
            return Given(method: .m_map__entity_entity(`entity`), products: willReturn.map({ Product.return($0) }))
        }
        public static func map(meal: Parameter<Meal>, willReturn: MealEntity...) -> MethodStub {
            return Given(method: .m_map__meal_meal(`meal`), products: willReturn.map({ Product.return($0) }))
        }
        public static func map(entity: Parameter<MealEntity>, willProduce: (Stubber<Meal>) -> Void) -> MethodStub {
            let willReturn: [Meal] = []
			let given: Given = { return Given(method: .m_map__entity_entity(`entity`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (Meal).self)
			willProduce(stubber)
			return given
        }
        public static func map(meal: Parameter<Meal>, willProduce: (Stubber<MealEntity>) -> Void) -> MethodStub {
            let willReturn: [MealEntity] = []
			let given: Given = { return Given(method: .m_map__meal_meal(`meal`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (MealEntity).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func map(entity: Parameter<MealEntity>) -> Verify { return Verify(method: .m_map__entity_entity(`entity`))}
        public static func map(meal: Parameter<Meal>) -> Verify { return Verify(method: .m_map__meal_meal(`meal`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func map(entity: Parameter<MealEntity>, perform: @escaping (MealEntity) -> Void) -> Perform {
            return Perform(method: .m_map__entity_entity(`entity`), performs: perform)
        }
        public static func map(meal: Parameter<Meal>, perform: @escaping (Meal) -> Void) -> Perform {
            return Perform(method: .m_map__meal_meal(`meal`), performs: perform)
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





    open func findMeals() -> [(meal: Meal, image: UIImage)] {
        addInvocation(.m_findMeals)
		let perform = methodPerformValue(.m_findMeals) as? () -> Void
		perform?()
		var __value: [(meal: Meal, image: UIImage)]
		do {
		    __value = try methodReturnValue(.m_findMeals).casted()
		} catch {
			onFatalFailure("Stub return value not specified for findMeals(). Use given")
			Failure("Stub return value not specified for findMeals(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_findMeals

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_findMeals, .m_findMeals):
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_findMeals: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        public static func findMeals(willReturn: [(meal: Meal, image: UIImage)]...) -> MethodStub {
            return Given(method: .m_findMeals, products: willReturn.map({ Product.return($0) }))
        }
        public static func findMeals(willProduce: (Stubber<[(meal: Meal, image: UIImage)]>) -> Void) -> MethodStub {
            let willReturn: [[(meal: Meal, image: UIImage)]] = []
			let given: Given = { return Given(method: .m_findMeals, products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: ([(meal: Meal, image: UIImage)]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func findMeals() -> Verify { return Verify(method: .m_findMeals)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func findMeals(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_findMeals, performs: perform)
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

// MARK: - VenueEntityMapperProtocol
open class VenueEntityMapperProtocolMock: VenueEntityMapperProtocol, Mock {
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





    open func map(entity: VenueEntity) -> Venue {
        addInvocation(.m_map__entity_entity(Parameter<VenueEntity>.value(`entity`)))
		let perform = methodPerformValue(.m_map__entity_entity(Parameter<VenueEntity>.value(`entity`))) as? (VenueEntity) -> Void
		perform?(`entity`)
		var __value: Venue
		do {
		    __value = try methodReturnValue(.m_map__entity_entity(Parameter<VenueEntity>.value(`entity`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for map(entity: VenueEntity). Use given")
			Failure("Stub return value not specified for map(entity: VenueEntity). Use given")
		}
		return __value
    }

    open func map(venue: Venue) -> VenueEntity {
        addInvocation(.m_map__venue_venue(Parameter<Venue>.value(`venue`)))
		let perform = methodPerformValue(.m_map__venue_venue(Parameter<Venue>.value(`venue`))) as? (Venue) -> Void
		perform?(`venue`)
		var __value: VenueEntity
		do {
		    __value = try methodReturnValue(.m_map__venue_venue(Parameter<Venue>.value(`venue`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for map(venue: Venue). Use given")
			Failure("Stub return value not specified for map(venue: Venue). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_map__entity_entity(Parameter<VenueEntity>)
        case m_map__venue_venue(Parameter<Venue>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_map__entity_entity(let lhsEntity), .m_map__entity_entity(let rhsEntity)):
                guard Parameter.compare(lhs: lhsEntity, rhs: rhsEntity, with: matcher) else { return false } 
                return true 
            case (.m_map__venue_venue(let lhsVenue), .m_map__venue_venue(let rhsVenue)):
                guard Parameter.compare(lhs: lhsVenue, rhs: rhsVenue, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_map__entity_entity(p0): return p0.intValue
            case let .m_map__venue_venue(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        public static func map(entity: Parameter<VenueEntity>, willReturn: Venue...) -> MethodStub {
            return Given(method: .m_map__entity_entity(`entity`), products: willReturn.map({ Product.return($0) }))
        }
        public static func map(venue: Parameter<Venue>, willReturn: VenueEntity...) -> MethodStub {
            return Given(method: .m_map__venue_venue(`venue`), products: willReturn.map({ Product.return($0) }))
        }
        public static func map(entity: Parameter<VenueEntity>, willProduce: (Stubber<Venue>) -> Void) -> MethodStub {
            let willReturn: [Venue] = []
			let given: Given = { return Given(method: .m_map__entity_entity(`entity`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (Venue).self)
			willProduce(stubber)
			return given
        }
        public static func map(venue: Parameter<Venue>, willProduce: (Stubber<VenueEntity>) -> Void) -> MethodStub {
            let willReturn: [VenueEntity] = []
			let given: Given = { return Given(method: .m_map__venue_venue(`venue`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (VenueEntity).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func map(entity: Parameter<VenueEntity>) -> Verify { return Verify(method: .m_map__entity_entity(`entity`))}
        public static func map(venue: Parameter<Venue>) -> Verify { return Verify(method: .m_map__venue_venue(`venue`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func map(entity: Parameter<VenueEntity>, perform: @escaping (VenueEntity) -> Void) -> Perform {
            return Perform(method: .m_map__entity_entity(`entity`), performs: perform)
        }
        public static func map(venue: Parameter<Venue>, perform: @escaping (Venue) -> Void) -> Perform {
            return Perform(method: .m_map__venue_venue(`venue`), performs: perform)
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

