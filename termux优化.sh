#!/data/data/com.termux/files/usr/bin/bash
echo "正在请求SD卡权限"
termux-setup-storage
echo "正在更换国内软件源"
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
echo "正在更新软件源"
apt update -y && apt upgrade -y
echo "正在安装zsh"
apt install -y git zsh
echo "正在克隆ohmyzsh"
git clone https://github.com/Cabbagec/termux-ohmyzsh.git "$HOME/termux-ohmyzsh" --depth 1
echo "正在备份原数据"
mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"
echo "正在克隆zsh主题"
git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"
echo "正在克隆zsh高亮工具"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
echo "正在安装常用工具"
pkg in python wget libxslt ffmpeg php file tracepath dnsutils zip unzip make cmake proot tree neofetch openssh -y
echo "常用工具安装完成！"
echo "正在给pip换源"
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
echo "换源完成！"
echo "正在安装常用 python 库"
pip install requests
python -m pip install --upgrade pip
pip install wheel
echo "python常用库安装完成！"
echo "正在设置 php.ini"
cp $(cd "$(dirname "$0")";pwd)/php.ini $PREFIX/lib/
echo "php.ini 设置完成！"

echo "正在修改默认 shell 为 zsh"
chsh -s zsh
echo "默认 shell 修改完成！"

echo "oh-my-zsh 安装完成！"
echo "请选择你喜欢的主题~"
$HOME/.termux/colors.sh

echo "请选择你喜欢的字体~"
$HOME/.termux/fonts.sh

echo "extra-keys = [['>','-',',','\"','.','/','*'],['ESC','(','HOME','UP','END',')','INS'],['CTRL','[','LEFT','DOWN','RIGHT',']','TAB']]]" >$HOME/.termux/termux.properties

echo "处理完成，请重启termux！"

exit