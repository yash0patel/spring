package com.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name="books")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BookEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer bookId;
	
	String bookName;
	String authorName;
	Integer price;
	String category;
}
