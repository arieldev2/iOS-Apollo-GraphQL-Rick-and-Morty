// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RickAndMortyAPI

public class Character: MockObject {
  public static let objectType: ApolloAPI.Object = RickAndMortyAPI.Objects.Character
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Character>>

  public struct MockFields {
    @Field<RickAndMortyAPI.ID>("id") public var id
    @Field<String>("image") public var image
    @Field<String>("name") public var name
    @Field<Location>("origin") public var origin
  }
}

public extension Mock where O == Character {
  convenience init(
    id: RickAndMortyAPI.ID? = nil,
    image: String? = nil,
    name: String? = nil,
    origin: Mock<Location>? = nil
  ) {
    self.init()
    _setScalar(id, for: \.id)
    _setScalar(image, for: \.image)
    _setScalar(name, for: \.name)
    _setEntity(origin, for: \.origin)
  }
}
