# Incus, for campbuild's self-hosted GitHub Actions runners: Ubuntu system
# containers ci-runner-1..3, each with its own Docker, made and registered by
# campbuild's scripts/ci/runner.sh.
{username, ...}: {
  virtualisation.incus = {
    enable = true;
    preseed = {
      networks = [
        {
          name = "incusbr0";
          type = "bridge";
          config = {
            "ipv4.address" = "10.0.100.1/24";
            "ipv4.nat" = "true";
            "ipv6.address" = "none";
          };
        }
      ];
      storage_pools = [
        {
          name = "default";
          driver = "dir";
        }
      ];
      profiles = [
        {
          name = "default";
          devices = {
            eth0 = {
              name = "eth0";
              network = "incusbr0";
              type = "nic";
            };
            root = {
              path = "/";
              pool = "default";
              type = "disk";
            };
          };
        }
      ];
    };
  };

  # Incus on NixOS requires the nftables firewall backend.
  networking.nftables.enable = true;
  # Let the containers reach DHCP/DNS on the bridge.
  networking.firewall.trustedInterfaces = ["incusbr0"];

  users.users.${username}.extraGroups = ["incus-admin"];
}
