FROM manimcommunity/manim:v0.19.0

# 1. Temporarily switch to root to install the system package
USER root

# Install the TeX Live Chinese language package using apt-get
# This command updates the package list, installs the package, and cleans up
RUN apt-get -qq update && \
    apt-get install --yes --no-install-recommends texlive-lang-chinese && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*

# Install the notebook package (can be done as root or the default user)
RUN pip install notebook

# 2. Switch back to the non-root user defined in the base image
ARG NB_USER=manimuser
USER ${NB_USER}

# Copy your repository content
COPY --chown=${NB_USER}:${NB_USER} . /manim
