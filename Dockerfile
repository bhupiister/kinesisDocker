# Use lightweight Python with Debian Bookworm
FROM python:3.9-slim-bookworm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3-venv \
    python3-pip \
    v4l-utils \
    ffmpeg \
    libavcodec-dev \
    libavformat-dev \
    libavdevice-dev \
    libavutil-dev \
    libavfilter-dev \
    libswscale-dev \
    libswresample-dev \
    pkg-config \
    gcc \
    g++ \
    make \
    cmake \
    cargo \
    rustc \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/aws-samples/python-samples-for-amazon-kinesis-video-streams-with-webrtc.git /app

# Create a virtual environment
RUN python3 -m venv .venv

# Copy the requirements file
COPY requirements.txt /app/requirements.txt

# Install dependencies inside the virtual environment
RUN /bin/bash -c "source .venv/bin/activate && pip install --upgrade pip setuptools wheel && pip install -r /app/requirements.txt"

# Set GStreamer environment variables (modify based on Debian paths)
ENV GST_PLUGIN_SCANNER=/usr/lib/x86_64-linux-gnu/gstreamer1.0/gst-plugin-scanner

# Run the application (Modify this based on your usage)
CMD ["/bin/bash"]