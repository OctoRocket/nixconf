if status is-interactive
    alias rebuild "sudo nixos-rebuild switch -I nixos-config=/home/octorocket/.nixconf/system/configuration.nix"
    alias nconf "nvim ~/.nixconf"
    alias confdir "nvim ~/.nixconf/configs/"
    freshfetch | lolcat
    fortune
end
