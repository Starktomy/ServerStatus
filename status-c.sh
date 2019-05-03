#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
directory(){
            mkdir -p /status
            cd /status
}

Set_username(){
	
	echo -e "请输入 ServerStatus 服务端中对应配置的用户名[username]（字母/数字，不可与其他账号重复）"
	read -e -p "(默认: 取消):" username_s
	[[ -z "$username_s" ]] && echo "已取消..." && exit 0
	echo && echo "	================================================"
	echo -e "	账号[username]: ${Red_background_prefix} ${username_s} ${Font_color_suffix}"
	echo "	================================================" && echo
}
Set_password(){
	
		echo -e "请输入 ServerStatus 服务端中对应配置的密码[password]（字母/数字）"
	read -e -p "(默认: doub.io):" password_s
	[[ -z "$password_s" ]] && password_s="doub.io"
	echo && echo "	================================================"
	echo -e "	密码[password]: ${Red_background_prefix} ${password_s} ${Font_color_suffix}"
	echo "	================================================" && echo
}

download(){
       wget --no-check-certificate -qO client-linux.py 'https://raw.githubusercontent.com/tykgood6/ServerStatus/master/clients/client-linux.py'
       chmod 777 client-linux.py

}

install(){
         Set_username
	 Set_password
	 
}

echo -e "${Info} install "
echo -e "1.install\n2. rinetd-bbr 杩愯鐘舵€乗n3.鍗歌浇 rinetd-bbr"
read -p "input:" function

while [[ ! "${function}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 鏃犳晥杈撳叆"
		echo -e "${Info} 璇烽噸鏂伴€夋嫨" && read -p "杈撳叆鏁板瓧浠ラ€夋嫨:" function
	done

if   [[ "${function}" == "1" ]]; then
	install
elif [[ "${function}" == "2" ]]; then
	status
else
	uninstall
fi
