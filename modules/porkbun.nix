{pkgs, ... }:
{
    services.oink = {
        enable = true;
        apiKeyFile = "/etc/oink/oink_api_key";
        secretApiKeyFile = "/etc/oink/oink_secret_key";
        domains = [
        {
            domain = "miseryindex.xyz";
            subdomain = "";
        }
        {
            domain = "miseryindex.xyz";
            subdomain = "semyy";
        }
        ];
    };
}
