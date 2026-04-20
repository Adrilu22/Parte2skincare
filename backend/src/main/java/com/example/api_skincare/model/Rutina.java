package com.example.api_skincare.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "rutinas")
public class Rutina {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    private String nombre;

    @Column(name = "tipo_piel")
    private String tipoPiel;

    private String preocupaciones;

    @Column(name = "pasos_json", columnDefinition = "TEXT")
    private String pasosJson;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getTipoPiel() { return tipoPiel; }
    public void setTipoPiel(String tipoPiel) { this.tipoPiel = tipoPiel; }
    public String getPreocupaciones() { return preocupaciones; }
    public void setPreocupaciones(String preocupaciones) { this.preocupaciones = preocupaciones; }
    public String getPasosJson() { return pasosJson; }
    public void setPasosJson(String pasosJson) { this.pasosJson = pasosJson; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
