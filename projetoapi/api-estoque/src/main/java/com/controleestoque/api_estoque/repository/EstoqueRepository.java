package com.controleestoque.api_estoque.repository;

import com.controleestoque.api_estoque.model.Estoque;  // ← CORRETO!
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EstoqueRepository extends JpaRepository<Estoque, Long> {
    Estoque findByProdutoId(Long produtoId);
}