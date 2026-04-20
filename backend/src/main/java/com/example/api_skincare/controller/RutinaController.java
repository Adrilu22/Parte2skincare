package com.example.api_skincare.controller;

import com.example.api_skincare.model.Rutina;
import com.example.api_skincare.model.Usuario;
import com.example.api_skincare.repository.RutinaRepository;
import com.example.api_skincare.repository.UsuarioRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/rutinas")
@CrossOrigin("*")
public class RutinaController {

    private final RutinaRepository rutinaRepository;
    private final UsuarioRepository usuarioRepository;

    public RutinaController(RutinaRepository rutinaRepository,
                            UsuarioRepository usuarioRepository) {
        this.rutinaRepository = rutinaRepository;
        this.usuarioRepository = usuarioRepository;
    }

    // GET todas las rutinas de un usuario
    @GetMapping("/usuario/{usuarioId}")
    public List<Rutina> obtenerPorUsuario(@PathVariable Long usuarioId) {
        return rutinaRepository.findByUsuarioId(usuarioId);
    }

    // GET rutina por ID
    @GetMapping("/{id}")
    public ResponseEntity<Rutina> obtenerPorId(@PathVariable Long id) {
        return rutinaRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // POST crear rutina para un usuario
    @PostMapping("/usuario/{usuarioId}")
    public ResponseEntity<Rutina> crearRutina(
            @PathVariable Long usuarioId,
            @RequestBody Rutina rutina) {
        Usuario usuario = usuarioRepository.findById(usuarioId).orElse(null);
        if (usuario == null) return ResponseEntity.notFound().build();
        rutina.setUsuario(usuario);
        return ResponseEntity.ok(rutinaRepository.save(rutina));
    }

    // DELETE rutina
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        if (!rutinaRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        rutinaRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
