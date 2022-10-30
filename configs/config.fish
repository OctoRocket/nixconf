if status is-interactive
    alias rebuild "sudo nixos-rebuild switch -I nixos-config=/home/octorocket/.nixconf/system/configuration.nix"
    freshfetch | lolcat
    fortune
end
