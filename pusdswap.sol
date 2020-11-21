pragma solidity 0.5.8;

library Math {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


pragma solidity ^0.5.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address ) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity ^0.5.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/TRC20/ITRC20.sol

pragma solidity ^0.5.0;

/**
 * @dev Interface of the TRC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {TRC20Detailed}.
 */
interface ITRC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);
    function mint(address account, uint amount) external;

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    //function burn(uint256 amount) external returns (bool);
    function burn(uint256 amount)  external;


    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.5.4;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * IMPORTANT: It is unsafe to assume that an address for which this
     * function returns false is an externally-owned account (EOA) and not a
     * contract.
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

    /**
     * @dev Converts an `address` into `address payable`. Note that this is
     * simply a type cast: the actual underlying value is not changed.
     *
     * _Available since v2.4.0._
     */
    function toPayable(address account) internal pure returns (address ) {
        return address(uint160(account));
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     *
     * _Available since v2.4.0._
     */
    function sendValue(address  recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/TRC20/SafeTRC20.sol

//pragma solidity ^0.5.0;




/**
 * @title SafeTRC20
 * @dev Wrappers around TRC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeTRC20 for TRC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeTRC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(ITRC20 _tokenAddress, address _to, uint256 _value) internal returns (bool success){
        //callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
        bytes memory msg = abi.encodeWithSignature("transfer(address,uint256)", _to, _value);
        uint msgSize = msg.length;

        assembly {
            // pre-set scratch space to all bits set
            mstore(0x00, 0xff)

            // note: this requires tangerine whistle compatible EVM
            if iszero(call(gas(), _tokenAddress, 0, add(msg, 0x20), msgSize, 0x00, 0x20)) { revert(0, 0) }

            switch mload(0x00)
            case 0xff {
                // token is not fully ERC20 compatible, didn't return anything, assume it was successful
                success := 1
            }
            case 0x01 {
                success := 1
            }
            case 0x00 {
                success := 0
            }
            default {
                // unexpected value, what could this be?
                revert(0, 0)
            }
        }
        
    }

    function safeTransferFrom(ITRC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(ITRC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeTRC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(ITRC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(ITRC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeTRC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function callOptionalReturn(ITRC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeTRC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeTRC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeTRC20: TRC20 operation did not succeed");
        }
    }
}


interface IJustswapExchange {
    event TokenPurchase(address indexed buyer, uint256 indexed trx_sold, uint256 indexed tokens_bought);
    event TrxPurchase(address indexed buyer, uint256 indexed tokens_sold, uint256 indexed trx_bought);
    event AddLiquidity(address indexed provider, uint256 indexed trx_amount, uint256 indexed token_amount);
    event RemoveLiquidity(address indexed provider, uint256 indexed trx_amount, uint256 indexed token_amount);
    function () external payable;
    function getInputPrice(uint256 input_amount, uint256 input_reserve, uint256 output_reserve) external view returns (uint256);
    function getOutputPrice(uint256 output_amount, uint256 input_reserve, uint256 output_reserve) external view returns (uint256);
    function trxToTokenSwapInput(uint256 min_tokens, uint256 deadline) external payable returns (uint256);
    function trxToTokenTransferInput(uint256 min_tokens, uint256 deadline, address recipient) external payable returns(uint256);
    function trxToTokenSwapOutput(uint256 tokens_bought, uint256 deadline) external payable returns(uint256);
    function trxToTokenTransferOutput(uint256 tokens_bought, uint256 deadline, address recipient) external payable returns (uint256);
    function tokenToTrxSwapInput(uint256 tokens_sold, uint256 min_trx, uint256 deadline) external returns (uint256);
    function tokenToTrxTransferInput(uint256 tokens_sold, uint256 min_trx, uint256 deadline, address recipient) external returns (uint256);
    
    function tokenToTrxSwapOutput(uint256 trx_bought, uint256 max_tokens, uint256 deadline) external returns (uint256);
    function tokenToTrxTransferOutput(uint256 trx_bought, uint256 max_tokens, uint256 deadline, address recipient) external returns (uint256);
    function tokenToTokenSwapInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_trx_bought, uint256 deadline, address token_addr) external returns (uint256);
    function tokenToTokenTransferInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_trx_bought, uint256 deadline, address recipient, address token_addr) external returns (uint256);
    function tokenToTokenSwapOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_trx_sold, uint256 deadline, address token_addr) external returns (uint256);
    function tokenToTokenTransferOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_trx_sold, uint256 deadline, address recipient, address token_addr) external returns (uint256);
    function tokenToExchangeSwapInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_trx_bought, uint256 deadline, address exchange_addr) external returns (uint256);
    function tokenToExchangeTransferInput(uint256 tokens_sold, uint256 min_tokens_bought, uint256 min_trx_bought, uint256 deadline, address recipient, address exchange_addr) external returns (uint256);
    function tokenToExchangeSwapOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_trx_sold, uint256 deadline, address exchange_addr) external returns (uint256);
    function tokenToExchangeTransferOutput(uint256 tokens_bought, uint256 max_tokens_sold, uint256 max_trx_sold, uint256 deadline, address recipient, address exchange_addr) external returns (uint256);
     function getTrxToTokenInputPrice(uint256 trx_sold) external view returns (uint256);
     function getTrxToTokenOutputPrice(uint256 tokens_bought) external view returns (uint256);
    function getTokenToTrxInputPrice(uint256 tokens_sold) external view returns (uint256); 
    function getTokenToTrxOutputPrice(uint256 trx_bought) external view returns (uint256); function tokenAddress() external view returns (address);
    function factoryAddress() external view returns (address);
    function addLiquidity(uint256 min_liquidity, uint256 max_tokens, uint256 deadline) external payable returns (uint256);
    function removeLiquidity(uint256 amount, uint256 min_trx, uint256 min_tokens, uint256 deadline) external returns (uint256, uint256);

}

contract pusdswap{
    using SafeMath for uint256;
    //using SafeTRC20 for ITRC20;
    
    uint256 public result;
    uint256 public balancetrx;
    uint256 public balanceusdt;

    mapping(address => uint256) private buypusd;
    mapping(address => uint256) private burnpusd;


    
    IJustswapExchange usdttokenexchange = IJustswapExchange(0x41a2726afbecbd8e936000ed684cef5e2f5cf43008); //usdtusdt

    
    ITRC20 public pusd = ITRC20(0x41f556c0cfd6fd573fc965eb6d318666e0eaed5989);  // PUSD token
    
    ITRC20 public usdt = ITRC20(0x41a614f803b6fd780986a42c78ec9c7f77e6ded13c);  // usdt token  

    address public governance;

    event TrxInToPusdToken(address user, uint256 amount, uint256 pusd);
    event UsdtInToPusdToken(address user, uint256 amount);
    event PusdTotrx(address user, uint256 amount, uint256 trxchange);
    event PusdTousdt(address user, uint256 amount);


    constructor () public{
      governance = msg.sender;
    }

    function test1() public view returns(uint256) {
        IJustswapExchange ytoken = IJustswapExchange(0x41a2726afbecbd8e936000ed684cef5e2f5cf43008);
        // result = ytoken.getTrxToTokenOutputPrice(1000000000000000000);
        uint256 result = ytoken.getTrxToTokenOutputPrice(1);
        return result;

    }
    
    
    function trxInToPusdToken() public  payable{
        require(msg.value > 0 , "Cannot TransferIn  0");
         uint256 price = usdttokenexchange.getTrxToTokenOutputPrice(1);
         uint256 amount = msg.value;
         balancetrx.add(amount);
         uint256 usdtnub = amount.div(price);
         //pusd.transfer(msg.sender, usdtnub);
         pusd.mint(msg.sender, usdtnub);
         buypusd[msg.sender]=buypusd[msg.sender].add(usdtnub);
         emit TrxInToPusdToken( msg.sender, amount, usdtnub);
     }
     
    function getTrxInToPusdToken(uint256 amount) public view returns(uint256) {
        //require(msg.value > 0 , "Cannot TransferIn  0");
        uint256 price = usdttokenexchange.getTrxToTokenOutputPrice(1);
        //uint256 amount = msg.value;
       // balancetrx.add(amount);
        uint256 usdtnub = amount.div(price);
        return usdtnub;
    }


    function getPusdTotrx(uint256 amount) public view returns(uint256) {
        //require(amount > 0 , "Cannot TransferIn  0");
        //pusd.transferFrom(msg.sender, address(this), amount);
        //pusd.burn(amount);
        uint256 price = usdttokenexchange.getTrxToTokenOutputPrice(1);
        uint256 trxnub = amount.mul(price).mul(90).div(100);
        return trxnub;
    }
    
    function pusdTotrx(uint256 amount) public {
        require(amount > 0 , "Cannot TransferIn  0");
        pusd.transferFrom(msg.sender, address(this), amount);
        pusd.burn(amount);
        uint256 price = usdttokenexchange.getTrxToTokenOutputPrice(1);
        uint256 trxnub = amount.mul(price).mul(90).div(100);
        address(uint160(msg.sender)).transfer(trxnub);
        if (buypusd[msg.sender] > amount ) {
            buypusd[msg.sender]=buypusd[msg.sender].sub(amount);
        } else {
            buypusd[msg.sender]= 0;
        }
        burnpusd[msg.sender]= burnpusd[msg.sender].add(amount);
       emit PusdTotrx(msg.sender, amount, trxnub);
    }
    
    
    function usdtInToPusdToken(uint256 amount) public {
        require(amount > 0 , "Cannot TransferIn  0");
        
        usdt.transferFrom(msg.sender, address(this), amount);
        balanceusdt= balanceusdt.add(amount);
        
        //pusd.transfer(msg.sender, amount);
        pusd.mint(msg.sender, amount);

        buypusd[msg.sender]=buypusd[msg.sender].add(amount);

        emit UsdtInToPusdToken( msg.sender, amount);
    }
    
    function pusdTousdt(uint256 amount) public {
        require(amount > 0 , "Cannot TransferIn  0");
        pusd.transferFrom(msg.sender, address(this), amount);
        pusd.burn(amount);
        usdt.transfer(msg.sender, amount.mul(95).div(100));
        if (buypusd[msg.sender] >amount ) {
            buypusd[msg.sender]=buypusd[msg.sender].sub(amount);
        } else {
            buypusd[msg.sender]= 0;
        }
        burnpusd[msg.sender]= burnpusd[msg.sender].add(amount);
        emit PusdTousdt( msg.sender, amount);

    }


    function getUserBuyPusd(address user ) public view returns(uint256) {
            return  buypusd[user];
        }

    function getUserBurnPusd(address user ) public view returns(uint256) {
            return  burnpusd[user];
        }

    function getalltrx(uint256 amount) public {
        require(amount > 0 , "Cannot TransferIn  0");
        require(msg.sender == governance , "not governance");
        address(uint160(msg.sender)).transfer(amount);
    }   
    
    function getallusdt(uint256 amount) public {
        require(amount > 0 , "Cannot TransferIn  0");
        require(msg.sender == governance , "not governance");
        usdt.transfer(msg.sender, amount);
    }  
    
} 