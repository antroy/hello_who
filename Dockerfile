# syntax=docker/dockerfile:1
FROM python:3.8-alpine
WORKDIR /app
COPY src/main.py .
CMD python main.py
