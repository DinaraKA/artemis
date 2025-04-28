## Based image
FROM python:3.13.3-alpine

## Copy from root folder to artemis folder inside docker image
COPY . /artemis

## Expose 5000 port
EXPOSE 5000

# Install system dependencies and upgrade vulnerable packages like sqlite
RUN apk update && \
    apk upgrade && \
    apk add --no-cache gcc musl-dev libffi-dev sqlite

## Install all packages
RUN pip install Flask

## Change dir
WORKDIR /artemis

## Run the application
CMD ["python"  "artemis.py"]
