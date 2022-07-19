package com.agolo.postgresplayground;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/v1/domains")
public class PlaygroundController {

    @Autowired
    private PlaygroundRepository playgroundRepository;
    @GetMapping(value = "/")
    public ResponseEntity<String> getDomain() {
        PlaygroundDAO dao = playgroundRepository.findByNameIgnoreCase("agolo.com");
        return new ResponseEntity<>("Hello", HttpStatus.OK);
    }

}
