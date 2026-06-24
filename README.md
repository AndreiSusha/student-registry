# Student Registry

A small RESTful web service for managing a student directory — built to practice the Jakarta EE stack end-to-end: a JAX-RS API backed by JPA persistence, packaged as a WAR, and run on Tomcat with a MySQL database via Docker Compose.

## What it does

The service exposes a simple resource — students with `name` and `address` — through a REST API. A single-page HTML client consumes the same API to add, list, and delete records.

- `GET  /rest/students/getall` — list all students (JSON)
- `POST /rest/students/add` — create a student (form-encoded: `name`, `address`)
- `POST /rest/students/delete/{id}` — remove a student by id
- `GET  /rest/students/hello` — health check

The UI is a lightweight design-system page that talks to the same endpoints — useful for quick manual testing, but the API is the product.

## Stack

| Layer         | Choice                                                      |
| ------------- | ----------------------------------------------------------- |
| API           | Jakarta RESTful Web Services (JAX-RS) on Jersey             |
| Persistence   | Jakarta Persistence (JPA) with EclipseLink                  |
| Database      | MySQL 8.4                                                   |
| Container     | Apache Tomcat 11 (Jakarta EE 10)                            |
| Build         | Maven, JDK 24                                               |
| Orchestration | Docker Compose                                              |
| Frontend      | Vanilla HTML/CSS/JS — design tokens, no framework, no build |

## Project structure

```
Web-service/
├── docker-compose.yml          # Tomcat + MySQL orchestration
└── demo/
    ├── Dockerfile              # Tomcat 11 image, deploys the WAR as ROOT
    ├── pom.xml                 # Maven build, Jakarta EE / Jersey / EclipseLink deps
    └── src/main/
        ├── java/com/example/
        │   ├── api/StudentResource.java   # JAX-RS endpoints
        │   ├── model/Student.java         # JPA entity
        │   └── util/JPAUtil.java          # EntityManagerFactory helper
        ├── resources/META-INF/persistence.xml
        └── webapp/
            ├── WEB-INF/web.xml
            └── index.jsp                  # vanilla HTML/CSS/JS client
```

## Running locally

Prerequisites: **JDK 24+**, **Maven 3.8+**, **Docker Desktop**.

```bash
# 1. Build the WAR
cd demo
mvn clean package
cd ..

# 2. Start Tomcat + MySQL
docker compose up --build
```

The app is then available at:

- UI — http://localhost:8080
- REST — http://localhost:8080/rest/students/getall

### Iterating on the frontend

`index.jsp` is baked into the WAR at build time, so frontend changes require a rebuild:

```bash
cd demo && mvn clean package && cd ..
docker compose up -d --build tomcat
```

MySQL is left running, so existing data is preserved.

## API reference

#### Add a student

```http
POST /rest/students/add
Content-Type: application/x-www-form-urlencoded

name=Andrei+Susha&address=Berlin%2C+Germany
```

#### List students

```http
GET /rest/students/getall
```

Returns:

```json
[
  { "id": 1, "name": "Andrei Susha", "address": "Berlin, Germany" },
  { "id": 2, "name": "Ana Gonzalez", "address": "Barcelona, Spain" }
]
```

#### Delete a student

```http
POST /rest/students/delete/{id}
```

## Notes

The focus of this project is the server side: getting JAX-RS, JPA, Tomcat and MySQL to work together cleanly in a reproducible container setup. The HTML client is deliberately minimal — vanilla JS, a small CSS design-system, no build step — so the repository stays a single deployable unit without a separate frontend toolchain.
