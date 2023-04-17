<!--
order: 6
-->

# Snapshots & Archive Nodes

Quickly sync your node with Black using a snapshot or serve queries for prev versions using archive nodes {synopsis}

## List of Snapshots and Archives

Below is a list of publicly available snapshots that you can use to sync with the Black mainnet and
archived [7070-2 mainnet](https://github.com/black-network/networks/tree/main/mainnet):

<!-- markdown-link-check-disable -->
:::: tabs
::: tab Snapshots

| Name        | URL                                                                                   |
| -------------|---------------------------------------------------------------------------------------|
| `Notional`   | TBD |

:::
::: tab Archives
<!-- markdown-link-check-disable -->

| Name           | URL                                                                                                          |
| ---------------|--------------------------------------------------------------------------------------------------------------|
| `Nodes Guru`   | TBD                                                                                                          |
:::
::::

To access snapshots and archives, follow the example process below (this code snippet is to access a snapshot of the current network, `black_42024-2`, from Nodes Guru):

```bash
cd $HOME/.blackd/data
wget https://snapshots.nodes.guru/black_42024-2/black_42024-2-410819.tar
tar xf black_42024-2-410819.tar
```

### PebbleDB

To use PebbleDB instead of GoLevelDB when using snapshots from Notional:

Build:

```bash
go mod edit -replace github.com/tendermint/tm-db=github.com/baabeetaa/tm-db@pebble
go mod tidy
go install -tags pebbledb -ldflags "-w -s -X github.com/cosmos/cosmos-sdk/types.DBBackend=pebbledb" ./...
```

Download snapshot:

```bash
cd $HOME/.blackd/
URL_SNAPSHOT="https://snapshot.notional.ventures/black/data_20221024_193254.tar.gz"
wget -O - "$URL_SNAPSHOT" |tar -xzf -
```

Start:

Set `db_backend = "pebbledb"` in `config.toml` or start with `--db_backend=pebbledb`

```bash
blackd start --db_backend=pebbledb
```

**Note**: use this [workaround](https://github.com/notional-labs/cosmosia/blob/main/docs/pebbledb.md) when upgrading a node running PebbleDB.
