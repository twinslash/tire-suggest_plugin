# Tire for [Suggester Plugin for Elasticsearch](https://github.com/spinscale/elasticsearch-suggest-plugin)

Addition for [Tire](https://github.com/karmi/tire) to work with suggester plugin for elasticsearch: https://github.com/spinscale/elasticsearch-suggest-plugin.

Now it's just *build-it-fast-and-check-if-it-works* version. Stay tune for updates.

## Usage

### Searching for suggestions

```ruby
Tire.suggest('cars', field: 'name.suggest', term: 'au').suggestions
#=> ["audi", "audi 100", "audi 200", "audi 80", "audi 90", "audi a2", "audi a3", "audi a4", "audi a5", "audi a6"]
```

### Searching by several indices

```ruby
Tire.suggest ['cars', 'ads'] do
  field 'name'
  term 'bmw x'
end.suggestions
#=> ["bmw x3", "bmw x5"]
```
