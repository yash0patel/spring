package com.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ZeptoController {

	private final HashMap<String, ArrayList<Integer>> servicable = new HashMap<>();

	public ZeptoController() {
		ArrayList<Integer> pincodeSatelite = new ArrayList<>();
		pincodeSatelite.add(380015);
		pincodeSatelite.add(380017);

		ArrayList<Integer> pincodeNaranpura = new ArrayList<>();
		pincodeNaranpura.add(380013);
		pincodeNaranpura.add(380014);

		ArrayList<Integer> pincodeNavarangpura = new ArrayList<>();
		pincodeNavarangpura.add(380009);
		pincodeNavarangpura.add(380010);

		ArrayList<Integer> pincodePaladi = new ArrayList<>();
		pincodePaladi.add(380007);
		pincodePaladi.add(380006);

		ArrayList<Integer> pincodeSolaroad = new ArrayList<>();
		pincodeSolaroad.add(380061);
		pincodeSolaroad.add(380063);
		pincodeSolaroad.add(380013);

		servicable.put("satellite", pincodeSatelite);
		servicable.put("naranpura", pincodeNaranpura);
		servicable.put("navarangpura", pincodeNavarangpura);
		servicable.put("paladi", pincodePaladi);
		servicable.put("solaroad", pincodeSolaroad);
	}

	@GetMapping("inputarea")
	public String inputArea() {
		return "InputArea";
	}

	@PostMapping("validatearea")
	public String validateArea(String areaName, Integer zipcode, Model model) {
		boolean isError = false;

		if (areaName == null || areaName.trim().isEmpty()) {
			isError = true;
			model.addAttribute("areaNameError", "Please Enter AreaName");
		}

		if (zipcode == null) {
			isError = true;
			model.addAttribute("zipCodeError", "Please Enter zipcode");
		}

		if (isError) {
			return "InputArea";
		} else {
			model.addAttribute("zipcode", zipcode);
			model.addAttribute("areaName", areaName);

			if (servicable.containsKey(areaName.toLowerCase()) &&
				servicable.get(areaName.toLowerCase()).contains(zipcode)) {
				model.addAttribute("status", "servicable");
			} else {
				model.addAttribute("status", "not servicable");
			}

			return "Result";
		}
	}
	
	@GetMapping("addzipcode")
	public String addZipCode() {
	    return "AddZipCode";
	}

	@PostMapping("savezipcode")
	public String saveZipcode(String areaName, Integer zipcode, Model model) {
	    if (servicable.get(areaName.toLowerCase()) != null) {
	        servicable.get(areaName.toLowerCase()).add(zipcode);
	        return "InputArea";
	    } else {
	        return "AddZipCode";
	    }
	}
	
	@GetMapping("listzipcodeform")
	public String ListZipCodeForm() {
		return "ListZipCodeForm";
	}
	

	@PostMapping("listzipcode")
	public String listZipCode(String areaName, Model model) {
	    ArrayList<Integer> zipcodes = servicable.get(areaName.toLowerCase());

	    if (zipcodes != null) {
	        model.addAttribute("areaName", areaName);
	        model.addAttribute("zipcodes", zipcodes);
	        return "ListZipCode";
	    } else {
	        model.addAttribute("status", "Area not found");
	        return "ListZipCodeForm";
	    }
	}

}
