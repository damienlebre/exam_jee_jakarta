package com.dlebre.exam_jee.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

@Entity
public class Annonce {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column( nullable = false)
    @NotBlank(message = "Veuillez indiquer un titre pour l'annonce")
    @Length(min = 4, message = "Le titre doit faire au moins 4 caractères")
    @Length(max = 50, message = "Le titre ne peut pas faire plus de 50 caractères")
    private String titre;

    @Column( nullable = false)
    @NotBlank(message = "Veuillez entrer une courte description de votre annonce")
    @Length(max = 150, message = "La description courte ne peux pas faire plus de 150 caractères")
    private String descriptionCourte;

    @Column(nullable = false)
    @NotBlank(message = "une image pour l'annonce est obligatoire")
    private String image;

    @Column( nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date datePublication;

    @Column(nullable = false, columnDefinition = "TEXT")
    @NotBlank(message = "Votre annonce ne peux pas etre vide")
    private String contenu;


    public Annonce() {
    }

    public Annonce(String titre, String descriptionCourte, String image, Date datePublication, String contenu) {
        this.titre = titre;
        this.descriptionCourte = descriptionCourte;
        this.image = image;
        this.datePublication = datePublication;
        this.contenu = contenu;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescriptionCourte() {
        return descriptionCourte;
    }

    public void setDescriptionCourte(String descriptionCourte) {
        this.descriptionCourte = descriptionCourte;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getDatePublication() {
        return datePublication;
    }

    public void setDatePublication(Date datePublication) {
        this.datePublication = datePublication;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }
}
