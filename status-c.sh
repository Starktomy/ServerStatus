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

run(){
      nohup python /status/client-linux.py SERVER=s.ievo.top USER=${username_s} PASSWORD=${password_s}
      


}

install(){
         Set_username
	 Set_password
	 directory
	 download
	 run
}

echo -e "${Info} install "
echo -e "1.install\n2.uninstall \n"
read -p "input:" function

while [[ ! "${function}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} error"
		echo -e "${Info} hahah" && read -p "input:" function
	done

if   [[ "${function}" == "1" ]]; then
	install
elif [[ "${function}" == "2" ]]; then
	uninstall
else
	echo "fuck"
fi
