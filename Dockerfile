# Use a lightweight Ubuntu base image
FROM ubuntu:22.04

# Avoid user interaction prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Git and useful utilities
RUN apt-get update && apt-get install -y \
    git \
    bash \
    bash-completion \
    nano \
    vim \
    tree \
    less \
    && rm -rf /var/lib/apt/lists/*

# Set up the working directory for practice
WORKDIR /workspace

# Pre-configure Git
RUN git config --global user.name "Git Learner" && \
    git config --global user.email "git.learner@example.com" && \
    git config --global init.defaultBranch main && \
    git config --global color.ui auto

# Copy custom bashrc with git prompt into container
COPY bashrc /root/.bashrc

# Copy vimrc into container for better editor experience
COPY vimrc /root/.vimrc

# Start a bash shell by default when the container runs
CMD ["/bin/bash"]
