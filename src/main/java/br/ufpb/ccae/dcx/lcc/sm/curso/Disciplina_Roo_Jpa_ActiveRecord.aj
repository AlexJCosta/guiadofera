// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.ufpb.ccae.dcx.lcc.sm.curso;

import br.ufpb.ccae.dcx.lcc.sm.curso.Disciplina;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Disciplina_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Disciplina.entityManager;
    
    public static final List<String> Disciplina.fieldNames4OrderClauseFilter = java.util.Arrays.asList("status", "nome", "professorDisciplina");
    
    public static final EntityManager Disciplina.entityManager() {
        EntityManager em = new Disciplina().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Disciplina.countDisciplinas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Disciplina o", Long.class).getSingleResult();
    }
    
    public static List<Disciplina> Disciplina.findAllDisciplinas() {
        return entityManager().createQuery("SELECT o FROM Disciplina o", Disciplina.class).getResultList();
    }
    
    public static List<Disciplina> Disciplina.findAllDisciplinas(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Disciplina o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Disciplina.class).getResultList();
    }
    
    public static Disciplina Disciplina.findDisciplina(Long id) {
        if (id == null) return null;
        return entityManager().find(Disciplina.class, id);
    }
    
    public static List<Disciplina> Disciplina.findDisciplinaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Disciplina o", Disciplina.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Disciplina> Disciplina.findDisciplinaEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Disciplina o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Disciplina.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Disciplina.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Disciplina.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Disciplina attached = Disciplina.findDisciplina(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Disciplina.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Disciplina.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Disciplina Disciplina.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Disciplina merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
