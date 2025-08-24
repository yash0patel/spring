package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.entity.ScheduleEntity;
import com.repository.ScheduleRepository;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleRepository scheduleRepository;
	
	@GetMapping("newschedule")
	public String newSchedule() {
		return "NewSchedule";
	}
	
	@PostMapping("saveSchedule")
	public String saveSchedule(ScheduleEntity scheduleEntity) {
		System.out.println(scheduleEntity.getTitle());
		scheduleRepository.save(scheduleEntity);
		return "";
	}
	
	@GetMapping("/listSchedules")
	public String listSchedules(Model model) {
	    model.addAttribute("schedules", scheduleRepository.findAll());
	    return "ListSchedules";
	}
	
	@GetMapping("sortoption")
	public String sortOption() {
		return "SortOption";
	}
	
	@GetMapping("/listSchedulesByDate")
	public String listSchedulesByDate(Model model) {
	    model.addAttribute("schedules", scheduleRepository.findAll(Sort.by(Sort.DEFAULT_DIRECTION.DESC,"scheduleDate","startTime")));
	    return "ListSchedules";
	}
	
	@GetMapping("/deleteSchedule")
	public String deleteSchedule(Integer id) {
		scheduleRepository.deleteById(id);
		return "redirect:/listSchedules";
	}
	
	@GetMapping("/listSchedulesForTitle")
	public String listSchedulesForTitle(String title, Model model) {
	    model.addAttribute("schedules", scheduleRepository.searchByTitle("%" + title + "%"));
	    return "ListSchedules";
	}
}
