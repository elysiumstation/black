<!--
order: 1
-->

# Airdrop

Learn how to participate in the **validator onboarding airdrop**. Additionally after following the KYC procedure, you are whitelisted for other upcoming airdrops. {synopsis}

## Requirements

* A running `blackd` instance to validate
* Your Black EVM address
* Accepted KYC
* The sign-up period between the **14th Dec 00:00 UTC and 28th Dec 23:59 UTC** has not passed yet

### How to setup `blackd`

To setup a validator, you can follow our guide [here](../validators/mainnet.md).
In case any questions arise along the way, feel free to join our [Discord](https://discord.gg/jGTPyYmpsq) and we will help you out right away.

### Your Black EVM Address

Below are 3 ways to obtain your Black EVM address:

* Via [Metamask](../users/wallets/metamask.md)
* Via [Keplr](../users/wallets/keplr.md)
* Via `blackd`. [Further information on blackd keys usage](../users/keys/keyring.md)

```bash
blackd debug addr <your-did:fury:-address>
```

Example:

```bash
blackd debug addr did:fury:1y59gekgkzzq7cvwdu5c4lefu7wg29g3f32qajh
Address bytes: [37 10 140 217 22 16 129 236 49 205 229 49 95 229 60 243 144 162 162 41]
Address (hex): 250A8CD9161081EC31CDE5315FE53CF390A2A229
Address (EIP-55): 0x250a8cd9161081Ec31cde5315Fe53cF390a2a229
Bech32 Acc: did:fury:1y59gekgkzzq7cvwdu5c4lefu7wg29g3f32qajh
Bech32 Val: did:fury:valoper1y59gekgkzzq7cvwdu5c4lefu7wg29g3f05d85x
```

We can now obtain our EVM address from the line `Address (EIP-55)`, which in this case is
`0x250a8cd9161081Ec31cde5315Fe53cF390a2a229`.

### KYC

In order to participate in the airdrop, please follow our KYC procedure by visiting the [Blockpass.org](https://verify-with.blockpass.org/?clientId=black_network_88a38&serviceName=Black%20Network&env=prod) portal during the sign-up period. This is needed to comply with EU regulations as the airdrop is executed by Black Dev B.V. situated in the Netherlands.

Please note the KYC form will have a field for an **Ethereum address**, please **input your Black EVM address** in there, as explained above.
