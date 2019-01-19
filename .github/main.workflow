workflow "New workflow" {
  on = "push"
  resolves = ["test"]
}

action "dependency" {
  uses = "docker://composer/composer"
  args = "install"
}

action "test" {
  uses = "docker://php:7.2"
  needs = ["dependency"]
  args = "bin/phpunit"
}
