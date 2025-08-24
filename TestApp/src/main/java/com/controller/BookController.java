package com.controller;

import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.BookEntity;
import com.repository.BookRepository;

@Controller
public class BookController {

	@Autowired
    private BookRepository bookRepo;

    @GetMapping("/bookForm")
    public String showBookForm() {
        return "bookForm";
    }

    @PostMapping("/saveBook")
    public String saveBook(BookEntity book) {
        bookRepo.save(book);
//        System.out.println(book.getBookName() + " | " + book);
        return "redirect:/listBook";
    }
    
    @GetMapping("/listBook")
    public String listBook(Model model) {
    	model.addAttribute("books",bookRepo.findAll());
		return "ListBooks";
    }
    
    @GetMapping("/deleteBook")
    public String deleteBook(Integer id) {
    	bookRepo.deleteById(id);
    	return "redirect:/listBook";
    }
    
    @GetMapping("/editBook")
    public String editBook(Integer id,Model model) {
    	model.addAttribute("book",bookRepo.findById(id).orElse(null));
    	return "UpdateBook";
    }
    
    @PostMapping("/updateBook")
    public String updateBook(BookEntity book) {
    	bookRepo.save(book);
    	return "redirect:/listBook";
    }
}
