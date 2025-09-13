package EventosChetos.EventosChetos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
@RestController
public class EventosChetosApplication {

	public static void main(String[] args) {
		SpringApplication.run(EventosChetosApplication.class, args);
	}

	@GetMapping("")
    public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
      return String.format("Hello %s!", name);
    }

	@GetMapping("/actuator/health")
   	public ResponseEntity<Void> sendViaResponseEntity() {
    	return ResponseEntity.noContent().build();
	}

}
