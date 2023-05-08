# Use a temporary build stage with a lightweight Alpine image that includes Git.
FROM alpine/git as git-stage
WORKDIR /src
RUN git clone https://github.com/Paul-Weaver/Digital-Resume-CSS.git .

# Use the official Python image for the build stage.
FROM python:3.9-slim as build-stage
WORKDIR /app
COPY --from=git-stage /src /app/static
COPY app.py /app

# Use a lightweight Alpine image for the final container.
FROM python:3.9-alpine
WORKDIR /app
COPY --from=build-stage /app/app.py /app/app.py
COPY --from=build-stage /app/static /app/static
EXPOSE 8080
CMD ["python", "app.py"]

