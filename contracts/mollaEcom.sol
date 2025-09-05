// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
contract NoNEcom{
    struct Products{
        uint256 id;
        string names;
        string categorys;
        string image;
        uint256 price;
        uint256 review;
        uint256 stock;
    }
    struct Order {
        uint256 orderTime;
        Products product;
    }
    address private owner;
    mapping ( uint256 => Products ) public products;
    mapping ( address => mapping ( uint256 => Order )) public orders;
    mapping (address => uint256) public ordersCount;
    event ProdutList(string names, uint256 price, uint256 quality);
    event Purchase(address buyer, uint256 orderId, uint256 productid);
    constructor (){
        owner = msg.sender;
    }
    modifier onlyOwner(){
       require(msg.sender == owner, "You are not the owner");
        _;
    }
    function list(uint256 _id, string memory _name, string memory _category, string memory _image, uint256 _price, uint256 _review, uint256 _stock) public {
        products[_id] = Products(_id, _name, _category, _image, _price, _review, _stock);
        emit ProdutList(_name, _price, _stock);
    }
    function buy(uint256 _id) public payable  {
        Products memory product = products[_id];
        require(msg.value >= product.price, "Insufficient funds");
        require(product.stock >0 , "sorry the product is not available");
        products[_id].stock -= 1;
        // orders[msg.sender][_id] = Order(block.timestamp, product);
        Order memory order = Order(block.timestamp, product);
        orders[msg.sender][ordersCount[msg.sender]] = order;
        ordersCount[msg.sender] += 1;
        emit Purchase(msg.sender, ordersCount[msg.sender], product.id);
    }
    function withdorw() public onlyOwner{
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "transfer faild");
    }
}