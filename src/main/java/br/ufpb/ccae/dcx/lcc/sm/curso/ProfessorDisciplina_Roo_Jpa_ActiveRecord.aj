// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.ufpb.ccae.dcx.lcc.sm.curso;

import br.ufpb.ccae.dcx.lcc.sm.curso.ProfessorDisciplina;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProfessorDisciplina_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ProfessorDisciplina.entityManager;
    
    public static final List<String> ProfessorDisciplina.fieldNames4OrderClauseFilter = java.util.Arrays.asList("status", "periodo", "semestre", "professor", "disciplina");
    
    public static final EntityManager ProfessorDisciplina.entityManager() {
        EntityManager em = new ProfessorDisciplina().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ProfessorDisciplina.countProfessorDisciplina() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ProfessorDisciplina o", Long.class).getSingleResult();
    }
    
    public static List<ProfessorDisciplina> ProfessorDisciplina.findAllProfessorDisciplina() {
        return entityManager().createQuery("SELECT o FROM ProfessorDisciplina o", ProfessorDisciplina.class).getResultList();
    }
    
    public static List<ProfessorDisciplina> ProfessorDisciplina.findAllProfessorDisciplina(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ProfessorDisciplina o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ProfessorDisciplina.class).getResultList();
    }
    
    public static ProfessorDisciplina ProfessorDisciplina.findProfessorDisciplina(Long id) {
        if (id == null) return null;
        return entityManager().find(ProfessorDisciplina.class, id);
    }
    
    public static List<ProfessorDisciplina> ProfessorDisciplina.findProfessorDisciplinaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ProfessorDisciplina o", ProfessorDisciplina.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ProfessorDisciplina> ProfessorDisciplina.findProfessorDisciplinaEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ProfessorDisciplina o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ProfessorDisciplina.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ProfessorDisciplina.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ProfessorDisciplina.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ProfessorDisciplina attached = ProfessorDisciplina.findProfessorDisciplina(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ProfessorDisciplina.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ProfessorDisciplina.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ProfessorDisciplina ProfessorDisciplina.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ProfessorDisciplina merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
