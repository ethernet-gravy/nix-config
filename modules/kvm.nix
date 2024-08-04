{ pkgs, config, lib, ... }:
let
  # Change this to match your system's CPU.
  platform = "amd";
  # Change this to specify the IOMMU ids you wrote down earlier.
  vfioIds = [ "1002:744c" "1002:ab30"];
  coreutils = pkgs.writeShellApplication {
     name = "coreutils";
     runtimeInputs = [
        pkgs.coreutils
     ];
     text = ''
        realpath /dev/dri/by-path/pci-0000:00:02.0-card 
     '';
  };
in {


  options.vfio.enable = with lib;
    mkEnableOption "Configure the machine for VFIO";
  config = 
  let cfg = config.vfio;
  in {
# Configure kernel options to make sure IOMMU & KVM support is on.
  boot = {
    initrd.kernelModules = [ "vfio_pci" ];
    kernelParams = [  "kvm.ignore_msrs=1" "iommu=pt" "vfio_iommu_type1.allow_unsafe_interrupts=1"];
  };


  # Enable virtualisation programs. These will be used by virt-manager to run your VM.
  virtualisation = {
     libvirtd = {
       enable = true;
       extraConfig = ''
         user="nakul"
       '';

       # Don't start any VMs automatically on boot.
       onBoot = "ignore";
       # Stop all running VMs on shutdown.
       onShutdown = "shutdown";

       qemu = {
         ovmf.enable = true;
         verbatimConfig = ''
            namespaces = []
           user = "nakul"
           group = "users"
         '';
       };
    };
  };

  environment = {
    systemPackages = [ pkgs.dmidecode ];
    shellAliases = {
      vm-start = "virsh start win10";
      vm-stop = "virsh shutdown win10";
    };
  };

  programs.virt-manager.enable = true;

  users.users.nakul.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ];
  };
  
}
