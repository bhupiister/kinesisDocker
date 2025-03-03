# Use Alpine as a lightweight base
FROM python:3.12-alpine

# Install system dependencies including FFmpeg libraries
RUN apk add --no-cache \
    git \
    bash \
    gcc \
    g++ \
    musl-dev \
    python3-dev \
    libffi-dev \
    openssl-dev \
    v4l-utils \
    ffmpeg \
    ffmpeg-dev \
    pkgconfig \
    opus-dev \
    libvpx-dev \
    libsrtp-dev

# Set up working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/aws-samples/python-samples-for-amazon-kinesis-video-streams-with-webrtc.git /app

# Copy the requirements file from your local directory
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["/bin/bash"]