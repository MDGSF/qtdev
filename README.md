# qtdev

## devcontainer

使用前需要先把 `.devcontainer/.gitignore` 中的东西准备好。

- vscode 插件：Dev Containers
- <https://containers.dev/>
- <https://github.com/devcontainers/spec>
- <https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user>
- <https://medium.com/@jamiekt/vscode-devcontainer-with-zsh-oh-my-zsh-and-agnoster-theme-8adf884ad9f6>

**清除 none 镜像：**

```bash
docker images -a | grep none | awk '{ print $3; }' | xargs docker rmi --force
```

## 编译 qt

<https://wiki.qt.io/Building_Qt_5_from_Git>

```sh
cd /home/dev
git clone https://code.qt.io/qt/qt5.git
cd qt5
git checkout 5.12
git submodule update --init --recursive

cd /home/dev
mkdir qt5-build
cd qt5-build
export LLVM_INSTALL_DIR=/usr/lib/llvm-18
../qt5/configure -prefix /home/dev/Qt-5.12.0 -developer-build -opensource -nomake examples -nomake tests
make -j16
make install
```

## container 里面安装 qt 开发环境
