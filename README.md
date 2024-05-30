# be-contracts

VeDA solidity contracts backend repository

## avalanche fuji testnet deployment

| Contract | Address | Misc |
|----------|---------|------|
| AnalyticsAPICaller | [0x736173F27e22dDd6A259E6fC77c494B7cE0ff09E](https://testnet.snowtrace.io/address/0x736173F27e22dDd6A259E6fC77c494B7cE0ff09E)| [8721](https://functions.chain.link/fuji/8721) |
| CityIndexFactory | [0x24fb0f7444B3309DADF5e6B0f325278776466c15](https://testnet.snowtrace.io/address/0x24fb0f7444B3309DADF5e6B0f325278776466c15) | |
| CityIndex| [0x355A7F434c0A7deaE86F5A5DbE88e71CD12a6CB9](https://testnet.snowtrace.io/address/0x355A7F434c0A7deaE86F5A5DbE88e71CD12a6CB9) | INIT token |

## polygon amoy testnet deployment

| Contract | Address | Misc |
|----------|---------|------|
| AnalyticsAPICaller | [0x24fb0f7444B3309DADF5e6B0f325278776466c15](https://amoy.polygonscan.com/address/0x24fb0f7444b3309dadf5e6b0f325278776466c15)| [272](https://functions.chain.link/polygon-amoy/272) |
| CityIndexFactory | [0xF4B227ed6aC46371B880d280a782E1E2813e7CA2](https://amoy.polygonscan.com/address/0xF4B227ed6aC46371B880d280a782E1E2813e7CA2) | |



> source .env.polygon

> forge create --rpc-url $RPC_URL --constructor-args $CHAINLINK_DON_ID $CHAINLINK_ROUTER --private-key $PRIVATE_KEY src/AnalyticsAPICaller.sol:AnalyticsAPICaller

> forge create --rpc-url $RPC_URL --constructor-args 0xcdFFf8c15Bcf37657db38117621214eb03ea8c40 0x24fb0f7444B3309DADF5e6B0f325278776466c15 --private-key $PRIVATE_KEY src/CityIndexFactory.sol:CityIndexFactory

> forge create --rpc-url $RPC_URL --constructor-args 0xcdFFf8c15Bcf37657db38117621214eb03ea8c40 --private-key $PRIVATE_KEY src/KashebaTrading.sol:KashebaTrading