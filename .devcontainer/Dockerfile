FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

RUN set -x \
    && apt-get update -y \
    && apt-get install -y --reinstall ca-certificates

COPY apt/sources.list /etc/apt/
RUN apt-get update -y

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

# Used to persist bash history as per https://code.visualstudio.com/remote/advancedcontainers/persist-bash-history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && sudo mkdir /commandhistory \
    && sudo touch /commandhistory/.bash_history \
    && sudo chown -R $USERNAME /commandhistory \
    && echo "$SNIPPET" >> "/home/$USERNAME/.bashrc"

COPY vim/basic.vim /root/.vimrc
COPY vim/basic.vim /home/dev/.vimrc
COPY vim/.MyVim /home/dev/.MyVim

COPY scripts/setup.sh /home/dev/opt/bin/setup.sh
COPY scripts/setup_qt.sh /home/dev/opt/bin/setup_qt.sh

COPY ohmyzsh/.oh-my-zsh /home/dev/.oh-my-zsh
COPY ohmyzsh/.zshrc /home/dev/

COPY bazel/bazel-6.0.0-installer-linux-x86_64.sh /home/dev/opt/bin/bazel-6.0.0-installer-linux-x86_64.sh
COPY bazel/setup_bazel.sh /home/dev/opt/bin/setup_bazel.sh
COPY bazel/buildifier /home/dev/opt/bin/buildifier

COPY clang/llvm.list /home/dev/opt/bin/llvm.list
COPY clang/llvm-snapshot.gpg.key /home/dev/opt/bin/llvm-snapshot.gpg.key
COPY clang/setup_clang.sh /home/dev/opt/bin/setup_clang.sh

COPY language/rust/config /home/dev/.cargo/config
COPY language/rust/setup_rust.sh /home/dev/opt/bin/setup_rust.sh

COPY language/golang/go-1.21.3 /home/dev/opt/go

COPY language/javascript/nvm-0.39.5 /home/dev/.nvm
COPY language/javascript/setup_nvm.sh /home/dev/opt/bin/setup_nvm.sh

RUN sudo chown -R dev:dev /home/dev
RUN chmod a+x /home/dev/opt/bin/setup.sh && /home/dev/opt/bin/setup.sh
RUN chmod a+x /home/dev/opt/bin/setup_qt.sh && /home/dev/opt/bin/setup_qt.sh
RUN chmod a+x /home/dev/opt/bin/setup_clang.sh && /home/dev/opt/bin/setup_clang.sh
RUN chmod a+x /home/dev/opt/bin/setup_rust.sh && /home/dev/opt/bin/setup_rust.sh
RUN chmod a+x /home/dev/opt/bin/setup_nvm.sh && /home/dev/opt/bin/setup_nvm.sh
RUN chmod a+x /home/dev/opt/bin/bazel-6.0.0-installer-linux-x86_64.sh && chmod a+x /home/dev/opt/bin/setup_bazel.sh && /home/dev/opt/bin/setup_bazel.sh

CMD [ "zsh" ]
