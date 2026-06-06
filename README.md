# CampConnect Config Server

Centralized Spring Cloud Config Server using the native classpath repository.
Configuration files are stored in `src/main/resources/config`.

## Managed Applications

| Application | Configuration |
| --- | --- |
| `event-service` | MongoDB, Eureka, notification endpoint, actuator, Swagger |
| `notification-service` | MongoDB, Eureka, actuator, Swagger |
| `user-service` | MySQL, mail, Eureka |
| `api-camping` | Service port |

Clients use:

```properties
spring.config.import=configserver:http://localhost:8099
```

The team Docker Compose uses `http://config-server:8099`.

## Environment Overrides

Committed configuration contains no credentials. Runtime values can override
the central defaults:

- `MONGODB_URI`
- `EUREKA_URL`
- `NOTIFICATION_SERVICE_URL`
- `USER_DATABASE_URL`
- `USER_DATABASE_USERNAME`
- `USER_DATABASE_PASSWORD`
- `MAIL_USERNAME`
- `MAIL_PASSWORD`

## Verify

Start Eureka and this server, then inspect:

```text
http://localhost:8099/event-service/default
http://localhost:8099/notification-service/default
http://localhost:8099/user-service/default
```

The JSON response must list the corresponding classpath property source.
