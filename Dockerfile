FROM alpine:latest

RUN apk add --no-cache \
    git \
    git-prompt \
    git-doc \
    mandoc \
    bash \
    bash-completion \
    nano \
    vim \
    tree \
    less

# Set up the working directory for practice
WORKDIR /workspace

# Pre-configure Git
RUN git config --global user.name "Git Learner" && \
    git config --global user.email "git.learner@example.com" && \
    git config --global init.defaultBranch main && \
    git config --global color.ui auto && \
    git config --global alias.st "status -sb" && \
    git config --global alias.lg "log --oneline --graph --decorate --all"

# Copy git-prompt to integrate within bash shell prompt
COPY git-prompt.sh /root/.git-prompt.sh

# Copy custom bashrc with git prompt into container
COPY bashrc /root/.bashrc

# Copy vimrc into container for better editor experience
COPY vimrc /root/.vimrc

# Start a bash shell by default when the container runs
CMD ["/bin/bash"]
