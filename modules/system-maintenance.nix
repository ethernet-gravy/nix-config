{pkgs, ...}:
{
  boot.tmp.useTmpfs = true;
  boot.plymouth.enable = true;
  environment.localBinInPath = true;
}
