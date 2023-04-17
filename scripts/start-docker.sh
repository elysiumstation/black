#!/bin/bash

KEY="dev0"
CHAINID="black_42024-1"
MONIKER="mymoniker"
DATA_DIR=$(mktemp -d -t black-datadir.XXXXX)

echo "create and add new keys"
./blackd keys add $KEY --home $DATA_DIR --no-backup --chain-id $CHAINID --algo "eth_secp256k1" --keyring-backend test
echo "init Black with moniker=$MONIKER and chain-id=$CHAINID"
./blackd init $MONIKER --chain-id $CHAINID --home $DATA_DIR
echo "prepare genesis: Allocate genesis accounts"
./blackd add-genesis-account \
"$(./blackd keys show $KEY -a --home $DATA_DIR --keyring-backend test)" 1000000000000000000ablack,1000000000000000000stake \
--home $DATA_DIR --keyring-backend test
echo "prepare genesis: Sign genesis transaction"
./blackd gentx $KEY 1000000000000000000stake --keyring-backend test --home $DATA_DIR --keyring-backend test --chain-id $CHAINID
echo "prepare genesis: Collect genesis tx"
./blackd collect-gentxs --home $DATA_DIR
echo "prepare genesis: Run validate-genesis to ensure everything worked and that the genesis file is setup correctly"
./blackd validate-genesis --home $DATA_DIR

echo "starting black node $i in background ..."
./blackd start --pruning=nothing --rpc.unsafe \
--keyring-backend test --home $DATA_DIR \
>$DATA_DIR/node.log 2>&1 & disown

echo "started black node"
tail -f /dev/null