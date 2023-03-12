FROM python:3.10 

#Set Env Varibles
ENV PYTHONUNBUFFERED=1

#Create work dir inside Container
WORKDIR /app

# Copy files from current dir of host OS to Container workdir
COPY . /app

# Install python3 and dependencies,pipenv,and django
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev libpq-dev && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install django

# Make it executable
RUN chmod +x /app/entrypoint.sh

# runs the production server
EXPOSE 8000
ENTRYPOINT ["/app/entrypoint.sh"] 

