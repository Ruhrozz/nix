{
  services.gitlab-runner.enable = true;
  services.gitlab-runner.services = {
    docker = {
      authenticationTokenConfigFile =
        "/home/malofeev/.gitlab/gitlab-runner-docker-images-token-env";
      executor = "docker";
      dockerImage = "alpine";
      dockerVolumes = [ "/var/run/docker.sock:/var/run/docker.sock" "/cache" ];
      dockerPrivileged = true;
      dockerDisableCache = false;
    };
  };
}
