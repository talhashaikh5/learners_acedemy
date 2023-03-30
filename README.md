# Learner's Academy Management System
This is a Java web application for managing students, classes, subjects, and teachers for the Learner's Academy school.

## Features
- Create, update, delete, and view students, classes, subjects, and teachers
- Assign classes for subjects from the master list
- Assign teachers to a class for a subject (A teacher can be assigned to different classes for different subjects)
- Get a master list of students (Each student must be assigned to a single class)
- View a class report which will show all the information about the class, such as the list of students, subjects, and teachers


## Technologies
- Java
- Hibernate
- JSP and Servlets
- HTML, CSS, and JavaScript
- Maven
- MySQL (for database)
- Usage


## To run the application, follow these steps:
- Clone the repository to your local machine.
- Import the project into your IDE.
- Configure the database connection in the hibernate.cfg.xml file.
- Run the SQL scripts in the src/main/resources directory to create the database schema and insert sample data (optional).
- Build the project using Maven.
- Deploy the application to a web server such as Apache Tomcat.
- Open a web browser and navigate to http://localhost:8080/learners-academy.

## Sprint 1
- Tasks:
  - Create the basic project structure with Maven and add necessary dependencies.
  - Create the Hibernate entities for student, class, subject, and teacher.
  - Implement DAO classes for each entity to perform CRUD operations.
  - Create unit tests for the DAO classes.
  - Create a simple command-line interface to test the functionality of the application and test the DAO methods.

## Sprint 2
- Tasks:
  - Create a web interface for the application using JSPs and Servlets.
  - Implement the Servlets for student, class, subject, and teacher to handle HTTP requests and responses.
  - Create JSP files for displaying lists of records, and creating/updating records.
  - Write JavaScript code to validate input data on the client-side.
  - Add validation checks to ensure that the input data is valid and meets the required constraints.
  - Implement security features such as authentication and authorization for the administrator login.
  - Implement search functionality to search for records by name, ID, or other criteria.
  - Test the web interface and ensure that it is user-friendly and responsive.
  - Test the application thoroughly, including load testing and stress testing.
  - Refactor the code to improve performance and remove code smells.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
