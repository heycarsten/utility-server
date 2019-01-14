ARG base_image_tag
FROM $base_image_tag

LABEL author="Carsten Nielsen <heycarsten@gmail.com>"
LABEL description="An image for a jump/utility server with Ruby, Python, Node.js, and other various utilities"

ARG login_user="jmp"
ARG login_group="sudo"
ARG login_home="/home/jmp"
ARG login_volume="/home/jmp"

USER root

# Copy credentials
COPY \
  config/.ssh/authorized_keys \
  config/.ssh/config \
  $login_home/.ssh/

COPY \
  config/.aws/config \
  config/.aws/credentials \
  $login_home/.aws/

COPY config/.profile $login_home/.profile

RUN \
  # Update permissions
  chmod 700 $login_home/.ssh && \
  chmod 644 $login_home/.ssh/authorized_keys && \
  chmod 644 $login_home/.ssh/config && \
  chmod 700 $login_home/.aws && \
  chmod 644 $login_home/.aws/config && \
  chmod 644 $login_home/.aws/credentials && \
  # Reown login user home directory
  chown -R $login_user:$login_group $login_home/

USER $login_user:$login_group

RUN \
  # Install Ruby packages (via RubyGems)
  gem install --force \
    bundler \
    pry \
    awesome_print \
    sqlite3 \
    sequel && \
  # Install Python packages (via pip)
  pip install \
    ipython \
    ansible \
    awscli

USER   root
VOLUME $login_volume
CMD    ["-d", "-e"]
