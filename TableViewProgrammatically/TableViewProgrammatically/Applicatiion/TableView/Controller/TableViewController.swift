//
//  TableViewController.swift
//  TableViewProgrammatically
//
//  Created by rodolfo silva on 25/04/24.
//

import UIKit

// Estrutura para representar cada item na tabela.
struct TableViewItens {
    let title: String       // Título do item.
    let iconName: String    // Nome do ícone a ser exibido ao lado do título.
    let showArrow: Bool     // Booleano para mostrar ou ocultar a seta.
}

// Classe controladora que gerencia a exibição de uma tabela em uma tela do iOS.
class TableViewController: UIViewController {

    // Variável opcional para manter uma referência para a interface da tabela personalizada.
    var tableViewUIView: TableViewUIView? = nil
    
    // Array de itens que serão mostrados na tabela.
    let tableViewItens: [TableViewItens] = [
        TableViewItens(title: "Title 1", iconName: "info.circle.fill", showArrow: true),
        TableViewItens(title: "Title 2", iconName: "info.circle.fill", showArrow: true),
        TableViewItens(title: "Title 3", iconName: "info.circle.fill", showArrow: false),
    ]
    
    // Método chamado ao carregar a view do controlador. Configura a interface da view.
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    // Método chamado após a view ser carregada. Utilizado para configurações adicionais, se necessário.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Configura a view principal do controlador.
    func setupView() {
        navigationController?.isNavigationBarHidden = true  // Esconde a barra de navegação.
        view = TableViewUIView()  // Define a view personalizada como a view principal.
        tableViewUIView = view as? TableViewUIView  // Guarda uma referência à view personalizada.
        tableViewUIView?.tableView.dataSource = self  // Define o controlador como fonte de dados da tabela.
        tableViewUIView?.tableView.delegate = self  // Define o controlador como delegado da tabela.
    }
}

// Extensão para implementar os métodos de UITableViewDataSource e UITableViewDelegate.
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    // Retorna o número de seções na tabel.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Retorna o número de itens na seção da tabela.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItens.count
    }
    
    // Cria e configura cada célula da tabela.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let item = tableViewItens[indexPath.row]
        cell.configure(withTitle: item.title, iconName: item.iconName, showArrow: item.showArrow)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    // Retorna a altura para cada célula da tabela.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0  // Define a altura fixa de 50 pontos para cada célula.
    }
    
    // Método chamado quando uma célula é selecionada.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Remove a seleção visual da célula após ser tocada, com uma animação.
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Imprime no console a seção e a posição da célula dentro da seção.
        // O 'indexPath' é composto por 'section' e 'row'.
        print("Did select normal list item \(indexPath)")
    }
}

