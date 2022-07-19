package com.agolo.postgresplayground;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.*;

@Entity(name = "playgrounddao")
@Table(name = "playgrounddao", schema = "public")
@Getter
@Setter
@EqualsAndHashCode
public class PlaygroundDAO {

    @Id
    @Column(name = "name", nullable = false, unique = true, length = 200)
    private String name;
}
