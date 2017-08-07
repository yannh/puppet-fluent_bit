# Fluent-bit

Install, configure, and manage Fluent-bit log shipper.

## Module Description

 * Installs td-agent package
 * Generates configuration file td-agent-bit.conf
 * Manages td-agent-bit service

## Usage Examples

### Basic

Install and start the service.

```puppet
class { 'fluent-bit': }
```

### Hiera Support

Defining Fluentd resources in Hiera.

```yaml
fluent_bit::configs:
  'my_cpu':
    service: 'INPUT'
    name: 'cpu'
    tag: 'tag1'
```

## Limitations

Tested on Ubuntu 16.04


## Development

Bug reports and pull requests are welcome!
