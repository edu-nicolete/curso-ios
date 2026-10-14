//
//  main.swift
//  Biblioteca
//
//  Created by Augusto, Eduardo Henrique Nicolete on 08/10/26.
//

import Foundation

let biblioteca = Biblioteca()

func cadastrarLivro() {
    print("""
        1 - Livro físico
        2 - Livro digital
        """)
    
    let opcao = Int(readLine() ?? "0")
    
    print("Digite o título do livro:")
    let titulo = readLine() ?? ""
    
    if titulo.isEmpty {
        print("Título inválido")
        return
    }
    print("Digite o autor do livro:")
    let autor = readLine() ?? ""
    
    if autor.isEmpty {
        print("Autor inválido")
        return
    }
    print("Digite o ano de publicacao:")
    let ano = Int(readLine() ?? "") ?? 0
    
    if ano == 0 {
        print("Ano inválido")
        return
    }

    switch opcao {
        case 1:
            let livro = Livro(titulo: titulo, autor: autor, anoPublicacao: ano)
            
            biblioteca.cadastrarLivro(livro)
        case 2:
            print("Digite o tamanho em MB do livro:")
            let tamanho = Double(readLine() ?? "") ?? 0.0
        
            if (tamanho > 10) {
                print("Livro digital muito grande, tente outro tamanho.")
            }
        
            let livro = LivroDigital(titulo: titulo, autor: autor, anoPublicacao: ano, tamanhoMb: tamanho)
        
            biblioteca.cadastrarLivro(livro)
    default:
        print("Opção inválida")
        return
    }
    
}

func buscarLivro() {
    print("""
        1 - Buscar por ID
        2 - Buscar por título
        """)
    
    let opcao = Int(readLine() ?? "0")
    
    switch opcao {
    case 1:
        print("Digite o ID do livro:")
        guard let id = UUID(uuidString: readLine() ?? "") else { return }
        
        if let livro = biblioteca.buscarPorId(id) {
            livro.exibirDetalhes()
        } else {
            print("Livro não encontrado.")
        }
    case 2:
        print("Digite o título do livro:")
        let titulo = readLine() ?? ""
        let livros = biblioteca.buscarPorTitulo(titulo)
        
        if !livros.isEmpty {
            livros.forEach{ $0.exibirDetalhes()}
        } else {
            print("Livro não encontrado.")
        }
    default:
        print("Opção inválida")
    }
}

func editarLivro() {
    print("Digite o ID do livro:")
    guard let id = UUID(uuidString: readLine() ?? "") else { return }
    
    guard let livro = biblioteca.buscarPorId(id)
    else {
        print("Livro não encontrado.")
        return
    }
    
    print("Digite o novo título do livro:")
    let titulo = readLine() ?? ""
    
    if titulo.isEmpty {
        print("Título inválido")
        return
    }
    print("Digite o novo autor do livro:")
    let autor = readLine() ?? ""
    
    if autor.isEmpty {
        print("Autor inválido")
        return
    }
    print("Digite o novo ano de publicacao:")
    let ano = Int(readLine() ?? "") ?? 0
    
    let novoLivro = Livro(titulo: titulo, autor: autor, anoPublicacao: ano)
    
    livro.atualizar(novoLivro)
    
    print("Livro atualizado com sucesso!")
}

func emprestimoLivro() {
    print("Digite o ID do livro:")
    guard let id = UUID(uuidString: readLine() ?? "") else { return }
    
    guard let livro = biblioteca.buscarPorId(id)
    else {
        print("Livro não encontrado.")
        return
    }
    
    if(livro.isEmprestado) {
        livro.devolver()
    } else {
        livro.emprestar()
    }
}

func removerLivro() {
    print("Digite o ID do livro:")
    guard let id = UUID(uuidString: readLine() ?? "") else { return }
    
    biblioteca.removerLivro(id)
}

while true {
    print("""
        ==============================
            Sistema de biblioteca   
        ==============================
        
        1 - Cadastrar livro
        2 - Listar livros
        3 - Buscar livro
        4 - Editar livro
        5 - Emprestar/Devolver livro
        6 - Excluir livro
        0 - Sair
        ==============================
        """)
    
    let opcao = Int(readLine() ?? "0")
    
    switch opcao {
        case 1:
            cadastrarLivro()
        case 2:
            biblioteca.listarLivros()
        case 3:
            buscarLivro()
        case 4:
            editarLivro()
        case 5:
            emprestimoLivro()
        case 6:
            removerLivro()
        case 0:
            print("Obrigado por usar nosso sistema!")
            exit(0)
        default:
            print("Opção inválida!")
    }
}

