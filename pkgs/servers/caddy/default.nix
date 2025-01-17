{ lib, buildGoModule, fetchFromGitHub, nixosTests }:

buildGoModule rec {
  pname = "caddy";
  version = "2.4.4";

  subPackages = [ "cmd/caddy" ];

  src = fetchFromGitHub {
    owner = "caddyserver";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-POdDORICDE49BQ5LLTs4GTb1VoSXZD4K4MpRkVoj+AY=";
  };

  vendorSha256 = "sha256-JAQaxEmdX0fpDahe55pEKnUW64k8JjrytkBrXpQJz3I=";

  passthru.tests = { inherit (nixosTests) caddy; };

  meta = with lib; {
    homepage = "https://caddyserver.com";
    description = "Fast, cross-platform HTTP/2 web server with automatic HTTPS";
    license = licenses.asl20;
    maintainers = with maintainers; [ Br1ght0ne ];
  };
}
