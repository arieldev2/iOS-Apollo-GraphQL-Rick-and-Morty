// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import RickAndMortyAPI

public class Query: MockObject {
  public static let objectType: ApolloAPI.Object = RickAndMortyAPI.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<Characters>("characters") public var characters
  }
}

public extension Mock where O == Query {
  convenience init(
    characters: Mock<Characters>? = nil
  ) {
    self.init()
    _setEntity(characters, for: \.characters)
  }
}
