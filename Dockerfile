# Используйте официальный образ Java
FROM eclipse-temurin:21-jdk-alpine AS build

# Установите рабочую директорию
WORKDIR /app

# Скопируйте файлы проекта
COPY pom.xml .
COPY src ./src

# Соберите приложение
RUN ./mvnw clean package -DskipTests

# Используйте легковесный образ для запуска приложения
FROM eclipse-temurin:21-jdk-alpine

# Установите рабочую директорию
WORKDIR /app

# Скопируйте собранный JAR файл из предыдущего этапа
COPY --from=build /app/target/thymeleafBasic-0.0.1-SNAPSHOT.jar ./thymeleafBasic.jar

# Укажите команду для запуска приложения
ENTRYPOINT ["java", "-jar", "thymeleafBasic.jar"]

# Укажите порт, на котором будет запущено приложение
EXPOSE 8080
