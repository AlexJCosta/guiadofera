// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.ufpb.ccae.dcx.lcc.sm.curso;

import br.ufpb.ccae.dcx.lcc.sm.curso.Disciplina;
import br.ufpb.ccae.dcx.lcc.sm.curso.ProfessorDisciplina;
import java.util.List;

privileged aspect Disciplina_Roo_JavaBean {
    
    public Integer Disciplina.getStatus() {
        return this.status;
    }
    
    public void Disciplina.setStatus(Integer status) {
        this.status = status;
    }
    
    public String Disciplina.getNome() {
        return this.nome;
    }
    
    public void Disciplina.setNome(String nome) {
        this.nome = nome;
    }
    
    public List<ProfessorDisciplina> Disciplina.getProfessorDisciplina() {
        return this.professorDisciplina;
    }
    
    public void Disciplina.setProfessorDisciplina(List<ProfessorDisciplina> professorDisciplina) {
        this.professorDisciplina = professorDisciplina;
    }
    
}