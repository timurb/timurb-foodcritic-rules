# TimurB's foodcritic rules

Chances are the most rules are already implemented in mainline or rulebooks of [Etsy](https://github.com/etsy/foodcritic-rules), [CustomInk](https://github.com/customink-webops/foodcritic-rules) or some other people (please let me know if you know any).

Sometimes there are some cases that would be nice to catch.

# Rules

## TIMB001: Single-quoted `#{}` sustitution

Catches the cases when you place Ruby string substitution inside single-quoted strings.
You probably don't write these manually but it is easy to get these if you are not very careful when mass-replacing ' into " in your code.

Example:
```
cookbook_file 'config.cfg' do
  path '#{path_to_config}/config.cfg'
  action :create
end
```
