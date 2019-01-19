workflow "Testing" {
  on = "push"
  resolves = [
    "phpstan",
    "phpunit",
  ]
}

action "dependency" {
  uses = "docker://composer"
  args = "install"
}

action "phpunit" {
  uses = "docker://php"
  needs = ["dependency"]
  args = "vendor/bin/phpunit"
}

action "phpstan" {
  uses = "docker://php"
  needs = ["dependency"]
  args = "vendor/bin/phpstan analyse --level=7 ./"
  runs = "php -dmemory_limit=1G"
}
