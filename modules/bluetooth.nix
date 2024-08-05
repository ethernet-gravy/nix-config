{config, pkgs, ...}:
{
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    hardware.bluetooth.settings = {
  General = {
    Privacy = "device";
    ClassicBondedOnly = true;
  };
};
}
