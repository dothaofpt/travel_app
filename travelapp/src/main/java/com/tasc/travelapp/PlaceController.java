package com.tasc.travelapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "*") // Cho phép tất cả nguồn (dùng tạm cho thử nghiệm)
public class PlaceController {
    @Autowired
    private PlaceRepository placeRepository;

    @GetMapping("/api/getAllPlace")
    public List<Place> getAllPlace() {
        return placeRepository.findAll();
    }
}