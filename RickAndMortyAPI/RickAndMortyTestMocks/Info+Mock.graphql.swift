// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RickAndMortyAPI

public class Info: MockObject {
  public static let objectType: ApolloAPI.Object = RickAndMortyAPI.Objects.Info
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Info>>

  public struct MockFields {
    @Field<Int>("next") public var next
    @Field<Int>("prev") public var prev
  }
}

public extension Mock where O == Info {
  convenience init(
    next: Int? = nil,
    prev: Int? = nil
  ) {
    self.init()
    _setScalar(next, for: \.next)
    _setScalar(prev, for: \.prev)
  }
}
