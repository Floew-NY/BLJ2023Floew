package ch.battino.sbdemo01;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

  @GetMapping("/")
  public String index() {
    return "<h2>Greetings from Spring Boot!</h2>";
  }
  @GetMapping("/api")
  public String api() {
    return "<h2>generated api</h2>";
  }
}
