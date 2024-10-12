# Используем образ с JDK 21 для сборки приложения
FROM eclipse-temurin:21-jdk-alpine AS build

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файлы проекта в контейнер
COPY . .

# Выполняем команду сборки Maven, чтобы собрать JAR-файл
RUN ./mvnw clean package

# Используем минимальный JDK образ для запуска приложения
FROM eclipse-temurin:21-jdk-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем JAR-файл из предыдущего шага
COPY --from=build /app/target/*.jar app.jar

# Указываем порт
EXPOSE 8080

# Команда для запуска приложения
ENTRYPOINT ["java", "-jar", "app.jar"]
