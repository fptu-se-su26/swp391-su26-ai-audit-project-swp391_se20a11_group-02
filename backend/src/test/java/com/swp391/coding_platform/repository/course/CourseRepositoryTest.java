package com.swp391.coding_platform.repository.course;

import com.swp391.coding_platform.entity.course.CourseEntity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import com.swp391.coding_platform.TestcontainersConfiguration;
import org.springframework.data.domain.PageRequest;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Import(TestcontainersConfiguration.class)
class CourseRepositoryTest {

    @Autowired
    private CourseRepository courseRepository;

    @Test
    void testSaveAndFindCourse() {
        CourseEntity course = new CourseEntity();
        course.setTitle("Hibernate Test Course");
        course.setPrice(BigDecimal.TEN);
        course.setType("PAID");

        CourseEntity saved = courseRepository.save(course);

        Optional<CourseEntity> found = courseRepository.findById(saved.getId());
        assertTrue(found.isPresent());
        assertEquals("Hibernate Test Course", found.get().getTitle());
    }

    @Test
    void testFindTopCoursesDynamic() {
        // Query relies on relationships, mainly checking if syntax is correct for H2
        List<Object[]> topCourses = courseRepository.findTopCoursesDynamic(PageRequest.of(0, 10));
        assertNotNull(topCourses);
    }
}
