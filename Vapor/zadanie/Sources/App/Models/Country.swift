import Fluent
import Vapor

final class Country: Model, Content {
    static let schema = "countries"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "language")
    var language: String

    @Field(key: "gdp")
    var gdp: Int

    @Field(key: "population")
    var population: Int

    init() { }

    init(id: UUID? = nil, name: String, language: String, population: Int, gdp: Int) {
        self.id = id
        self.name = name
        self.language = language
        self.population = population
        self.gdp = gdp
    }
}
