//
//  TableViewCell.swift
//  TableViewProgrammatically
//
//  Created by rodolfo silva on 25/04/24.
//

import UIKit

// Classe personalizada para células da tabela.
class TableViewCell: UITableViewCell {
    
    // Componentes da célula.
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let arrowImageView = UIImageView()
    
    // Inicializador padrão.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()  // Adiciona subviews à contentView da célula.
        setupView()    // Configura as propriedades visuais dos componentes.
        setupConstraints()  // Configura constraints dos componentes.
        selectionStyle = .none  // Desativa a seleção visual da célula.
    }
    
    // Inicializador necessário para codificação e decodificação (não implementado).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Adiciona subviews à contentView da célula.
    private func addSubviews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowImageView)
    }
    
    // Configura as propriedades visuais dos componentes da célula.
    private func setupView() {
        iconImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = UIFont.systemFont(ofSize: 16)  // Tamanho da fonte do título.
        titleLabel.textColor = .gray  // Cor do título.
        
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.image = UIImage(systemName: "chevron.right")  // Imagem da seta.
        arrowImageView.tintColor = .gray  // Cor da seta.
    }
    
    // Configura as constraints para os componentes da célula.
    private func setupConstraints() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 15
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),  // Largura do ícone.
            iconImageView.heightAnchor.constraint(equalToConstant: 30),  // Altura do ícone.
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -padding),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 15),  // Largura da seta.
            arrowImageView.heightAnchor.constraint(equalToConstant: 15),  // Altura da seta.
        ])
    }
    
    // Método para configurar a célula com os dados fornecidos.
    func configure(withTitle title: String, iconName: String, showArrow: Bool = true) {
        titleLabel.text = title  // Define o título.
        iconImageView.image = UIImage(systemName: iconName)  // Define o ícone.
        arrowImageView.isHidden = !showArrow  // Mostra ou oculta a seta.
    }
}
