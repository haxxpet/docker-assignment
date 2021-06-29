# Dockerfile for Containerteknik Assignment 1
# Michael Jarnling
# FLASK APP

# Base image
FROM alpine:3.14

# Copy the application source code
COPY flask-app/app.py /app/
# Copy the requirement list
COPY flask-app/requirements.txt /app/

# Update and install python & pip and then requirements
RUN apk update && apk add python3 py-pip && pip3 install --no-cache-dir -r /app/requirements.txt

# Expose the FLASK port
EXPOSE 5000

# Set env variable
ENV FLASK_APP=/app/app.py

# Set the entrypoint
#ENTRYPOINT ["python3"]

# Run the application
CMD flask run --host=0.0.0.0 --port=5000
