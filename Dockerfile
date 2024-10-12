# Используйте официальный образ Java
FROM eclipse-temurin:21-jdk-alpine AS build

# Укажите рабочую директорию
WORKDIR /app

# Копируйте скомпилированный JAR файл в образ
COPY --from=build /app/target/thymeleafBasic-0.0.1-SNAPSHOT.jar ./thymeleafBasic.jar

# Укажите команду для запуска вашего приложения
ENTRYPOINT ["java", "-jar", "thymeleafBasic.jar"]

# Укажите порт, на котором будет запущено приложение
EXPOSE 8080