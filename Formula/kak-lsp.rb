class KakLsp < Formula
  desc "Kakoune Language Server Protocol Client"
  homepage "https://github.com/ul/kak-lsp/"
  url "https://github.com/ul/kak-lsp/releases/download/v3.3.0/kak-lsp-v3.3.0-x86_64-apple-darwin.tar.gz"
  sha256 "58e8e724af0942a260178968b837c313bfb4f3b8e966e76589b9be26505c20f4"
  version "3.3.0"

  def install
    bin.install "kak-lsp"
    bin.install "kak-lsp.toml"
  end

  def caveats
    <<~EOS
      Be sure to put  %sh{kak-lsp --kakoune}  to your kakrc.
      To customize kak-lsp copy default config from  #{bin}/kak-lsp.toml  to  ~/.config/kak-lsp/kak-lsp.toml  and edit it.
      To not bother with manual start/restart run  brew services start ul/kak-lsp/kak-lsp  (better without sudo despite of brew suggestion to have relevant PATH available to kak-lsp to start language servers). 
    EOS
  end

  plist_options :startup => true

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>/bin/bash</string>
            <string>-l</string>
            <string>-c</string>
            <string>#{bin}/kak-lsp</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>/tmp/kak-lsp.log</string>
        </dict>
      </plist>
    EOS
  end
end
