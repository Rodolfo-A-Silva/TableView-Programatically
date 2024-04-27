//
//  TableViewUIView.swift
//  TableViewProgrammatically
//
//  Created by rodolfo silva on 25/04/24.
//

import UIKit

// Classe de view personalizada para a tela da tabela.
class TableViewUIView: UIView {
    
    // Componentes da view
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white  // Cor de fundo do cabeçalho.
        view.translatesAutoresizingMaskIntoConstraints = false  // Desativa autoresizing para usar Auto Layout.
        return view
    }()
    
    lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TABLEVIEW"  // Texto do título.
        label.textColor = .black  // Cor do texto.
        label.textAlignment = .center  // Alinhamento do texto.
        label.translatesAutoresizingMaskIntoConstraints = false  // Desativa autoresizing para usar Auto Layout.
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false  // Desativa autoresizing para usar Auto Layout.
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")  // Registra a célula personalizada.
        table.backgroundColor = .white  // Cor de fundo da tabela.
        table.separatorStyle = .none  // Estilo do separador das células.
        table.separatorColor = UIColor.gray  // Cor do separador.
        return table
    }()

    // Inicializador padrão para frames.
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Inicializador sem parâmetros. Configura a view e adiciona os subviews.
    init() {
        super.init(frame: .zero)
        setupView()
        addSubViews()
        setupConstraint()
    }
    
    // Inicializador necessário para codificação e decodificação (não implementado).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configura a view (cor de fundo).
    func setupView() {
        backgroundColor = .white
    }
    
    // Adiciona os subviews à view principal.
    func addSubViews() {
        addSubview(headerView)
        addSubview(headerTitleLabel)
        addSubview(tableView)
    }
    
    // Configura as constraints dos subviews.
    func setupConstraint() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            headerTitleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerTitleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}

