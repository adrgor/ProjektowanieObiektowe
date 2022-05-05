import Fluent
import Vapor

final class University: Model, Content {
    static let schema = "universities"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "country")
    var country: String

    @Field(key: "founding_year")
    var founding_year: Int

    init() { }

    init(id: UUID? = nil, title: String, country: String, founding_year: Int) {
        self.id = id
        self.name = name
        self.country = country
        self.founding_year = founding_year
    }
}
