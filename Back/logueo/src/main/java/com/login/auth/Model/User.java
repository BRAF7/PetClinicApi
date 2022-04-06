package com.login.auth.Model;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUser;

    @Column(name = "email")
    private String email;

    @Column(name = "passwd")
    private String password;

    @Column(name = "rol")
    private String rol;

    public User() {
    }

    public User(int idUser, String email, String password, String rol) {
        this.idUser = idUser;
        this.email = email;
        this.password = password;
        this.rol = rol;
    }

    public int getId() {
        return idUser;
    }

    public void setId(int idUser) {
        this.idUser = idUser;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}
