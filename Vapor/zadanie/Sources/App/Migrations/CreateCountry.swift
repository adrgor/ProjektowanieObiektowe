import Fluent

struct CreateCountry: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("countries")
            .id()
            .field("name", .string, .required)
            .field("language", .string, .required)
            .field("gdp", .int, .required)
            .field("population", .int, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("countries").delete()
    }
}
