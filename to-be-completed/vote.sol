// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract cityPoll {
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }

    mapping(uint256 => City) public cities; //mapping city Id with the City struct - cityId should be uint256
    mapping(address => bool) hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 0; // number of city added

    constructor() {
        //TODO set contract caller as owner
        //TODO set some intitial cities.

        owner = msg.sender;
        cities[cityCount] = City("Kathmandu", 0);
        cityCount++;
        cities[cityCount] = City("Lalitpur", 0);
        cityCount++;
        cities[cityCount] = City("Bhaktapur", 0);
    }

    function addCity(string memory _cityName) public {
        //  TODO: add city to the CityStruct

        cityCount++;
        cities[cityCount] = City(_cityName, 0);
    }

    function vote(uint256 _cityID) public {
        //TODO Vote the selected city through cityID

        require(hasVoted[msg.sender] == false, "Already voted");
        cities[_cityID].vote = cities[_cityID].vote + 1;
        hasVoted[msg.sender] = true;
    }

    function getCity(uint256 _cityID) public view returns (string memory) {
        // TODO get the city details through cityID

        return (cities[_cityID].cityName);
    }

    function getVote(uint256 _cityID) public view returns (uint256) {
        // TODO get the vote of the city with its ID

        return (cities[_cityID].vote);
    }
}
