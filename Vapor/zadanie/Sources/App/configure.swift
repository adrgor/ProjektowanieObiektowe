import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateUniversity())
    app.migrations.add(CreateCountry())
    app.migrations.add(CreateStudent())
    try app.autoMigrate().wait()


    app.views.use(.leaf)

    // register routes
    try routes(app)
}
