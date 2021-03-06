// SPDX-License-Identifier: MIT

pragma solidity 0.6.11;

import './IERC20.sol';

/**
 * XFI token extends the interface of ERC20 standard.
 */
interface IXFIToken is IERC20 {
    event VestingStartChanged(uint256 newVestingStart, uint256 newVestingEnd, uint256 newReserveFrozenUntil);
    event TransfersStarted();
    event TransfersStopped();
    event MigrationsAllowed();
    event ReserveWithdrawal(address indexed to, uint256 amount);
    event VestingBalanceMigrated(address indexed from, bytes32 to, uint256 vestingDaysLeft, uint256 vestingBalance);

    function isTransferringStopped() external view returns (bool);
    function isMigratingAllowed() external view returns (bool);
    function VESTING_DURATION() external view returns (uint256);
    function VESTING_DURATION_DAYS() external view returns (uint256);
    function RESERVE_FREEZE_DURATION() external view returns (uint256);
    function RESERVE_FREEZE_DURATION_DAYS() external view returns (uint256);
    function MAX_VESTING_TOTAL_SUPPLY() external view returns (uint256);
    function vestingStart() external view returns (uint256);
    function vestingEnd() external view returns (uint256);
    function reserveFrozenUntil() external view returns (uint256);
    function reserveAmount() external view returns (uint256);
    function vestingDaysSinceStart() external view returns (uint256);
    function vestingDaysLeft() external view returns (uint256);
    function convertAmountUsingRatio(uint256 amount) external view returns (uint256);
    function convertAmountUsingReverseRatio(uint256 amount) external view returns (uint256);
    function totalVestedBalanceOf(address account) external view returns (uint256);
    function unspentVestedBalanceOf(address account) external view returns (uint256);
    function spentVestedBalanceOf(address account) external view returns (uint256);

    function mint(address account, uint256 amount) external returns (bool);
    function mintWithoutVesting(address account, uint256 amount) external returns (bool);
    function burn(uint256 amount) external returns (bool);
    function burnFrom(address account, uint256 amount) external returns (bool);
    function increaseAllowance(address spender, uint256 addedValue) external returns (bool);
    function decreaseAllowance(address spender, uint256 subtractedValue) external returns (bool);
    function startTransfers() external returns (bool);
    function stopTransfers() external returns (bool);
    function allowMigrations() external returns (bool);
    function changeVestingStart(uint256 newVestingStart) external returns (bool);
    function withdrawReserve(address to) external returns (bool);
    function migrateVestingBalance(bytes32 to) external returns (bool);
}
