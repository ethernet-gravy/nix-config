{config, lib, pkgs,  ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.nakul = {
     isNormalUser = true;
     extraGroups = [ "NetworkManager" "wheel" "dialout" "tty" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
     firefox
  #     firefox
  #     tree
     ];
 };

}
