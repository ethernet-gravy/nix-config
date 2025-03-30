{config, pkgs, ...}:
{
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "balanced";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "balanced";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 70;




        INTEL_GPU_MIN_FREQ_ON_AC=900;
        INTEL_GPU_MIN_FREQ_ON_BAT=700;
        INTEL_GPU_MAX_FREQ_ON_AC=1150;
        INTEL_GPU_MAX_FREQ_ON_BAT=1150;

      };
};
}
