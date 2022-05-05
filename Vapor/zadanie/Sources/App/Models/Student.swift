import Fluent
import Vapor

final class Student: Model, Content {
    static let schema = "students"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "surname")
    var surname: String

    @Field(key: "age")
    var age: Int

    @Parent(key: "universityId")
    var universityId: University

    init() { }

    init(id: UUID? = nil, name: String, surname: String, age: Int, universityId: University.IDValue) {
        self.id = id
        self.name = name
        self.surname = surname
        self.age = age
        self.$universityId.id = universityId
    }
}
