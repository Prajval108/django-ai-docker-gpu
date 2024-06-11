FROM nvidia/cuda:12.3.1-runtime-ubuntu20.04

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive

# Add deadsnakes PPA, install dependencies, and clean up in one RUN command
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y build-essential libssl-dev libffi-dev python3.10 python3.10-dev python3.10-venv \
                       poppler-utils tesseract-ocr ffmpeg libsm6 libxext6 unixodbc-dev curl apt-utils \
                       libtesseract-dev libmariadb-dev python3-tk pkg-config swig wget unzip && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.10 get-pip.py && \
    rm -rf /var/lib/apt/lists/* /get-pip.py

# Copy and install Python dependencies
COPY requirements.txt .
RUN python3.10 -m pip install --no-cache-dir -r requirements.txt

# Set the working directory and copy project files
WORKDIR /app
COPY . /app

# Collect static files
RUN python3.10 manage.py collectstatic --no-input

# Set the command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:9071", "django_project.wsgi:application", "-t", "300"]
