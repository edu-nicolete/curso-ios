import SwiftUI


struct ContentView: View {
    
    @State
    private var nome = ""
    
    @State
    private var nota1 = ""
    
    @State
    private var nota2 = ""
    
    @State
    private var alunos: [Aluno] = []
    
    @State
    private var alerta = false
    
    @State
    private var mensagem = ""
    
    private var total: Int {
        alunos.count
    }
    
    private var totalAprovados: Int {
        alunos.filter { $0.aprovado }.count
    }
    
    private var totalReprovados: Int {
        alunos.filter { !$0.aprovado }.count
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                FormularioView(nome: $nome, nota1: $nota1, nota2: $nota2, cadastrar: cadastrar)
                        
                ResumoView(totalAlunos: total, totalAprovados: totalAprovados, totalReprovados: totalReprovados)
                    
                
            }
            .padding()
            .background(Color(.orange))
            .navigationTitle("Controle de Notas")
            .alert("Atencao", isPresented: $alerta) {
               Button("Ok", role: .cancel) {}
            } message: {
               Text(mensagem)
            }
            
            VStack {
                ScrollView {
                    listar
                }
                .padding()
            }
        }
    }
    
    private var listar: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Alunos Cadastrados")
                .font(.headline)
            
            if (alunos.isEmpty) {
                ContentUnavailableView(
                    "Nenhum aluno cadastrado",
                    systemImage: "person.3",
                    description: Text("Preencha o formulário para adicionar o primeiro aluno.")
                )
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            } else {
                ForEach(alunos) { aluno in
                    ListaAlunosView(aluno: aluno) {
                        remover(aluno)
                    }
                    
                }
            }
        }
    }
    
    private func cadastrar() {
        let nomeLimpo = nome.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !nomeLimpo.isEmpty else {
            exibirAlerta("Informe o nome do aluno.")
            return
        }
        
        let textoN1 = nota1.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: ",", with: ".")
        
        let textoN2 = nota2.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: ",", with: ".")
        
        guard
            let valorN1 = Double(textoN1),
            let valorN2 = Double(textoN2)
        else {
            exibirAlerta("Preencha as duas notas corretamente.")
            return
        }
        
        guard
            valorN1.isFinite,
            valorN2.isFinite,
            (0...10).contains(valorN1),
            (0...10).contains(valorN2)
        else {
            exibirAlerta("As notas devem estar entre 0 e 10.")
            return
        }
        
        let novoAluno = Aluno(nome: nomeLimpo, nota1: valorN1, nota2: valorN2)
        
        alunos.append(novoAluno)
        
        nome = ""
        nota1 = ""
        nota2 = ""
    }
    
    private func remover(_ aluno: Aluno) {
        alunos.removeAll { $0.id == aluno.id}
    }
    
    private func exibirAlerta(_ msg: String) {
        mensagem = msg
        alerta = true
    }
    
}

#Preview {
    ContentView()
}

