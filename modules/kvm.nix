{ pkgs, config, lib, ... }:
{


  options.vfio.enable = with lib;
    mkEnableOption "Configure the machine for VFIO";
  config = {
# Configure kernel options to make sure IOMMU & KVM support is on.
  boot = {
    initrd.kernelModules = [ "vfio" "vfio_pci" "vfio_iommu_type1" ];
    kernelParams = [  "kvm.ignore_msrs=1" "iommu=pt" "vfio_iommu_type1.allow_unsafe_interrupts=1" "vfio-pci.ids=1002:744c,1002:ab30"   ];
  };


  programs.virt-manager.enable = true;
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

  #remember to passthrough windows partition disk to the vm


  virtualisation.spiceUSBRedirection.enable = true; 
  users.users.nakul.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ];
  };
}
