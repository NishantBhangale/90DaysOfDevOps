FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY . /app

RUN javac src/Main.java

CMD ["java", "-cp", "src", "Main"]
