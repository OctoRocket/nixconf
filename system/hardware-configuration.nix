{config, lib, pkgs, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot.initrd.availableKernelModules = ["nvme"];
  hardware.enableAllFirmware = true;
  fileSystems."/" = {
      device = "/dev/disk/by-uuid/6e13f5e3-0d74-4db5-9acc-6579659f9950";
      fsType = "ext4";
  };
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/8C43-FF51";
    fsType = "vfat";
  };
}