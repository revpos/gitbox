# Use a lightweight Ubuntu base image
FROM ubuntu:22.04

# Avoid user interaction prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Git and useful utilities
RUN apt-get update && apt-get install -y \
    git \
    bash \
    nano \
    vim \
    tree \
    && rm -rf /var/lib/apt/lists/*

# Set up the working directory for practice
WORKDIR /sand

# Pre-configure Git
RUN git config --global user.name "Git Learner" && \
    git config --global user.email "git.learner@example.com" && \
    git config --global init.defaultBranch main && \
    git config --global color.ui auto

# Configure custom bash prompt (PS1)
# Sets the display name to "gitbox" and parses the current git branch
# Backslashes are properly escaped (\\) so they survive the docker build process
# Using modern git --show-current to bypass Docker escaping nightmares entirely
RUN echo 'parse_git_branch() { b=$(git branch --show-current 2> /dev/null); [ -n "$b" ] && echo " ($b)"; }' >> ~/.bashrc && \
    echo 'export PS1="\[\033[01;32m\]\u@gitbox\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]\$(parse_git_branch)\[\033[00m\]\$ "' >> ~/.bashrc

# Start a bash shell by default when the container runs
CMD ["/bin/bash"]
