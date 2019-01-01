ARG base_image_tag
ARG login_user_arg="jmp"
ARG login_home_arg="/home/jmp"

FROM $base_image_tag

ENV login_home="$login_home_arg"
ENV login_user="$login_user_arg"

LABEL author="Carsten Nielsen <heycarsten@gmail.com>"
LABEL description="An image for a jump/utility server with Ruby, Python, Node.js, and other various utilities"

USER $login_user

# Copy credentials
COPY config/.ssh/authorized_keys \
     config/.ssh/config \
     $login_home_arg/.ssh/

COPY config/.aws/config \
     config/.aws/credentials \
     $login_home_arg/.aws/

USER root

# Update permissions
RUN chmod 700 $login_home/.ssh && \
    chmod 644 $login_home/.ssh/authorized_keys && \
    chmod 644 $login_home/.ssh/config && \
    chmod 700 $login_home/.aws && \
    chmod 644 $login_home/.aws/config && \
    chmod 644 $login_home/.aws/credentials

USER $login_user

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

USER    root
VOLUME  $login_home
EXPOSE  22
CMD     ["/usr/sbin/sshd", "-D"]
