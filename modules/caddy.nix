{pkgs, lib, ... }:
{
    services.caddy = {
        enable = true;
        environmentFile = /etc/oink/caddy.env;
        extraConfig = (builtins.readFile ./Caddyfile);
        package = pkgs.caddy.withPlugins {
            plugins = ["github.com/caddy-dns/porkbun@v0.3.1"];
            hash = "sha256-R1ZqQ8drcBQIH7cLq9kEvdg9Ze3bKkT8IAFavldVeC0=";
        };
    };
}
