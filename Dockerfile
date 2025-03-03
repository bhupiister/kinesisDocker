# Use a lightweight Debian base image
FROM debian:bookworm-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-venv \
    python3-pip \
    v4l-utils \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/aws-samples/python-samples-for-amazon-kinesis-video-streams-with-webrtc.git /app

# Create a virtual environment
RUN python3 -m venv .venv

# Copy the requirements file
COPY requirements.txt /app/requirements.txt

# Activate virtual environment and install dependencies
RUN /bin/bash -c "source .venv/bin/activate && pip install --upgrade pip && pip install -r /app/requirements.txt"

# Set GStreamer environment variables
ENV GST_PLUGIN_SCANNER=/usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner

# Run the application (Modify this based on your usage)
CMD ["/bin/bash"]

