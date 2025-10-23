# Start from a suitable base image (e.g., a lightweight Python image)
FROM python:3.10-slim

# Install system dependencies via APT
# This includes texlive-lang-chinese and Manim's required system packages
RUN apt-get -qq update && \
    apt-get install --yes --no-install-recommends \
        # Core dependencies for Manim
        ffmpeg \
        pango-tools \
        # The TeX Live package you wanted
        texlive-lang-chinese \
        # Core TeX Live packages for Manim (often needed)
        texlive-latex-extra \
        texlive-fonts-extra \
        && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*

# Install Manim and any other Python packages via pip
RUN pip install --no-cache-dir manim

# Optionally, install other Python requirements from a file:
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Manim typically runs a command when finished, so set the entrypoint
# This depends on your final execution environment (Jupyter, terminal, etc.)
# If you are using a standard Jupyter stack, you might need to adjust this.
