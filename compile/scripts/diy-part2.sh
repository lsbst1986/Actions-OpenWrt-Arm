#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.88.3/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/Arm/g' package/base-files/files/bin/config_generate

# Fix R2C Patch
# wget -P target/linux/rockchip/patches-5.15 https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/patchs/18.06/target/linux/rockchip/patches-5.15/090-v6.3-net-phy-motorcomm-add-LED-configuration-for-yt8521-yt8531.patch
# wget -P target/linux/rockchip/patches-6.1 https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/patchs/18.06/target/linux/rockchip/patches-6.1/090-v6.3-net-phy-motorcomm-add-LED-configuration-for-yt8521-yt8531.patch

# FIX SUNXI SD ERROR
#rm -rf package/boot/uboot-sunxi/patches/261-sunxi-add-popstick-defconfig.patch

# DIY Information
sed -i 's/os.date()/os.date("%Y-%m-%d %a %H:%M:%S")/g' package/lean/autocore/files/arm/index.htm
sed -i 's/os.date()/os.date("%Y-%m-%d %a %H:%M:%S")/g' package/lean/autocore/files/x86/index.htm
#sed -i "s/OpenWrt /OpenWrt $(TZ=UTC-8 date "+%Y.%m.%d") \//g" package/lean/default-settings/files/zzz-default-settings
#sed -i "/config/a\sed -i 's\/openwrt.org\/baidu.com\/g' \/etc\/config\/luci" package/lean/default-settings/files/zzz-default-settings
wget -P files/etc/init.d https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/diy_init.d/diy_static_ip

# add files
# Fix luci-app-adbyby-plus
# wget -P files/etc/init.d https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adbyby-plus/adbyby
# wget -P files/usr/share/adbyby https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adbyby-plus/ad-update
# wget -P files/usr/share/adbyby https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adbyby-plus/adblock.sh
#sed -i "/uclient/a\uclient-fetch --no-check-certificate -O - 'https:\/\/anti-ad.net\/anti-ad-for-dnsmasq.conf' \> \/usr\/share\/adbyby\/rules\/data\/anti-ad-for-dnsmasq.conf" feeds/luci/applications/luci-app-adbyby-plus/root/usr/share/adbyby/adblock.sh
#sed -i "/dnsmasq/a\\#uclient-fetch --no-check-certificate -O - 'https:\/\/neodev.team\/lite_dnsmasq.conf' \> \/usr\/share\/adbyby\/rules\/data\/lite_dnsmasq.conf" feeds/luci/applications/luci-app-adbyby-plus/root/usr/share/adbyby/adblock.sh
#sed -i "/neodev/a\\/usr\/share\/adbyby\/diyruleupdate.sh" feeds/luci/applications/luci-app-adbyby-plus/root/usr/share/adbyby/adblock.sh
#sed -i "/diyruleupdate/a\ " feeds/luci/applications/luci-app-adbyby-plus/root/usr/share/adbyby/adblock.sh
#wget -P files/usr/share/adbyby https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adbyby-plus/diyruleupdate.sh
# Add adbyby-plus rules
#wget -P files/usr/share/adbyby https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adbyby-plus/dnsmasq.adblock
#wget -P files/usr/share/adbyby/data https://cdn.jsdelivr.net/gh/kongfl888/ad-rules/lazy.txt
#wget -P files/usr/share/adbyby/data https://cdn.jsdelivr.net/gh/kongfl888/ad-rules/video.txt

# Fix luci-app-adguardhome
#wget -P files/etc/init.d https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adguardhome/adguardhome
#wget -P files/etc/init.d https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adguardhome/init.d/AdGuardHome
#wget -P files/usr/bin https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adguardhome/core/AdGuardHome
#wget -P files/etc/config https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-adguardhome/AdGuardHome.yaml
# Add adguardhome rules
#wget -P files/etc/AdGuardHome/data/filters/ https://anti-ad.net/easylist.txt
#rm -rf files/etc/AdGuardHome/data/filters/easylist.txt
#wget -O files/etc/AdGuardHome/data/filters/1.txt https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
#wget -O files/etc/AdGuardHome/data/filters/2.txt https://cdn.jsdelivr.net/gh/banbendalao/ADgk@master/ADgk.txt
#wget -O files/etc/AdGuardHome/data/filters/3.txt https://anti-ad.net/easylist.txt
#wget -O files/etc/AdGuardHome/data/filters/4.txt https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad.txt
#wget -O files/etc/AdGuardHome/data/filters/5.txt https://easylist-downloads.adblockplus.org/easyprivacy.txt
#wget -O files/etc/AdGuardHome/data/filters/6.txt https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt
#wget -O files/etc/AdGuardHome/data/filters/7.txt https://adguardteam.github.io/HostlistsRegistry/assets/filter_29.txt
#wget -O files/etc/AdGuardHome/data/filters/8.txt https://github.com/Gabrielxzx/Gabrielxzx-luci/releases/download/Stable_Files/miTVhosts
#wget -O files/etc/AdGuardHome/data/filters/9.txt https://github.com/Gabrielxzx/Gabrielxzx-luci/releases/download/Stable_Files/allow-domains-list.txt

# Fix luci-app-openclash
#wget -P files/etc/openclash/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-openclash/core/clash
#wget -P files/etc/openclash/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-openclash/core/clash_meta
#wget -P files/etc/openclash/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-openclash/core/clash_tun

# Fix luci-app-passwall
sed -i '$a\ ' feeds/passwall/luci-app-passwall/root/usr/share/passwall/rules/direct_host
sed -i '$a\#DIY' feeds/passwall/luci-app-passwall/root/usr/share/passwall/rules/direct_host
sed -i '$a\cn.bing.com' feeds/passwall/luci-app-passwall/root/usr/share/passwall/rules/direct_host
sed -i '$a\bing.com' feeds/passwall/luci-app-passwall/root/usr/share/passwall/rules/direct_host
sed -i "/官网/a\	list filter_discard_list '重置'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/官网/a\	list filter_discard_list '电报'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/官网/a\	list filter_discard_list '订阅'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/官网/a\	list filter_discard_list '回国'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/官网/a\	list filter_discard_list '防失联地址'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/IPOnDemand/a\	option port '1081'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/IPOnDemand/a\	option address '127.0.0.1'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/IPOnDemand/a\	option type 'Socks'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/IPOnDemand/a\	option remarks '自动切换'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/IPOnDemand/a\config nodes 'myshunt2'" feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i "/IPOnDemand/a\ " feeds/passwall/luci-app-passwall/root/usr/share/passwall/0_default_config
# wget -P files/usr/bin https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-passwall/core/trojan-go

# Fix luci-app-passwall2
#sed -i "/官网/a\	list filter_discard_list '重置'" feeds/passwall2/luci-app-passwall2/root/usr/share/passwall2/0_default_config
#sed -i "/官网/a\	list filter_discard_list '电报'" feeds/passwall2/luci-app-passwall2/root/usr/share/passwall2/0_default_config
#sed -i "/官网/a\	list filter_discard_list '订阅'" feeds/passwall2/luci-app-passwall2/root/usr/share/passwall2/0_default_config
#sed -i "/官网/a\	list filter_discard_list '回国'" feeds/passwall2/luci-app-passwall2/root/usr/share/passwall2/0_default_config
#sed -i "/官网/a\	list filter_discard_list '防失联地址'" feeds/passwall2/luci-app-passwall2/root/usr/share/passwall2/0_default_config

# Fix luci-app-ssr-plus
sed -i '$a\ ' feeds/helloworld/luci-app-ssr-plus/root/etc/ssrplus/white.list
sed -i '$a\cn.bing.com' feeds/helloworld/luci-app-ssr-plus/root/etc/ssrplus/white.list
sed -i '$a\bing.com' feeds/helloworld/luci-app-ssr-plus/root/etc/ssrplus/white.list
sed -i "s/回国/回国\/订阅\/电报\/重置/g" feeds/helloworld/luci-app-ssr-plus/root/etc/init.d/shadowsocksr

# Fix luci-app-unblockneteasemusic
#wget -P files/usr/share/unblockneteasemusic/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-unblockneteasemusic/core/app.js
#wget -P files/usr/share/unblockneteasemusic/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-unblockneteasemusic/core/bridge.js
#wget -P files/usr/share/unblockneteasemusic/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-unblockneteasemusic/core/ca.crt
#wget -P files/usr/share/unblockneteasemusic/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-unblockneteasemusic/core/server.crt
#wget -P files/usr/share/unblockneteasemusic/core https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/luci-app-unblockneteasemusic/core/server.key

# Fix others
#wget -P files/usr/share/jd-dailybonus https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/others/JD_DailyBonus.js
#wget -P files/etc https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/others/docker-init
#wget -P files/etc https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/others/docker-web
wget -P files/www/luci-static/vssr https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/others/jquery.min.js
wget -P files/usr/myhosts https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/others/miTVhosts

# add root files
wget -P files/root https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/root/pandownload-fake-server-1-1.ipk
wget -P files/root https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/root/pd-install
wget -P files/root https://raw.githubusercontent.com/Gabrielxzx/Gabrielxzx-luci/master/files/root/resetssrp


# 广告屏蔽大师增加默认规则 anti-ad
#wget -P files/usr/share/adbyby/rules/data https://anti-ad.net/anti-ad-for-dnsmasq.conf
#sed -i 's/api.dianshihome.com/0013.cc/g' files/usr/share/adbyby/rules/data/anti-ad-for-dnsmasq.conf
#sed -i 's/cdn.dianshihome.com/0013.cc/g' files/usr/share/adbyby/rules/data/anti-ad-for-dnsmasq.conf
#sed -i 's/api.dianshige.com/0013.cc/g' files/usr/share/adbyby/rules/data/anti-ad-for-dnsmasq.conf
#sed -i 's/pushapi.tvfuwu.com/0013.cc/g' files/usr/share/adbyby/rules/data/anti-ad-for-dnsmasq.conf
#sed -i 's/pushapi.cdnimg.org/0013.cc/g' files/usr/share/adbyby/rules/data/anti-ad-for-dnsmasq.conf

# 修改Files大法权限
chmod -R 755 files
