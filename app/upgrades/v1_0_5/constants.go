package v1_0_5

import "github.com/xblackfury/black/app/upgrades"

const (
	// UpgradeName defines the on-chain upgrade name for the Black v1_0_5 upgrade.
	UpgradeName = "v1_0_5"

	// UpgradeHeight defines the block height at which the Black v1_0_5 upgrade is
	// triggered.
	UpgradeHeight = 1_763_000
)

var Fork = upgrades.Fork{
	UpgradeName:    UpgradeName,
	UpgradeHeight:  UpgradeHeight,
	BeginForkLogic: RunForkLogic,
}
