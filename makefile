{
    "log_path": "infernet_node.log",
    "server": {
        "port": 4000
    },
    "chain": {
        "enabled": true,
        "trail_head_blocks": 0,
        "rpc_url": "http://host.docker.internal:8545",
        "registry_address": "0x663F3ad617193148711d28f5334eE4Ed07016602",
        "wallet": {
            "max_gas_limit": 4000000,
            "private_key": "0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d"
        }
    },
    "startup_wait": 1.0,
    "docker": {
        "username": "your-username",
        "password": ""
    },
    "redis": {
        "host": "redis",
        "port": 6379
    },
    "forward_stats": true,
    "snapshot_sync": {
        "sleep": 3,
        "batch_size": 100
    },
    "containers": [
        {
            "id": "hello-world",
            "image": "ritualnetwork/hello-world-infernet:latest",
            "external": true,
            "port": "3000",
            "allowed_delegate_addresses": [],
            "allowed_addresses": [],
            "allowed_ips": [],
            "command": "--bind=0.0.0.0:3000 --workers=2",
            "env": {},
            "accepted_payments": {}
        }
    ]
}