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
