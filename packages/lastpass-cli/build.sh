TERMUX_PKG_HOMEPAGE=https://lastpass.com/
TERMUX_PKG_DESCRIPTION="LastPass command line interface tool"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.4.0"
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://github.com/lastpass/lastpass-cli/archive/v$TERMUX_PKG_VERSION/lastpass-cli-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=99517545e4906230a1fb21a0c6c575210f127057ad5b50eeb3c8e9acb7edfca3
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libcurl, libxml2, openssl, pinentry"
TERMUX_PKG_BUILD_DEPENDS="bash-completion"
TERMUX_PKG_SUGGESTS="termux-api"

termux_step_post_make_install() {
	ninja install-doc

	install -Dm600 "$TERMUX_PKG_SRCDIR"/contrib/lpass_zsh_completion \
		"$TERMUX_PREFIX"/share/zsh/site-functions/_lpass

	install -Dm600 "$TERMUX_PKG_SRCDIR"/contrib/completions-lpass.fish \
		"$TERMUX_PREFIX"/share/fish/vendor_completions.d/lpass.fish
}
