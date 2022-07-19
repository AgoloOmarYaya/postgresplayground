package com.agolo.postgresplayground;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlaygroundRepository extends JpaRepository<PlaygroundDAO, Long> {
        PlaygroundDAO findByNameIgnoreCase(String name);
}