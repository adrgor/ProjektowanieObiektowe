import Fluent
import Vapor

// CRUD controller for universities
struct UniversityController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let universities = routes.grouped("universities")

        // Render view with all the universities
        universities.get { req async throws -> View in 
            let allUniversities = try await University.query(on: req.db).all()
            return try await req.view.render("universities", ["unis": allUniversities])
    }

        // Get university by id
        universities.get(":id") { req in
            return University.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!)
                .all()
        }

        // Render add an university form
        universities.get("add") {req in 
            return req.view.render("addUniversity")
        }

        // Create university
        universities.post("add") { req -> Response in
            let university = try req.content.decode(University.self)
            university.save(on: req.db)
            return req.redirect(to: "/universities")
        }

        // Render edit university form
        universities.get("edit", ":id") { req async throws -> View in
            let university = try await University.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!).first()
            return try await req.view.render("editUniversity", ["uni" : university])
        }

        // Update university by id
        universities.post("edit", ":id") { req -> Response in
            let university = try req.content.decode(University.self)
            let name = university.name
            let founding_year = university.founding_year
            let country = university.country

            University.query(on: req.db)
                .set(\.$name, to: name)
                .set(\.$country, to: country)
                .set(\.$founding_year, to: founding_year)
                .filter(\.$id == req.parameters.get("id")!)
                .update()

            return req.redirect(to: "/universities")
        }

        universities.get("error") { req -> View in
            return try await req.view.render("universityNotEpmtyErrorPage")
        }

        // Delete university by id
        universities.post("delete", ":id") { req -> Response in
            // print(req.parameters.get("id")!)
            var studentsOfUniversity = try await Student.query(on: req.db)
                .filter(\.$universityId.$id == req.parameters.get("id")!)
                .all()

            if (studentsOfUniversity.isEmpty) {
                try await University.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!)
                .delete()
                return req.redirect(to: "/universities")
            } else {
                return req.redirect(to: "/universities/error")
            }
        }

    }
}
