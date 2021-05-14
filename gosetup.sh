#!/data/data/com.termux/files/usr/bin/bash
echo "安装将会清除所有数据, 请确认已备份重要数据"
read -p "按下回车继续" _
echo "[*] 安装依赖"
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb http://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*games stable\)$@#\1\ndeb http://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
sed -i 's@^\(deb.*science stable\)$@#\1\ndeb http://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
apt update && apt upgrade
pkg install wget git -y
echo "[*] 下载文件"
rm -rf $PREFIX/tmp/flyos.tar.gz
wget --show-progress -q "https://xingyujie-my.sharepoint.com/:u:/g/personal/xingyujie_xingyujie_onmicrosoft_com/EfqCU1iWEBtBloitHDxCTKcBYiMJ9bEiDVeAzEi6wPLSVA?e=ZdnmMV&download=1" -O $PREFIX/tmp/flyos.tar.gz
rm -rf ~/.flyos
echo "[*] 解压文件"
cd $PREFIX/../
tar -zxvf $PREFIX/tmp/flyos.tar.gz --recursive-unlink --preserve-permissions
echo "[*] 更新系统"
cd $PREFIX/etc/flyos
git pull
pip install -r requirements.txt
echo "[+] 安装完成, 请重启termux"
