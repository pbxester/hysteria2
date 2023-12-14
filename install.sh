#!/bin/bash

#中国共产党万岁，中华人民共和国万岁，为人民崛起而读书

# 下面这串是关于文字颜色的，可以自己改数字😇

#好的脚本，就是要有好的注释和简介的代码💩

# 检测当前用户是否为 root 用户
if [ "$EUID" -ne 0 ]; then
  echo "请使用 root 用户执行此脚本！"
  echo "你可以使用 'sudo -i' 进入 root 用户模式。"
  exit 1
fi

commands=("wget" "sed" "openssl" "net-tools" "psmisc" "procps" "iptables")
package_manager=""
install_command=""

#安装一些东西
if [ -x "$(command -v apt)" ]; then
  package_manager="apt"
  install_command="sudo apt install -y"
elif [ -x "$(command -v yum)" ]; then
  package_manager="yum"
  install_command="sudo yum install -y"
else
  echo "Unsupported package manager."
  exit 1
fi

install_missing_commands() {
  for cmd in "${commands[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
      echo "Installing $cmd..."
      sudo $install_command "$cmd"
      if [ $? -eq 0 ]; then
        echo "$cmd installed successfully."
      else
        echo "Failed to install $cmd."
      fi
    else
      echo "$cmd is already installed."
    fi
  done
}

install_missing_commands

set_architecture() {
  case "$(uname -m)" in
    'i386' | 'i686')
     
      arch='386'
      ;;
    'amd64' | 'x86_64')
    
      arch='amd64'
      ;;
    'armv5tel' | 'armv6l' | 'armv7' | 'armv7l')
      
      arch='arm'
      ;;
    'armv8' | 'aarch64')
   
      arch='arm64'
      ;;
    'mips' | 'mipsle' | 'mips64' | 'mips64le')
      
      arch='mipsle'
      ;;
    's390x')
      
      arch='s390x'
      ;;
    *)

      echo "暂时不支持你的系统哦，可能是因为不在已知架构范围内。"
      exit 1
      ;;
  esac
}

set_architecture

random_color() {
  colors=("31" "32" "33" "34" "35" "36" "37")
  echo -e "\e[${colors[$((RANDOM % 7))]}m$1\e[0m"
}

#这个没啥用，就是让用户白等5s看动画的💩

line_animation() {
  lines=0
  while [ $lines -lt 8 ]; do
    echo -e "$(random_color '********************************************************************************')"
    sleep 0.375  # Sleep for 0.375 seconds each time (3 seconds total time / 8 lines)
    lines=$((lines + 1))
  done
}

pid=$(pgrep -f "hysteria-linux-$arch")

if [ -n "$pid" ]; then
  hy2zt="运行中"
else
  hy2zt="未运行"
fi

#这个y也是给用户看动画的

welcome() {
  clear

echo -e "$(random_color '
░██  ░██                                                              
░██  ░██       ░████        ░█         ░█        ░█░█░█  
░██  ░██     ░█      █      ░█         ░█        ░█    ░█ 
░██████     ░██████         ░█         ░█        ░█    ░█ 
░██  ░██     ░█             ░█ ░█      ░█  ░█     ░█░█░█ 
░██  ░██      ░██  █         ░█         ░█                   ')"
 echo -e "$(random_color '
人生有两出悲剧：一是万念俱灰，另一是踌躇满志 ')"
 
}
#这个welcome就是启动上面的对话😇
welcome
 
# Prompt user to select an action
#这些就行提示你输入的😇
echo "$(random_color '选择一个操作，小崽子(ง ื▿ ื)ว：')"
echo "1. 安装(以梦为马)"
echo "2. 卸载(以心为疆)"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "3. 查看配置(穿越时空)"
echo "4. 退出脚本(回到未来)"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "5. 在线更新hy2内核(目前版本2.2.2)"
echo "$(random_color 'hy2究极版本v23.12.12')"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "hysteria2状态: $hy2zt"

read -p "输入操作编号 (1/2/3/4/5): " choice

case $choice in
   1)
     #啥也没有
     ;;

   2)

sudo systemctl stop hysteria.service

sudo systemctl disable hysteria.service

if [ -f "/etc/systemd/system/hysteria.service" ]; then
  sudo rm "/etc/systemd/system/hysteria.service"
  echo "Hysteria 服务器服务文件已删除。"
else
  echo "Hysteria 服务器服务文件不存在。"
fi

process_name="hysteria-linux-$arch"
pid=$(pgrep -f "$process_name")

if [ -n "$pid" ]; then
  echo "找到 $process_name 进程 (PID: $pid)，正在杀死..."
  kill "$pid"
  echo "$process_name 进程已被杀死。"
else
  echo "未找到 $process_name 进程。"
fi

if [ -f "/root/hy3/hysteria-linux-$arch" ]; then
  rm -f "/root/hy3/hysteria-linux-$arch"
  echo "Hysteria 服务器二进制文件已删除。"
else
  echo "Hysteria 服务器二进制文件不存在。"
fi

if [ -f "/root/hy3/config.yaml" ]; then
  rm -f "/root/hy3/config.yaml"
  echo "Hysteria 服务器配置文件已删除。"
else
  echo "Hysteria 服务器配置文件不存在。"
fi
rm -r /root/hy3
systemctl stop ipppp.service
systemctl disable ipppp.service
rm /etc/systemd/system/ipppp.service
iptables -F
echo "卸载完成(ง ื▿ ื)ว."

# 退出脚本
exit
     ;;

   4)
     # Exit script
     exit
     ;;
   3)
echo "$(random_color '下面是你的nekobox节点信息')" 
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"   
cd /root/hy3/

cat /root/hy3/neko.txt

echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "$(random_color '下面是你的clashmate配置')"

cat /root/hy3/clash-mate.yaml

echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
    exit
    ;;
    
   5)
   
process_name="hysteria-linux-$arch"

pid=$(pgrep -f "$process_name")

if [ -n "$pid" ]; then
  echo "找到 $process_name 进程 (PID: $pid)，正在杀死..."
  kill "$pid"
  echo "$process_name 进程已被杀死。"
else
  echo "未找到 $process_name 进程。"
fi   

cd /root/hy3

rm -r hysteria-linux-$arch

wget -O hysteria-linux-$arch https://github.com/apernet/hysteria/releases/download/app/v2.2.2/hysteria-linux-$arch

chmod +x hysteria-linux-$arch

nohup ./hysteria-linux-$arch server &

echo "更新完成,不是哥们,你有什么实力,你直接给我坐下(ง ื▿ ื)ว."
    exit
    ;;
   *)
     echo "$(random_color '无效的选择，退出脚本。')"
     exit
     ;;
esac

line_animation

cd /root
mkdir -p ~/hy3
cd ~/hy3


if wget -O hysteria-linux-$arch https://github.com/apernet/hysteria/releases/download/app/v2.2.2/hysteria-linux-$arch; then
  chmod +x hysteria-linux-$arch
else
  echo "$(random_color '下载 Hysteria 二进制文件失败，退出脚本。')"
  exit 1
fi

current_user=$(whoami)

# 就是写一个配置文件，你可以自己修改，别乱搞就行，安装hysteria2文档修改
cat <<EOL > config.yaml
listen: :443

auth:
  type: password
  password: Se7RAuFZ8Lzg

masquerade:
  type: proxy
  file:
    dir: /www/masq 
  proxy:
    url: https://news.ycombinator.com/
    rewriteHost: true 
  string:
    content: hello stupid world 
    headers: 
      content-type: text/plain
      custom-stuff: ice cream so good
    statusCode: 200 

bandwidth:
  up: 99 gbps
  down: 99 gbps

udpIdleTimeout: 90s

ignoreClientBandwidth: false

quic:
  initStreamReceiveWindow: 8388608 
  maxStreamReceiveWindow: 8388608 
  initConnReceiveWindow: 20971520 
  maxConnReceiveWindow: 20971520 
  maxIdleTimeout: 90s 
  maxIncomingStreams: 1800 
  disablePathMTUDiscovery: false 
EOL

while true; do 
    echo "$(random_color '请输入端口号（留空默认443，输入0随机2000-60000，你可以输入1-65630指定端口号）: ')" 
    read -p "" port 
  
    if [ -z "$port" ]; then 
      port=443 
    elif [ "$port" -eq 0 ]; then 
      port=$((RANDOM % 58001 + 2000)) 
    elif ! [[ "$port" =~ ^[0-9]+$ ]]; then 
      echo "$(random_color '我的动物朋友，请输入数字好吧，请重新输入端口号：')" 
      continue 
    fi 
  
    while netstat -tuln | grep -q ":$port "; do 
      echo "$(random_color '端口已被占用，请重新输入端口号：')" 
      read -p "" port 
    done 
  
    if sed -i "s/443/$port/" config.yaml; then 
      echo "$(random_color '端口号已设置为：')" "$port" 
    else 
      echo "$(random_color '替换端口号失败，退出脚本。')" 
      exit 1 
    fi 
  
   
    echo "$(random_color '是否要开启端口跳跃功能？如果你不知道是干啥的，就衮吧，不用开启(ง ื▿ ื)ว，请使用最新版nekobox（回车默认不开启，输入1开启）: ')" 
    read -p "" port_jump 
  
    if [ -z "$port_jump" ]; then 
      
      break 
    elif [ "$port_jump" -eq 1 ]; then 
    
      echo "$(random_color '请输入起始端口号(起始端口必须小于末尾端口): ')" 
      read -p "" start_port 
  
      echo "$(random_color '请输入末尾端口号(末尾端口必须大于起始端口): ')" 
      read -p "" end_port 
  
      if [ "$start_port" -lt "$end_port" ]; then 
        
        iptables -t nat -A PREROUTING -i eth0 -p udp --dport "$start_port:$end_port" -j DNAT --to-destination :"$port" 
        echo "$(random_color '端口跳跃功能已开启，将范围重定向到主端口：')" "$port" 
        break 
      else 
        echo "$(random_color '末尾端口必须大于起始端口，请重新输入。')" 
      fi 
    else 
      echo "$(random_color '输入无效，请输入1开启端口跳跃功能，或直接按回车跳过。')" 
    fi 
done 


if [ -n "$port_jump" ] && [ "$port_jump" -eq 1 ]; then
  echo "#!/bin/bash" > /root/hy3/ipppp.sh 
  echo "iptables -t nat -A PREROUTING -i eth0 -p udp --dport $start_port:$end_port -j DNAT --to-destination :$port" >> /root/hy3/ipppp.sh 
  
 
  chmod +x /root/hy3/ipppp.sh 
  
  echo "[Unit]" > /etc/systemd/system/ipppp.service 
  echo "Description=IP Port Redirect" >> /etc/systemd/system/ipppp.service 
  echo "" >> /etc/systemd/system/ipppp.service 
  echo "[Service]" >> /etc/systemd/system/ipppp.service 
  echo "ExecStart=/root/hy3/ipppp.sh" >> /etc/systemd/system/ipppp.service 
  echo "" >> /etc/systemd/system/ipppp.service 
  echo "[Install]" >> /etc/systemd/system/ipppp.service 
  echo "WantedBy=multi-user.target" >> /etc/systemd/system/ipppp.service 
  
  # 启用开机自启动服务 
  systemctl enable ipppp.service 
  
  # 启动服务 
  systemctl start ipppp.service 
  
  echo "$(random_color '已创建/ipppp.sh脚本文件并设置开机自启动。')"
fi

echo "$(random_color '请选择内核加速类型：')"
echo "$(random_color '1. 默认系统内核加速')"
echo "$(random_color '2. Brutal加速')"
read -p "$(random_color '请输入选项（1/2，推荐系统内核加速）: ')" kernel_choice

if [ -z "$kernel_choice" ]; then
  kernel_choice=2
fi

if [ "$kernel_choice" == "1" ]; then
  sed -i 's/ignoreClientBandwidth: false/ignoreClientBandwidth: true/' config.yaml
  echo "$(random_color '已启用默认系统内核加速')"
elif [ "$kernel_choice" == "2" ]; then
  echo "$(random_color '已启用Brutal加速')"
else
  echo "$(random_color '错误的选项，请重新运行脚本并选择正确的内核加速类型。')"
  exit 1
fi

generate_certificate() {
    read -p "请输入要用于自签名证书的域名（默认为 bing.com）: " user_domain
    domain_name=${user_domain:-"bing.com"}
    if curl --output /dev/null --silent --head --fail "$domain_name"; then
        openssl req -x509 -nodes -newkey ec:<(openssl ecparam -name prime256v1) -keyout "/etc/ssl/private/$domain_name.key" -out "/etc/ssl/private/$domain_name.crt" -subj "/CN=$domain_name" -days 36500
        chmod 600 "/etc/ssl/private/$domain_name.key" "/etc/ssl/private/$domain_name.crt"
        echo -e "自签名证书和私钥已生成！"
    else
        echo -e "无效的域名或域名不可用，请输入有效的域名！"
        generate_certificate
    fi
}

read -p "请选择证书类型（输入 1 使用ACME证书，输入 2 使用自签名证书）: " cert_choice

if [ "$cert_choice" == "2" ]; then
    generate_certificate

    certificate_path="/etc/ssl/private/$domain_name.crt"
    private_key_path="/etc/ssl/private/$domain_name.key"

    echo -e "证书文件已保存到 /etc/ssl/private/$domain_name.crt"
    echo -e "私钥文件已保存到 /etc/ssl/private/$domain_name.key"

    temp_file=$(mktemp)
    echo -e "temp_file: $temp_file"
    sed '3i\tls:\n  cert: '"/etc/ssl/private/$domain_name.crt"'\n  key: '"/etc/ssl/private/$domain_name.key"'' /root/hy3/config.yaml > "$temp_file"
    mv "$temp_file" /root/hy3/config.yaml
    touch /root/hy3/ca
   #这里加了一个小的变量
    ovokk="insecure=1&"
    choice1="true"
    echo -e "已将证书和密钥信息写入 /root/hy3/config.yaml 文件。"
    
ip4_opts="-4 addr show scope global"
ip6_opts="-6 addr show scope global"

ipv4_regex='\d+(\.\d+){3}'
ipv6_regex='[0-9a-f:]+(:[0-9a-f]+){2,}'

check_ip() {
    ip_address=$(ip $1 | grep -oP "(?<=inet$2\s)$3")
    ip_exists=$?
    if [ $ip_exists -eq 0 ]; then
        echo "$ip_address"
    else
        echo "无法获取IP地址"
    fi
}

echo "请选择IP类型："
echo "1. IPv4 模式"
echo "2. IPv6 模式(纯ipv6首选,我也不知道老登你的ipv6能不能用)"
echo "3. 回车默认为IPv4 模式"

read -p "请输入选项编号: " choice

if [ -z "$choice" ]; then 
    choice=3
fi

case $choice in
    1)

        ipdz=$(check_ip $ip4_opts "" $ipv4_regex)
        echo "老登,你的IP地址为IPv4: $ipdz"
        ;;
    2)
   
        ipdz=$(check_ip $ip6_opts "6" $ipv6_regex)
        echo "老登,你的IP地址为IPv6: [$ipdz]"
        ;;
    3)
      
        ipdz=$(check_ip $ip4_opts "" $ipv4_regex)
        echo "老登,你的IP地址为IPv4: $ipdz"
        ;;
    *)
    
        ipdz=$(check_ip $ip4_opts "" $ipv4_regex)
        echo "错误的选项，已经默认为IPv4模式"
        echo "老登,你的IP地址为IPv4: $ipdz"
        ;;
esac

fi

if [ -f "/root/hy3/ca" ]; then
  echo "$(random_color '/root/hy3/ 文件夹中已存在名为 ca 的文件。跳过添加操作。')"
else

  echo "$(random_color '请输入你的域名（必须是解析好的域名哦）: ')"
  read -p "" domain

  while [ -z "$domain" ]; do
    echo "$(random_color '域名不能为空，请重新输入: ')"
    read -p "" domain
  done


  echo "$(random_color '请输入你的邮箱（默认随机邮箱）: ')"
  read -p "" email

  if [ -z "$email" ]; then

    random_part=$(head /dev/urandom | LC_ALL=C tr -dc A-Za-z0-9 | head -c 4 ; echo '')

    email="${random_part}@gmail.com"
  fi

  yaml_content="acme:\n  domains:\n    - $domain\n  email: $email"

  if [ -f "config.yaml" ]; then
    echo -e "\nAppending to config.yaml..."
    echo -e $yaml_content >> config.yaml
    echo "$(random_color '域名和邮箱已添加到 config.yaml 文件。')"
    choice2="false"
  else
    echo "$(random_color 'config.yaml 文件不存在，无法添加。')"
    exit 1
  fi
fi

echo "$(random_color '请输入你的密码（留空将生成随机密码，不超过20个字符）: ')"
read -p "" password

if [ -z "$password" ]; then
  password=$(openssl rand -base64 20 | tr -dc 'a-zA-Z0-9')
fi

if sed -i "s/Se7RAuFZ8Lzg/$password/" config.yaml; then
  echo "$(random_color '密码已设置为：')" $password
else
  echo "$(random_color '替换密码失败，退出脚本。')"
  exit 1
fi

echo "$(random_color '请输入伪装网址（默认https://news.ycombinator.com/）: ')"
read -p "" masquerade_url

if [ -z "$masquerade_url" ]; then
  masquerade_url="https://news.ycombinator.com/"
fi

if sed -i "s|https://news.ycombinator.com/|$masquerade_url|" config.yaml; then
  echo "$(random_color '伪装域名已设置为：')" $masquerade_url
else
  echo "$(random_color '替换伪装域名失败，退出脚本。')"
  exit 1
fi

fuser -k -n tcp $port
fuser -k -n udp $port

if sudo setcap cap_net_bind_service=+ep hysteria-linux-$arch; then
  echo "$(random_color '授予权限成功。')"
else
  echo "$(random_color '授予权限失败，退出脚本。')"
  exit 1
fi

#优化一些系统参数
sysctl -w net.core.rmem_max=16777216
sysctl -w net.core.wmem_max=16777216

cat <<EOL > clash-mate.yaml
system-port: 7890
external-controller: 127.0.0.1:9090
allow-lan: false
mode: rule
log-level: info
ipv6: true
unified-delay: true
profile:
  store-selected: true
  store-fake-ip: true
tun:
  enable: true
  stack: system
  auto-route: true
  auto-detect-interface: true
dns:
  enable: true
  prefer-h3: true
  listen: 0.0.0.0:53
  enhanced-mode: fake-ip
  nameserver:
    - 114.114.114.114
    - 8.8.8.8
proxies:
  - name: Hysteria2
    type: hysteria2
    server: $domain$ipdz
    port: $port
    password: $password
    sni: $domain$domain_name
    skip-cert-verify: $choice1$choice2
proxy-groups:
  - name: auto
    type: select
    proxies:
      - Hysteria2
rules:
  - MATCH,auto
EOL
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "clash-mate.yaml 已保存到当前文件夹"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
# Running the Hysteria server in the background
if nohup ./hysteria-linux-$arch server & then
  echo "$(random_color 'Hysteria 服务器已启动。')"
else
  echo "$(random_color '启动 Hysteria 服务器失败，退出脚本。')"
  exit 1
fi
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
hysteria_directory="/root/hy3/"
hysteria_executable="/root/hy3/hysteria-linux-$arch"
hysteria_service_file="/etc/systemd/system/hysteria.service"

create_and_configure_service() {
  if [ -e "$hysteria_directory" ] && [ -e "$hysteria_executable" ]; then
    cat > "$hysteria_service_file" <<EOF
[Unit]
Description=My Hysteria Server

[Service]
Type=simple
WorkingDirectory=$hysteria_directory
ExecStart=$hysteria_executable server
Restart=always

[Install]
WantedBy=multi-user.target
EOF
    echo "Hysteria服务器服务文件已创建和配置."
  else
    echo "Hysteria目录或可执行文件不存在，请检查路径."
    exit 1
  fi
}

enable_and_start_service() {
  if [ -f "$hysteria_service_file" ]; then
    systemctl enable hysteria.service
    systemctl start hysteria.service
    echo "Hysteria服务器服务已启用自启动并成功启动."
  else
    echo "Hysteria服务文件不存在，请先创建并配置服务文件."
    exit 1
  fi
}

create_and_configure_service
enable_and_start_service

echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "完成。"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
line_animation
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"
echo "$(random_color '>>>>>>>>>>>>>>>>>>>>')"

if [ -n "$start_port" ] && [ -n "$end_port" ]; then

  echo -e "$(random_color '这是你的Hysteria2节点链接信息，请注意保存哦joker(老登，请使用最新版的neko哦): ')\nhysteria2://$password@$ipdz$domain:$port/?${ovokk}mport=$port,$start_port-$end_port&sni=$domain$domain_name#Hysteria2"
  
  echo "hysteria2://$password@$ipdz$domain:$port/?${ovokk}mport=$port,$start_port-$end_port&sni=$domain$domain_name#Hysteria2" > neko.txt
  
else

  echo -e "$(random_color '这是你的Hysteria2节点链接信息，请注意保存哦小崽子: ')\nhysteria2://$password@$ipdz$domain:$port/?${ovokk}sni=$domain$domain_name#Hysteria2"
  
  echo "hysteria2://$password@$ipdz$domain:$port/?${ovokk}sni=$domain$domain_name#Hysteria2" > neko.txt
  
fi

echo -e "$(random_color '

Hysteria2安装成功，请合理使用哦,你直直-——直直接给我坐下')"

echo "而你，我的朋友，你是恋爱脑里的常青树，Joker里的顶梁柱，麦当劳的吉祥物，哥谭市的大头目，扑克牌的最大数，蝙蝠侠的大客户……"
