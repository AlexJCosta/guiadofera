// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.ufpb.ccae.dcx.lcc.sm.curso;

import br.ufpb.ccae.dcx.lcc.sm.curso.ProfessorDisciplina;
import br.ufpb.ccae.dcx.lcc.sm.curso.ProfessorDisciplinaController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect ProfessorDisciplinaController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProfessorDisciplinaController.showJson(@PathVariable("id") Long id) {
        ProfessorDisciplina professorDisciplina = ProfessorDisciplina.findProfessorDisciplina(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (professorDisciplina == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(professorDisciplina.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ProfessorDisciplinaController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ProfessorDisciplina> result = ProfessorDisciplina.findAllProfessorDisciplina();
        return new ResponseEntity<String>(ProfessorDisciplina.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ProfessorDisciplinaController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        ProfessorDisciplina professorDisciplina = ProfessorDisciplina.fromJsonToProfessorDisciplina(json);
        professorDisciplina.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+professorDisciplina.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ProfessorDisciplinaController.createFromJsonArray(@RequestBody String json) {
        for (ProfessorDisciplina professorDisciplina: ProfessorDisciplina.fromJsonArrayToProfessorDisciplina(json)) {
            professorDisciplina.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ProfessorDisciplinaController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ProfessorDisciplina professorDisciplina = ProfessorDisciplina.fromJsonToProfessorDisciplina(json);
        professorDisciplina.setId(id);
        if (professorDisciplina.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ProfessorDisciplinaController.deleteFromJson(@PathVariable("id") Long id) {
        ProfessorDisciplina professorDisciplina = ProfessorDisciplina.findProfessorDisciplina(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (professorDisciplina == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        professorDisciplina.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
