import Fluent
import Vapor

// Define routes
func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index")
    }

    try app.register(collection: UniversityController())
    try app.register(collection: CountryController())
    try app.register(collection: StudentController())
}
