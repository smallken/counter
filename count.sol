pragma solidity >=0.8.23;

 contract Count {
    int public count ;

    constructor () {
        count = 0;
    }

    function add()  public {
        count++;
    }

 }