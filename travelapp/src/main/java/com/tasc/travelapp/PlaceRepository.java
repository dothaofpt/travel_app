package com.tasc.travelapp;

import com.tasc.travelapp.Place;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlaceRepository extends JpaRepository<Place, Long> {
}