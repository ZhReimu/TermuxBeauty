echo "正在解压 jdk"
tar -zxf $(cd "$(dirname "$0")";pwd)/jdk.tar.gz
echo "解压完成！"
echo "正在将 jdk 移动到 "$PREFIX"/share"
mv jdk $PREFIX/share/
echo "移动完成！"
echo "正在设置环境变量"
echo 'export JAVA_HOME="$PREFIX/share/jdk"'>>$HOME/.zshrc
echo 'export PATH="$PATH:$JAVA_HOME/bin"'>>$HOME/.zshrc
echo 'export LD_LIBRARY_PATH="$PREFIX/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/jli"'>>$HOME/.zshrc
echo "环境变量设置完成，请重启 termux 以完成操作！"
echo "正在测试 Java 是否正常安装"
java --version
