# Use the latest Ubuntu base image
FROM ubuntu:latest

# Set the maintainer label
LABEL author=Kristina

# Copy the application files
COPY kris_kuz_bot.py ./
COPY run_bot.sh ./

# Update package lists and install Python, pip, and venv
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Create and activate a virtual environment, then install the package
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --no-cache-dir pytelegrambotapi

# Make sure the virtual environment is activated when running your script
ENV PATH="/opt/venv/bin:$PATH"

# Set the command to run the bot script
CMD ["bash", "run_bot.sh"]
