/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enums;

public enum Categoria {
    POLITICA(1), ATUALIDADE(2), ARTES(3);
    private final int valor;

    Categoria(int valorOpcao) {
        valor = valorOpcao;
    }

    public int getValor() {
        return valor;
    }
}
