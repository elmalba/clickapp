# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    User.create(name: 'Cristian', lastname: 'Tejada', role: 'admin', rut: '178592831', email: 'cristian@cristian.com', password: 'password')
    User.create(name: 'Docente', lastname: '1', role: 'teacher', rut: '15975312', email: 'docente@docente.com', password: 'password')
    User.create(name: 'Alumno', lastname: '1', role: 'student', rut: '789456123', email: 'alumno@alumno.com', password: 'password')
    Course.create(name: 'Arquitectura de sistemas', code: 'CIT3201', section: '1', teacher: '15975312', assistant: '789456123')
    Course.create(name: 'Señales y sistemas', code: 'CIT3221', section: '1', teacher: '15975312', assistant: '789456123')
    Question.create(question_asked: "En una señal discreta", time: "60", user:"178592831", answers: [{"Answer"=>"El eje de las abscisas pertenece al dominio de los números reales"}, {"Answer"=>"La cantidad de elementos representados es finita"}, {"Answer"=>"Ninguna de las demás respuestas"}, {"Answer"=>"La altura es contínua"}], type_answer: "multipleChoice", courses: [], correct_answer: 3)
    Question.create(question_asked: "Una señal de potencia finita", time: "60", user:"178592831", answers: [{"Answer"=>"Puede tener Energía Infinita"}, {"Answer"=>"No puede tener Energía Infinita"}, {"Answer"=>"Solo puede tener Energía Infinita cuando la energía es el promedio de la potencia en el tiempo"}, {"Answer"=>"Ninguna de las demás respuestas"}], type_answer: "multipleChoice", courses: [], correct_answer: 0)
