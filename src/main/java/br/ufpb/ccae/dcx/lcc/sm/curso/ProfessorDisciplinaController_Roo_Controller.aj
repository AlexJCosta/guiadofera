// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.ufpb.ccae.dcx.lcc.sm.curso;

import br.ufpb.ccae.dcx.lcc.sm.curso.Disciplina;
import br.ufpb.ccae.dcx.lcc.sm.curso.Professor;
import br.ufpb.ccae.dcx.lcc.sm.curso.ProfessorDisciplina;
import br.ufpb.ccae.dcx.lcc.sm.curso.ProfessorDisciplinaController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProfessorDisciplinaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProfessorDisciplinaController.create(@Valid ProfessorDisciplina professorDisciplina, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, professorDisciplina);
            return "professordisciplina/create";
        }
        uiModel.asMap().clear();
        professorDisciplina.persist();
        return "redirect:/professordisciplina/" + encodeUrlPathSegment(professorDisciplina.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProfessorDisciplinaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProfessorDisciplina());
        return "professordisciplina/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProfessorDisciplinaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("professordisciplina", ProfessorDisciplina.findProfessorDisciplina(id));
        uiModel.addAttribute("itemId", id);
        return "professordisciplina/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProfessorDisciplinaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("professordisciplinaitems", ProfessorDisciplina.findProfessorDisciplinaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ProfessorDisciplina.countProfessorDisciplina() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("professordisciplinaitems", ProfessorDisciplina.findAllProfessorDisciplina(sortFieldName, sortOrder));
        }
        return "professordisciplina/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProfessorDisciplinaController.update(@Valid ProfessorDisciplina professorDisciplina, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, professorDisciplina);
            return "professordisciplina/update";
        }
        uiModel.asMap().clear();
        professorDisciplina.merge();
        return "redirect:/professordisciplina/" + encodeUrlPathSegment(professorDisciplina.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProfessorDisciplinaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ProfessorDisciplina.findProfessorDisciplina(id));
        return "professordisciplina/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProfessorDisciplinaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProfessorDisciplina professorDisciplina = ProfessorDisciplina.findProfessorDisciplina(id);
        professorDisciplina.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/professordisciplina";
    }
    
    void ProfessorDisciplinaController.populateEditForm(Model uiModel, ProfessorDisciplina professorDisciplina) {
        uiModel.addAttribute("professorDisciplina", professorDisciplina);
        uiModel.addAttribute("disciplinas", Disciplina.findAllDisciplinas());
        uiModel.addAttribute("professores", Professor.findAllProfessores());
    }
    
    String ProfessorDisciplinaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
