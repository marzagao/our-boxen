Define `appstore::appleid` and `appstore::password` in your hiera config:

```yaml
---
# /opt/boxen/repo/hiera/users/your_github_username.yaml

# App Store credentials:
appstore::appleid: appleid@me.com
appstore::password: jlaw4eva

# Optional App Store location:
appstore::store: us
```

Add app definitions:

```puppet
appstore::app { 'Twitter':
  source => 'twitter/id409789998', # required
}
```
# Per-user hiera configuration

The example `hiera.yaml` includes an entry in the hierarchy for
per-user configurations, allowing individuals to override many, many
common puppet parameters for their own machines.

Simply place a file in this directory named after your github
login. For example, if your github login is `johndoe`, you would edit
the file `johndoe.yaml` here.

## Example

```yaml
boxen::personal::homebrew_packages:
  - pstree
  - htop

boxen::personal::osx_apps:
  - google-chrome
  - spotify
  - things

boxen::personal::projects:
  - project_a
  - secret_project
```
