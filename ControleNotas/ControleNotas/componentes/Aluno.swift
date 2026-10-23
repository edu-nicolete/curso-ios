import Foundation

struct Aluno: Identifiable {
    let id = UUID()
    let nome: String
    let nota1: Double
    let nota2: Double
    
    var media: Double {
        (nota1 + nota2) / 2
    }
    
    var aprovado: Bool {
        media >= 7.0
    }
}
