package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.entity.ScheduleEntity;

@Repository
public interface ScheduleRepository extends JpaRepository<ScheduleEntity, Integer>{
	@Query(nativeQuery = true, value = "select * from schedules where title like :title")
	List<ScheduleEntity> searchByTitle(String title);
}
