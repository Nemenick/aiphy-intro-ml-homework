# Build the image using a Ubuntu base
FROM ubuntu

# Set up the variables
ARG USERNAME=aiphy
ARG USERID=1234
ARG USERHOME=/home/$USERNAME
ARG USERGROUP=$USERNAME
ARG USERSHELL=/bin/bash
SHELL [ "/bin/bash", "-c" ]

# Update and install needed packages
RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y apt-utils software-properties-common git

# Add the Python repository and install needed packages
RUN add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-venv python3.10-dev graphviz

# Create the user
RUN groupadd --gid $USERID $USERGROUP
RUN useradd --uid $USERID \
    --home $USERHOME \
    --gid $USERGROUP \
    --shell $USERSHELL \
    $USERNAME
RUN mkdir -p $USERHOME

# Clone the aiphy repository
WORKDIR $USERHOME
RUN git clone https://github.com/thesfinox/aiphy-intro-ml-homework.git

# Create the virtual environment
RUN chown -R $USERNAME:$USERGROUP $USERHOME
WORKDIR $USERHOME/aiphy-intro-ml-homework
USER $USERNAME
RUN python3.10 -m venv .venv && \
    source .venv/bin/activate && \
    python3.10 -m ensurepip --upgrade && \
    python3.10 -m pip install --upgrade pip && \
    python3.10 -m pip install -r requirements.txt

# Run the notebook
CMD source .venv/bin/activate && \
    jupyter lab --ip 0.0.0.0 --port 8888 --no-browser
