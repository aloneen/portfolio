# Используем базовый образ JDK 21
FROM eclipse-temurin:21-jdk-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем скомпилированный JAR файл
COPY target/*.jar app.jar

# Открываем порт 8080 (порт по умолчанию для Spring Boot)
EXPOSE 8080

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "app.jar"]
