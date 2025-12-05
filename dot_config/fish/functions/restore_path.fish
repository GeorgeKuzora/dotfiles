function restore_path --description 'Restore init path'
    set -gx PATH /Users/kuzora/.atuin/bin \
        /Users/kuzora/.local/share/nvim/mason/bin \
        /Users/kuzora/.vscode/extensions/ms-python.debugpy-2025.16.0-darwin-arm64/bundled/scripts/noConfigScripts \
        /Users/kuzora/.orbstack/bin \
        /Users/kuzora/.vscode/extensions/ms-python.debugpy-2025.14.1-darwin-arm64/bundled/scripts/noConfigScripts \
        /Users/kuzora/.cargo/bin \
        /opt/homebrew/Cellar/rustup/1.28.2/bin \
        /Users/kuzora/.lmstudio/bin \
        /opt/homebrew/bin \
        /opt/homebrew/sbin \
        /usr/local/bin \
        /System/Cryptexes/App/usr/bin \
        /usr/bin \
        /bin \
        /usr/sbin \
        /sbin \
        /Applications/Ghostty.app/Contents/MacOS \
        /Users/kuzora/go/bin \
        /Users/kuzora/.local/bin \
        /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin \
        /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin \
        /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin \
        /home/linuxbrew/.linuxbrew/bin
end
