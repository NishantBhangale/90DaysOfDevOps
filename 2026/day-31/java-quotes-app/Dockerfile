FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY . .

RUN javac src/Main.java -d out

EXPOSE 8000

CMD ["java","-cp","out","Main"]
