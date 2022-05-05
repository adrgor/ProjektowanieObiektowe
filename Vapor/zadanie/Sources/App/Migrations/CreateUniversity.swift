import Fluent

struct CreateUniversity: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("universities")
            .id()
            .field("name", .string, .required)
            .field("country", .string, .required)
            .field("founding_year", .int, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("universities").delete()
    }
}
