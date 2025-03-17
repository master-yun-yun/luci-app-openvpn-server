# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-openvpn-server

LUCI_TITLE:=LuCI support for OpenVPN Server
LUCI_DEPENDS:=+openvpn-openssl +openvpn-easy-rsa +kmod-tun
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/easy-rsa
	-[ ! -f $(1)/etc/config/openvpn ] && $(INSTALL_BIN) ./files/openvpn.config $(1)/etc/config/openvpn
	-[ ! -f $(1)/etc/easy-rsa/vars ] && $(INSTALL_BIN) ./files/vars $(1)/etc/easy-rsa/vars
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
