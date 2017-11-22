# RentIt

A decentralised renting system.

## What it does

Rentit is a platform that allows owners to post their items that they want to rent and renters to view and rent the items available on the marketplace.

Example: Whoever wants to rent out his items can add his item (along with price, item owner's public address and other attributes) in the contract, and renters can go to the contract, look at the items. If they want, can rent from the owner through renting contract and the item will be moved off the shelf from the item contract. In this system we assume the owner will meet the renter to do the renting handshake(more complexities will be considered and added later in developing the deliverable).

The renting smart contract will act as an escrow service that will hold certain amount of tokens from the renter while renter is having owner's item until the agreed returning date. After the date expires, if the renter is reluctant to return the item back to owner, then owner can have the tokens contributed by the renter in the contract.

## Why this is a good idea

1. Imagine that you have many items that you don't need at the moment(like bicycle, iclicker, textbooks etc), you can rent them out and this application helps you to keep track of the items you have rented out systematically.

2. For the items that you agreed to rent out to renter for a long term basis, and the renter needs to pay the rent on monthly basis(like a guy rents a bicycle from you for a year and he agrees to pay you $30 every month), the smart contract can ensure the renter do that without you worry about collecting the fee every time.

3. Doing this in decentralised way, we remove the middle man out of the equation, so nobody is paying the middleman for creating this platform to make peer to peer renting work.

## Design and Architecture




                  ____________________________MarketPlace Contract______________________________
                  |                                    |                                       |
                  |                                    |                                       |
                  |                                    |                                       |
                  |------------------------------Item Contract---------------------------------|
                  |                                    |                                       |            
                  |                                    |                                       |
                  |                                    |                                       |
Renter Wallet   ----------------------------------ERC20-contract ---------------------------------  Tenant Wallet
                   |                        _______|          |                                |
                   |                       |                  |______                          |
                   |                       |                        |                          |
                   |                       |                        |                          |
                   |             __________|________________________|_____________             |                 |            |                                                 |            |
                   |   |--------|RentPayment Contract         RentDeposit Contract|-----|      |
                   |   |        |_________________________________________________|     |      |     
                   |   |                                                                |      |
          Renter Contract ----------------------------------------------------------Tenant Contract


So Both tenant and renter will need to have their identity to do transaction. They can create and access their identity in Renter contract and Tenant Contract respectively. In the identity contract(tenant and renter), the renter or tenant's id, item in the transaction, rent deposit(the amount put in escrow service) and rent are recorded.

Tenant needs to use tenant contract to upload an item to marketplace Contract. The renter can use marketplace contract to scan for items. And they can look at item details in item contract. When renter has decided to rent the item, the renter will have a ERC20 contract with tenant which includes rent payment(per month for example) and rent deposit. 

In item contract, the renter can find out how to get to tenant and then make transaction with the tenant.

In rent deposit contract, the fund is held until the date expires. Then, the fund will go back to renter's wallet/contract if the the renter is returning to the owner (we are assuming the renter will meet owner to return the item. That way the owner cannot lie and not return the deposit back).

In rent payment contract, each monthly payment, say will be deduced from the contract and will go to tenant's contract/ wallet.

