import Fluent
import Vapor

// CRUD controller for countries
struct CountryController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let countries = routes.grouped("countries")

        // Render view with all the countries
        countries.get { req async throws -> View in 
            let allCountries = try await Country.query(on: req.db).all()
            return try await req.view.render("countries", ["countries": allCountries])
        }

        // Get Country by id
        countries.get(":id") { req in
            return Country.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!)
                .all()
        }

        // Render add an Country form
        countries.get("add") {req in 
            return req.view.render("addCountry")
        }

        // Create Country
        countries.post("add") { req -> Response in
            let country = try req.content.decode(Country.self)
            country.save(on: req.db)
            return req.redirect(to: "/countries")
        }

        // Render edit country form
        countries.get("edit", ":id") { req async throws -> View in
            let country = try await Country.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!).first()
            return try await req.view.render("editCountry", ["country" : country])
        }

        // Update country by id
        countries.post("edit", ":id") { req -> Response in
            let country = try req.content.decode(Country.self)
            let name = country.name
            let language = country.language
            let gdp = country.gdp
            let population = country.population

            Country.query(on: req.db)
                .set(\.$name, to: name)
                .set(\.$gdp, to: gdp)
                .set(\.$language, to: language)
                .set(\.$population, to: population)
                .filter(\.$id == req.parameters.get("id")!)
                .update()

            return req.redirect(to: "/countries")
        }

        // Delete country by id
        countries.post("delete", ":id") { req -> Response in
            Country.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!)
                .delete()
            return req.redirect(to: "/countries")
        }

    }
}
