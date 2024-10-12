# Используем официальный образ OpenJDK для Java 17 (или другой версии, если требуется)
FROM openjdk:17-jdk-slim

# Указываем рабочую директорию
WORKDIR /app

# Копируем скомпилированный JAR файл в контейнер
COPY target/*.jar app.jar

# Открываем порт 8080 (порт по умолчанию для Spring Boot)
EXPOSE 8080

# Команда для запуска вашего Spring Boot приложения
ENTRYPOINT ["java", "-jar", "app.jar"]
