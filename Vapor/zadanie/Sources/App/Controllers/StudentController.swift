import Fluent
import Vapor

// CRUD controller for Students
struct StudentController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let students = routes.grouped("students")

        // Render view with all the students
        students.get { req async throws -> View in 
            let allStudents = try await Student.query(on: req.db).all()
            return try await req.view.render("students", ["students": allStudents])
    }

        // Get student by id
        students.get(":id") { req in
            return Student.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!)
                .all()
        }

        // Render add an student form
        students.get("add") {req async throws -> View in 
            let allUniversities = try await University.query(on: req.db).all()
            return try await req.view.render("addStudent", ["unis": allUniversities])
        }

        // Create student
        students.post("add") { req -> Response in
            let name = try req.content.get(String.self, at: "name")
            let surname = try req.content.get(String.self, at: "surname")
            let age = try req.content.get(Int.self, at: "age")
            let universityId = try req.content.get(UUID.self, at: "university")

            let university = try await University.query(on: req.db)
                .filter(\.$id == universityId)
                .first()

            let student = Student(name: name, surname: surname, age: age, universityId: university!.id!)
            try await student.save(on: req.db)
            return req.redirect(to: "/students")
        }

        // Render edit student form
        students.get("edit", ":id") { req async throws -> View in
            let student = try await Student.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!).first()
            let allUniversities = try await University.query(on: req.db).all()
            return try await req.view.render("editStudent", Context(student: student!, unis: allUniversities))
        }

        // Update student by id
        students.post("edit", ":id") { req -> Response in
            let name = try req.content.get(String.self, at: "name")
            let surname = try req.content.get(String.self, at: "surname")
            let age = try req.content.get(Int.self, at: "age")
            let universityId = try req.content.get(UUID.self, at: "university")

            let university = try await University.query(on: req.db)
                .filter(\.$id == universityId)
                .first()

            try await Student.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!)
                .delete()

            let student = Student(name: name, surname: surname, age: age, universityId: university!.id!)
            try await student.save(on: req.db)

            return req.redirect(to: "/students")
        }

        // Delete student by id
        students.post("delete", ":id") { req -> Response in
            Student.query(on: req.db)
                .filter(\.$id == req.parameters.get("id")!)
                .delete()
            return req.redirect(to: "/students")
        }

    }
}

struct Context: Encodable {
    var student: Student
    var unis: [University]
}