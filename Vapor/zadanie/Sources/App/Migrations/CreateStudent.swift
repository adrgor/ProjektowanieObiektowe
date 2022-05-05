import Fluent

struct CreateStudent: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("students")
            .id()
            .field("name", .string, .required)
            .field("surname", .string, .required)
            .field("age", .int, .required)
            .field("universityId", .uuid, .required)
            .foreignKey("universityId", references: "universities", "id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("students").delete()
    }
}
